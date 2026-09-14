import { Router } from "express";
import { getGeneros } from "../controladores/generos.controller.js";

const router = Router();

router.get("/", getGeneros);

export default router;