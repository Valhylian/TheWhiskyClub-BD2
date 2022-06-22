import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
    consultClient,
    consultClient2
} from "../controllers/client.controller";

const router = Router();
router.get("/getClientsInfo",isAdmin,consultClient);
router.post("/getClientsInfo",isAdmin,consultClient2);

export default router;