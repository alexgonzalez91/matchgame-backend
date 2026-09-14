import { Router } from "express";
import {
  getEtiquetas,
} from "../controladores/etiquetas.controller.js";

const router = Router();

router.get("/", getEtiquetas);

export default router;