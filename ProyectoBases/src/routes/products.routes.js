import { Router } from "express";
import { isAuthenticated } from "../helpers/auth";
import {
  getAllProducts_NotSpecial,
  getAllProducts_search,
} from "../controllers/products.controller";

const router = Router();
router.get("/products",isAuthenticated, getAllProducts_NotSpecial);
router.get("/products/getProductsSearch",isAuthenticated,getAllProducts_search);

//CONSULT PRODUCTS
router.post('/products/consult',isAuthenticated,getAllProducts_search);

export default router;
