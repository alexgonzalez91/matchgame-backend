import { Router } from "express";
import { getResenas } from "../controladores/resenas.controller.js";

const router = Router();

router.get("/", getResenas);

export default router;