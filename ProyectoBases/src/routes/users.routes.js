import { Router } from "express";
import { getConnection, querys, sql } from "../database";
import passport from "passport";
import { isAuthenticated, isNotAuthenticated, isClient, isAdmin } from "../helpers/auth";
import { changeUserSubscription, updatePreferredAddress, addLocation,getInfoChangeAddress } from "../controllers/users.controller"

const router = Router();

//router.post("/users", verifyLogin);

//router.post("/users", createNewUser);


router.get('/users/subscription', isClient, (req, res) => {
  res.render('users/subscription');
});

router.get('/users/addAdress', isClient, (req, res) => {
  res.render('users/addAddress');
});

router.get('/users/changeSelectedAddress',isClient, getInfoChangeAddress);

router.post('/users/updateSelectedAddress',isClient, updatePreferredAddress);

router.get('/users/signin', isNotAuthenticated, (req, res) => {
  res.render('users/signin');
});

router.get('/users/signup', isNotAuthenticated, (req, res) => {
  res.render('users/signup');
});

router.get('/', (req, res) => {
  res.render('index');
});


router.post('/users/changeSubscription', isClient, changeUserSubscription);

router.post('/users/sendMarkerInfo', isClient, addLocation);


router.get('/users/logout', function (req, res, next) {
  req.logout(function (err) {
    if (err) { return next(err); }
    res.redirect('/');
  });
});

router.post('/users/signin', passport.authenticate('local', {
  successRedirect: '/',
  failureRedirect: '/users/signin',
  failureFlash: true,
  successFlash: true
}));

router.post('/users/signup', async (req, res) => {
  let errors = [];
  const { name, username, email, password, confirm_password, country, subscription, markerPositionLat, markerPositionLong, addressName } = req.body;
  Number(markerPositionLat);
  Number(markerPositionLong);
  if (password != confirm_password) {
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
      subscription,
      addressName
    });
  }
  else {

    try {
      const pool = await getConnection();
      const result = await pool
        .request()
        .input('nickname', req.body.username)
        .input('password', req.body.password)
        .input('full_name', req.body.name)
        .input('country_id', req.body.country)
        .input('email', req.body.email)
        .input('id_subscription', 1)
        .input('latitude', markerPositionLat)
        .input('longitude', markerPositionLong)
        .input('addressName', addressName)
        .execute(`CreateNewUser`);
      const newUser = result.recordset;
      //console.log(result.returnValue);
      if (markerPositionLat == '' || markerPositionLong == '') {
        errors.push({ text: "Please set the marker by pressing the map before you send the information."});
        res.render("users/signup", {
          errors,
          username,
          name,
          email,
          password,
          confirm_password,
          country,
          subscription,
          addressName
        });
        return;
      }
      if (result.returnValue != 0) {
        if (result.returnValue == 2) {
          errors.push({ text: "The username is already taken, please choose a different one"});
          res.render("users/signup", {
            errors,
            username,
            name,
            email,
            password,
            confirm_password,
            country,
            subscription,
            addressName
          });
          return;
        }
        if (result.returnValue == 3) {
          errors.push({ text: "The email address is already in use by an account"});
          res.render("users/signup", {
            errors,
            username,
            name,
            email,
            password,
            confirm_password,
            country,
            subscription,
            addressName
          });
          return;
        }
        errors.push({ text: "There has been an error during the creation process, please remember to click the map to set your address."});
        res.render("users/signup", {
          errors,
          username,
          name,
          email,
          password,
          confirm_password,
          country,
          subscription,
          addressName
        });
        return;
      }
      else {
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