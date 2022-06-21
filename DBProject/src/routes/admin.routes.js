import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
    getInfoCreateProduct,
    uploadNewProduct,
    getInfoPurchase_FirstCall,
    getInfoPurchase,
    processPurchase
} from "../controllers/admin.controller";

const router = Router();

router.get("/createNewProduct",isAdmin, getInfoCreateProduct);

router.post("/uploadNewProduct",isAdmin, uploadNewProduct);



//PURCHASES
router.get("/processPurchase",isAdmin,getInfoPurchase_FirstCall);
router.post("/processPurchaseConsult",isAdmin, getInfoPurchase);
router.post("/processPurchase",isAdmin, processPurchase);

export default router;
