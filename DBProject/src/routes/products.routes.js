import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
  getAllProducts_NotSpecial,
  getAllProducts_search,
  addProductToCart,
  reviewProduct,
  sendReviewProduct,
  viewReviewProduct
} from "../controllers/products.controller";

const router = Router();
router.get("/products",isAuthenticated, getAllProducts_NotSpecial);
router.get("/products/getProductsSearch",isAuthenticated,getAllProducts_search);

//CONSULT PRODUCTS
router.post('/products/consult',isAuthenticated,getAllProducts_search);
router.post('/products/addToCart',isAuthenticated,addProductToCart);

//REVIEW PRODUCT
router.post('/products/review',isAuthenticated,reviewProduct,); //load pag to make review
router.post('/products/sendReview',isAuthenticated,sendReviewProduct,); //load pag to make review
router.post('/products/viewReview',isAuthenticated,viewReviewProduct,); //load pag to view review of a product

export default router;
