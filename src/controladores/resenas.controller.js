import { pool } from "../data/db.js";

export async function getResenas(req, res, next) {
  try {
    const { etiqueta } = req.query;

    const condiciones = [];
    const valores = [];

    if (etiqueta) {
      condiciones.push("resenas_editoriales.etiqueta = ?");
      valores.push(etiqueta.trim());
    }

    const whereSql =
      condiciones.length > 0
        ? `WHERE ${condiciones.join(" AND ")}`
        : "";

    const [resenas] = await pool.query(
      `
        SELECT
          resenas_editoriales.id,
          resenas_editoriales.juego_id,
          juegos.titulo,
          resenas_editoriales.puntuacion,
          resenas_editoriales.comentario,
          resenas_editoriales.etiqueta,
          resenas_editoriales.fecha_creacion
        FROM resenas_editoriales
        JOIN juegos
          ON resenas_editoriales.juego_id = juegos.id
        ${whereSql}
        ORDER BY resenas_editoriales.puntuacion DESC
      `,
      valores
    );

    return res.status(200).json({
      ok: true,
      data: resenas,
    });
  } catch (error) {
    next(error);

    return res.status(500).json({
      ok: false,
      message: "Error al obtener las reseñas editoriales",
    });
  }
}