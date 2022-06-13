import { Router } from "express";
import {
    createNewUser
  } from "../controllers/users.controller";

const router = Router();

//router.post("/users", verifyLogin);

//router.post("/users", createNewUser);

router.get('/users/signin', (req,res) =>{
  res.render('users/signin');
});

router.get('/users/signup', (req,res) =>{
  res.render('users/signup');
});

router.post('/users/signup', createNewUser);



export default router;