import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
    getProducts_store,
    loadProducts_store,
    completePurchase_store
} from "../controllers/purchase.controller";

const router = Router();
router.get("/purchase",isClient,getProducts_store);

router.post("/purchase",isClient,loadProducts_store);

router.post("/purchase/completePurchase",isClient,completePurchase_store);

export default router;
