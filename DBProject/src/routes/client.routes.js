import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
    consultClient,
    consultClient2,
    loadPurchases
} from "../controllers/client.controller";

const router = Router();
router.get("/getClientsInfo",isAdmin,consultClient);
router.post("/getClientsInfo",isAdmin,consultClient2);
router.post("/loadPurchaseInfo",isAdmin,loadPurchases);

export default router;