import { pool } from "../data/db.js";

export async function getPlataformas(req, res, next) {
  try {
    const [plataformas] = await pool.query(`
      SELECT
        id,
        nombre
      FROM plataformas
      ORDER BY nombre
    `);

    return res.status(200).json({
      ok: true,
      data: plataformas,
    });
  } catch (error) {
    next(error);

    return res.status(500).json({
      ok: false,
      message: "Error al obtener las plataformas",
    });
  }
}