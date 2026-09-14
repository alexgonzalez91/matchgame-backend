import { Router } from "express";
import {
  getJuegos,
  getJuegoById,
  createJuego,
  updateJuego,
  deleteJuego,
} from "../controladores/juegos.controller.js";
import { requireApiKey } from "../middlewares/apiKey.middleware.js";

const router = Router();

router.get("/", getJuegos);
router.get("/:id", getJuegoById);

router.post("/", requireApiKey, createJuego);
router.patch("/:id", requireApiKey, updateJuego);
router.delete("/:id", requireApiKey, deleteJuego);

export default router;