import { pool } from "../data/db.js";

export async function getJuegos(req, res, next) {
  try {
    const {
      buscar,
      genero,
      plataforma,
      orden,
      page = "1",
      limit = "12",
    } = req.query;

    const pageNumero = Number(page);
    const limitNumero = Number(limit);

    if (!Number.isInteger(pageNumero) || pageNumero <= 0) {
      return res.status(400).json({
        ok: false,
        message: "page debe ser un número entero positivo",
      });
    }

    if (
      !Number.isInteger(limitNumero) ||
      limitNumero <= 0 ||
      limitNumero > 50
    ) {
      return res.status(400).json({
        ok: false,
        message: "limit debe ser un número entero entre 1 y 50",
      });
    }

    const condiciones = [];
    const valores = [];

    if (buscar) {
      condiciones.push("juegos.titulo LIKE ?");
      valores.push(`%${buscar.trim()}%`);
    }

    if (genero) {
      condiciones.push("generos.nombre = ?");
      valores.push(genero.trim());
    }

    if (plataforma) {
      condiciones.push(`
        EXISTS (
          SELECT 1
          FROM juego_plataforma
          JOIN plataformas
            ON juego_plataforma.plataforma_id = plataformas.id
          WHERE juego_plataforma.juego_id = juegos.id
            AND plataformas.nombre = ?
        )
      `);

      valores.push(plataforma.trim());
    }

    const whereSql =
      condiciones.length > 0
        ? ` WHERE ${condiciones.join(" AND ")}`
        : "";

    const ordenesPermitidos = {
  titulo_asc: "juegos.titulo ASC",
  titulo_desc: "juegos.titulo DESC",
  puntuacion_asc: "juegos.puntuacion ASC",
  puntuacion_desc: "juegos.puntuacion DESC",
  fecha_asc: "juegos.fecha_lanzamiento ASC",
  fecha_desc: "juegos.fecha_lanzamiento DESC",
};

if (orden && !ordenesPermitidos[orden]) {
  return res.status(400).json({
    ok: false,
    message: "El valor de orden no es válido",
  });
}

const ordenSql =
  ordenesPermitidos[orden] || ordenesPermitidos.titulo_asc;

    const [conteo] = await pool.query(
      `
        SELECT COUNT(*) AS total
        FROM juegos
        JOIN generos
          ON juegos.genero_id = generos.id
        ${whereSql}
      `,
      valores
    );

    const total = conteo[0].total;
    const totalPages = Math.ceil(total / limitNumero);
    const offset = (pageNumero - 1) * limitNumero;

    const sql = `
      SELECT
        juegos.id,
        juegos.titulo,
        juegos.descripcion,
        juegos.imagen,
        juegos.fecha_lanzamiento,
        juegos.puntuacion,
        generos.nombre AS genero
      FROM juegos
      JOIN generos
        ON juegos.genero_id = generos.id
      ${whereSql}
      ORDER BY ${ordenSql}
      LIMIT ?
      OFFSET ?
    `;

    const valoresFinales = [
      ...valores,
      limitNumero,
      offset,
    ];

    const [juegos] = await pool.query(sql, valoresFinales);

    return res.status(200).json({
      ok: true,
      data: juegos,
      pagination: {
        page: pageNumero,
        limit: limitNumero,
        total,
        totalPages,
      },
    });
  } catch (error) {
      next(error);

  }
}

