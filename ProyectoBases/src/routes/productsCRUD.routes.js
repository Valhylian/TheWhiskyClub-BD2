import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
const router = Router();
import {loadProductsMenu,loadProductInfo, loadProductInfoUpdate,uploadUpdateProduct} from "../controllers/productsCRUD.controller"


router.get('/productsMenu',isAdmin,loadProductsMenu);

router.post('/loadProductInfo',isAdmin,loadProductInfo);

router.post('/loadProductInfoUpdate',isAdmin,loadProductInfoUpdate);

router.post('/uploadUpdateProduct',isAdmin,uploadUpdateProduct)
export default router;