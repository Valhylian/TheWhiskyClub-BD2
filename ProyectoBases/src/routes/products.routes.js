import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
  getAllProducts_NotSpecial,
  getAllProducts_search,
  addProductToCart,
} from "../controllers/products.controller";

const router = Router();
router.get("/products",isAuthenticated, getAllProducts_NotSpecial);
router.get("/products/getProductsSearch",isAuthenticated,getAllProducts_search);

//CONSULT PRODUCTS
router.post('/products/consult',isAuthenticated,getAllProducts_search);

router.post('/products/addToCart',isAuthenticated,addProductToCart);

export default router;