export async function getJuegoById(req, res, next) {
  try {
    const id = Number(req.params.id);

    if (!Number.isInteger(id) || id <= 0) {
      return res.status(400).json({
        ok: false,
        message: "El ID debe ser un número entero positivo",
      });
    }

    const [juegos] = await pool.query(
      `
        SELECT
          juegos.id,
          juegos.titulo,
          juegos.descripcion,
          juegos.imagen,
          juegos.fecha_lanzamiento,
          juegos.puntuacion,
          generos.nombre AS genero
        FROM juegos
        JOIN generos
          ON juegos.genero_id = generos.id
        WHERE juegos.id = ?
      `,
      [id]
    );

    if (juegos.length === 0) {
      return res.status(404).json({
        ok: false,
        message: "Juego no encontrado",
      });
    }

    const [plataformas] = await pool.query(
      `
        SELECT plataformas.nombre
        FROM juego_plataforma
        JOIN plataformas
          ON juego_plataforma.plataforma_id = plataformas.id
        WHERE juego_plataforma.juego_id = ?
        ORDER BY plataformas.nombre
      `,
      [id]
    );

    const [resenas] = await pool.query(
      `
        SELECT
          puntuacion,
          comentario,
          etiqueta
        FROM resenas_editoriales
        WHERE juego_id = ?
      `,
      [id]
    );

    const juego = {
      ...juegos[0],
      plataformas: plataformas.map((plataforma) => plataforma.nombre),
      resena: resenas[0] || null,
    };

    return res.status(200).json({
      ok: true,
      data: juego,
    });
  } catch (error) {
      next(error);


    return res.status(500).json({
      ok: false,
      message: "Error al obtener el juego",
    });
  }
}

export async function createJuego(req, res, next) {
  let connection;

  try {
    const {
      titulo,
      descripcion,
      imagen,
      fecha_lanzamiento,
      puntuacion,
      genero_id,
      plataforma_ids,
    } = req.body;

    if (!titulo?.trim() || !descripcion?.trim() || !genero_id) {
      return res.status(400).json({
        ok: false,
        message: "Título, descripción y género son obligatorios",
      });
    }

    const generoIdNumero = Number(genero_id);

    if (!Number.isInteger(generoIdNumero) || generoIdNumero <= 0) {
      return res.status(400).json({
        ok: false,
        message: "genero_id debe ser un número entero positivo",
      });
    }

    if (
      puntuacion !== undefined &&
      puntuacion !== null &&
      (!Number.isFinite(Number(puntuacion)) ||
        Number(puntuacion) < 0 ||
        Number(puntuacion) > 10)
    ) {
      return res.status(400).json({
        ok: false,
        message: "La puntuación debe estar entre 0 y 10",
      });
    }

    if (
      !Array.isArray(plataforma_ids) ||
      plataforma_ids.length === 0
    ) {
      return res.status(400).json({
        ok: false,
        message: "Debes indicar al menos una plataforma",
      });
    }

    const plataformasIds = [
      ...new Set(plataforma_ids.map(Number)),
    ];

    const plataformasValidas = plataformasIds.every(
      (id) => Number.isInteger(id) && id > 0
    );

    if (!plataformasValidas) {
      return res.status(400).json({
        ok: false,
        message:
          "plataforma_ids debe contener únicamente IDs enteros positivos",
      });
    }

    const [generos] = await pool.query(
      "SELECT id FROM generos WHERE id = ?",
      [generoIdNumero]
    );

    if (generos.length === 0) {
      return res.status(400).json({
        ok: false,
        message: "El género indicado no existe",
      });
    }

    const placeholders = plataformasIds
      .map(() => "?")
      .join(", ");

    const [plataformas] = await pool.query(
      `
        SELECT id
        FROM plataformas
        WHERE id IN (${placeholders})
      `,
      plataformasIds
    );

    if (plataformas.length !== plataformasIds.length) {
      return res.status(400).json({
        ok: false,
        message: "Una o más plataformas no existen",
      });
    }

    connection = await pool.getConnection();

    await connection.beginTransaction();

    const [resultado] = await connection.query(
      `
        INSERT INTO juegos (
          titulo,
          descripcion,
          imagen,
          fecha_lanzamiento,
          puntuacion,
          genero_id
        )
        VALUES (?, ?, ?, ?, ?, ?)
      `,
      [
        titulo.trim(),
        descripcion.trim(),
        imagen ?? null,
        fecha_lanzamiento ?? null,
        puntuacion ?? null,
        generoIdNumero,
      ]
    );

    const juegoId = resultado.insertId;

    const relaciones = plataformasIds.map(
      (plataformaId) => [juegoId, plataformaId]
    );

    await connection.query(
      `
        INSERT INTO juego_plataforma (
          juego_id,
          plataforma_id
        )
        VALUES ?
      `,
      [relaciones]
    );

    await connection.commit();

    return res.status(201).json({
      ok: true,
      message: "Juego creado correctamente",
      data: {
        id: juegoId,
        titulo: titulo.trim(),
        descripcion: descripcion.trim(),
        imagen: imagen ?? null,
        fecha_lanzamiento: fecha_lanzamiento ?? null,
        puntuacion: puntuacion ?? null,
        genero_id: generoIdNumero,
        plataforma_ids: plataformasIds,
      },
    });
  } catch (error) {
    if (connection) {
      await connection.rollback();
    }

    next(error);
  } finally {
    if (connection) {
      connection.release();
    }
  }
}

