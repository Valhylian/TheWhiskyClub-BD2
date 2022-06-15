import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
    getProducts_store,
    loadProducts_store
} from "../controllers/purchase.controller";

const router = Router();
router.get("/purchase",isAuthenticated,getProducts_store);

router.post("/purchase",isAuthenticated,loadProducts_store);

export default router;
