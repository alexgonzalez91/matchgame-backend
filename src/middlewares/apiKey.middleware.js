export function requireApiKey(req, res, next) {
  const apiKey = req.get("x-api-key");

  if (!process.env.API_KEY) {
    console.error("La variable API_KEY no está configurada");

    return res.status(500).json({
      ok: false,
      message: "Error de configuración del servidor",
    });
  }

  if (!apiKey) {
    return res.status(401).json({
      ok: false,
      message: "API key requerida",
    });
  }

  if (apiKey !== process.env.API_KEY) {
    return res.status(403).json({
      ok: false,
      message: "API key no válida",
    });
  }

  next();
}