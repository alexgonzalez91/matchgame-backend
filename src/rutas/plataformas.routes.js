import { Router } from "express";
import {
  getPlataformas,
} from "../controladores/plataformas.controller.js";

const router = Router();

router.get("/", getPlataformas);

export default router;