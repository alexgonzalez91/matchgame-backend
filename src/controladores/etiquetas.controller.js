import { pool } from "../data/db.js";

export async function getEtiquetas(req, res, next) {
  try {
    const [etiquetas] = await pool.query(`
      SELECT DISTINCT etiqueta
      FROM resenas_editoriales
      WHERE etiqueta IS NOT NULL
        AND etiqueta <> ''
      ORDER BY etiqueta
    `);

    const nombres = etiquetas.map(
      (etiqueta) => etiqueta.etiqueta
    );

    return res.status(200).json({
      ok: true,
      data: nombres,
    });
  } catch (error) {
    next(error);
  }
}