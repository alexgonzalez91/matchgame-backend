import express from "express";
import cors from "cors";
import dotenv from "dotenv";

import juegosRoutes from "./rutas/juegos.routes.js";
import generosRoutes from "./rutas/generos.routes.js";
import plataformasRoutes from "./rutas/plataformas.routes.js";
import resenasRoutes from "./rutas/resenas.routes.js";
import etiquetasRoutes from "./rutas/etiquetas.routes.js";

import { notFound } from "./middlewares/notFound.middleware.js";
import { errorHandler } from "./middlewares/errorHandler.middleware.js";

dotenv.config();

const app = express();

const PORT = process.env.PORT || 3000;

const allowedOrigins = [
  "http://localhost:4321",
  process.env.FRONTEND_URL,
].filter(Boolean);

app.use(
  cors({
    origin: allowedOrigins,
  })
);

app.use(express.json());

app.get("/", (req, res) => {
  return res.status(200).json({
    ok: true,
    message: "API MatchGame publicada",
  });
});

app.get("/api/health", (req, res) => {
  return res.status(200).json({
    ok: true,
    message: "MatchGame API funcionando",
  });
});

app.use("/api/juegos", juegosRoutes);
app.use("/api/generos", generosRoutes);
app.use("/api/plataformas", plataformasRoutes);
app.use("/api/resenas", resenasRoutes);
app.use("/api/etiquetas", etiquetasRoutes);

app.use(notFound);
app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`API lista en el puerto ${PORT}`);
});