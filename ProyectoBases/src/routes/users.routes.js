import { Router } from "express";
import { getConnection, querys, sql } from "../database";
import passport from "passport";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import { changeUserSubscription } from "../controllers/users.controller"

const router = Router();

//router.post("/users", verifyLogin);

//router.post("/users", createNewUser);


router.get('/users/subscription',isClient, (req,res) =>{
  res.render('users/subscription');
});


router.get('/users/signin', (req,res) =>{
  res.render('users/signin');
});

router.get('/users/signup', (req,res) =>{
  res.render('users/signup');
});

router.get('/', (req,res) =>{
  res.render('index');
});


router.post('/users/changeSubscription',isClient,changeUserSubscription);


router.get('/users/logout', function(req, res, next) {
  req.logout(function(err) {
    if (err) { return next(err); }
    res.redirect('/');
  });
});

router.post('/users/signin', passport.authenticate('local',{
  successRedirect: '/',
  failureRedirect: '/users/signin',
  failureFlash: true,
  successFlash: true
}));

router.post('/users/signup', async (req,res) =>{
  let errors = [];
  const {name,username,email,password,confirm_password,country,subscription} = req.body;
  if(password != confirm_password){
    errors.push({ text: "Passwords do not match." });
  }
  if (password.length < 6) {
    errors.push({ text: "Passwords must be at least 6 characters." });
  }
  if (errors.length > 0) {
    res.render("users/signup", {
      errors,
      username,
      name,
      email,
      password,
      confirm_password,
      country,
      subscription
    });
  }
  else{
    
    try {
      const pool = await getConnection();
      const result = await pool
        .request()
          .input('nickname', req.body.username)
          .input('password', req.body.password)
          .input('full_name', req.body.name)
          .input('country_id', req.body.country)
          .input('email', req.body.email)
          .input('id_subscription', req.body.subscription)
          .execute(`CreateNewUser`);
      const newUser = result.recordset;
      //console.log(result.returnValue);
      if (result.returnValue != 0) {
        if(result.returnValue == 2){
          req.flash("error_msg", "The username is already taken, please choose a different one" );
          res.redirect("/users/signup");
        }
        else if(result.returnValue == 3){
          req.flash("error_msg", "The email address is already in use by an account" );
          res.redirect("/users/signup");
        }
      }
      else{
        req.flash("success_msg", "You have registered successfully.");
        res.redirect("/users/signin");
      }
      res.json(newUser);
      } catch (error) {
          res.status(500).json(error);
      }
      
    }
    
});



export default router;