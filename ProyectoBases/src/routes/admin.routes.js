import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
    getInfoCreateProduct,
    uploadNewProduct
} from "../controllers/admin.controller";

const router = Router();

router.get("/createNewProduct",isAdmin, getInfoCreateProduct);

router.post("/uploadNewProduct",isAdmin, uploadNewProduct);

export default router;
