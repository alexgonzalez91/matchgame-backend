import { pool } from "../data/db.js";

export async function getGeneros(req, res, next) {
  try {
    const [generos] = await pool.query(`
      SELECT
        id,
        nombre
      FROM generos
      ORDER BY nombre
    `);

    return res.status(200).json({
      ok: true,
      data: generos,
    });
  } catch (error) {
    next(error);

    return res.status(500).json({
      ok: false,
      message: "Error al obtener los géneros",
    });
  }
}