export async function updateJuego(req, res, next) {
  let connection;

  try {
    const id = Number(req.params.id);

    if (!Number.isInteger(id) || id <= 0) {
      return res.status(400).json({
        ok: false,
        message: "El ID debe ser un número entero positivo",
      });
    }

    const {
      titulo,
      descripcion,
      imagen,
      fecha_lanzamiento,
      puntuacion,
      genero_id,
      plataforma_ids,
    } = req.body;

    const campos = [];
    const valores = [];

    if (titulo !== undefined) {
      if (typeof titulo !== "string" || !titulo.trim()) {
        return res.status(400).json({
          ok: false,
          message: "El título no puede estar vacío",
        });
      }

      campos.push("titulo = ?");
      valores.push(titulo.trim());
    }

    if (descripcion !== undefined) {
      if (
        typeof descripcion !== "string" ||
        !descripcion.trim()
      ) {
        return res.status(400).json({
          ok: false,
          message: "La descripción no puede estar vacía",
        });
      }

      campos.push("descripcion = ?");
      valores.push(descripcion.trim());
    }

    if (imagen !== undefined) {
      campos.push("imagen = ?");
      valores.push(imagen ?? null);
    }

    if (fecha_lanzamiento !== undefined) {
      campos.push("fecha_lanzamiento = ?");
      valores.push(fecha_lanzamiento ?? null);
    }

    if (puntuacion !== undefined) {
      if (
        puntuacion !== null &&
        (!Number.isFinite(Number(puntuacion)) ||
          Number(puntuacion) < 0 ||
          Number(puntuacion) > 10)
      ) {
        return res.status(400).json({
          ok: false,
          message: "La puntuación debe estar entre 0 y 10",
        });
      }

      campos.push("puntuacion = ?");
      valores.push(
        puntuacion === null ? null : Number(puntuacion)
      );
    }

    let generoIdNumero;

    if (genero_id !== undefined) {
      generoIdNumero = Number(genero_id);

      if (
        !Number.isInteger(generoIdNumero) ||
        generoIdNumero <= 0
      ) {
        return res.status(400).json({
          ok: false,
          message:
            "genero_id debe ser un número entero positivo",
        });
      }
    }

    let plataformasIds;

    if (plataforma_ids !== undefined) {
      if (
        !Array.isArray(plataforma_ids) ||
        plataforma_ids.length === 0
      ) {
        return res.status(400).json({
          ok: false,
          message:
            "plataforma_ids debe contener al menos una plataforma",
        });
      }

      plataformasIds = [
        ...new Set(plataforma_ids.map(Number)),
      ];

      const plataformasValidas = plataformasIds.every(
        (plataformaId) =>
          Number.isInteger(plataformaId) &&
          plataformaId > 0
      );

      if (!plataformasValidas) {
        return res.status(400).json({
          ok: false,
          message:
            "plataforma_ids debe contener únicamente IDs enteros positivos",
        });
      }
    }

    if (
      campos.length === 0 &&
      genero_id === undefined &&
      plataforma_ids === undefined
    ) {
      return res.status(400).json({
        ok: false,
        message: "No se han enviado campos para actualizar",
      });
    }

    connection = await pool.getConnection();
    await connection.beginTransaction();

    const [juegos] = await connection.query(
      "SELECT id FROM juegos WHERE id = ?",
      [id]
    );

    if (juegos.length === 0) {
      await connection.rollback();

      return res.status(404).json({
        ok: false,
        message: "Juego no encontrado",
      });
    }

    if (genero_id !== undefined) {
      const [generos] = await connection.query(
        "SELECT id FROM generos WHERE id = ?",
        [generoIdNumero]
      );

      if (generos.length === 0) {
        await connection.rollback();

        return res.status(400).json({
          ok: false,
          message: "El género indicado no existe",
        });
      }

      campos.push("genero_id = ?");
      valores.push(generoIdNumero);
    }

    if (plataforma_ids !== undefined) {
      const placeholders = plataformasIds
        .map(() => "?")
        .join(", ");

      const [plataformas] = await connection.query(
        `
          SELECT id
          FROM plataformas
          WHERE id IN (${placeholders})
        `,
        plataformasIds
      );

      if (plataformas.length !== plataformasIds.length) {
        await connection.rollback();

        return res.status(400).json({
          ok: false,
          message: "Una o más plataformas no existen",
        });
      }
    }

    if (campos.length > 0) {
      valores.push(id);

      await connection.query(
        `
          UPDATE juegos
          SET ${campos.join(", ")}
          WHERE id = ?
        `,
        valores
      );
    }

    if (plataforma_ids !== undefined) {
      await connection.query(
        "DELETE FROM juego_plataforma WHERE juego_id = ?",
        [id]
      );

      const relaciones = plataformasIds.map(
        (plataformaId) => [id, plataformaId]
      );

      await connection.query(
        `
          INSERT INTO juego_plataforma (
            juego_id,
            plataforma_id
          )
          VALUES ?
        `,
        [relaciones]
      );
    }

    await connection.commit();

    const [juegoActualizado] = await pool.query(
      `
        SELECT
          juegos.id,
          juegos.titulo,
          juegos.descripcion,
          juegos.imagen,
          juegos.fecha_lanzamiento,
          juegos.puntuacion,
          generos.nombre AS genero
        FROM juegos
        JOIN generos
          ON juegos.genero_id = generos.id
        WHERE juegos.id = ?
      `,
      [id]
    );

    const [plataformasActualizadas] = await pool.query(
      `
        SELECT plataformas.nombre
        FROM juego_plataforma
        JOIN plataformas
          ON juego_plataforma.plataforma_id = plataformas.id
        WHERE juego_plataforma.juego_id = ?
        ORDER BY plataformas.nombre
      `,
      [id]
    );

    return res.status(200).json({
      ok: true,
      message: "Juego actualizado correctamente",
      data: {
        ...juegoActualizado[0],
        plataformas: plataformasActualizadas.map(
          (plataforma) => plataforma.nombre
        ),
      },
    });
  } catch (error) {
    if (connection) {
      await connection.rollback();
    }

    next(error);
  } finally {
    if (connection) {
      connection.release();
    }
  }
}

export async function deleteJuego(req, res, next) {
  const connection = await pool.getConnection();

  try {
    const id = Number(req.params.id);

    if (!Number.isInteger(id) || id <= 0) {
      return res.status(400).json({
        ok: false,
        message: "El ID debe ser un número entero positivo",
      });
    }

    const [juegos] = await connection.query(
      "SELECT id FROM juegos WHERE id = ?",
      [id]
    );

    if (juegos.length === 0) {
      return res.status(404).json({
        ok: false,
        message: "Juego no encontrado",
      });
    }

    await connection.beginTransaction();

    await connection.query(
      "DELETE FROM juego_plataforma WHERE juego_id = ?",
      [id]
    );

    await connection.query(
      "DELETE FROM resenas_editoriales WHERE juego_id = ?",
      [id]
    );

    await connection.query(
      "DELETE FROM juegos WHERE id = ?",
      [id]
    );

    await connection.commit();

    return res.status(200).json({
      ok: true,
      message: "Juego eliminado correctamente",
    });
  } catch (error) {
  await connection.rollback();
  next(error);
} finally {
  connection.release();
}
}