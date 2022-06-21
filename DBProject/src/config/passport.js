import passport from "passport";
const localStrategy = require("passport-local").Strategy;
import { getConnection, querys, sql } from "../database";


passport.use(new localStrategy(
  async (username, password, done) => {
    let clientEmail = '';
    let clientID = 0;
    let userType = 0;
    let shoppingCart = [];
    try {
      const pool = await getConnection();
      const result = await pool
        .request()
        .input('nickname', username)
        .input('password', password)
        .execute(`verifyLogin`);
      if (result.returnValue != 0) {
        if (result.returnValue == 2) {
          return done(null, false, { message: "User not found" });
        }
        else if (result.returnValue == 3) {
          return done(null, false, { message: "The given password and username combination was not found." });
        }
      }
      const loginInfo = result.recordset[0];
      clientEmail = loginInfo.emailClient;
      clientID = loginInfo.idClient;
      userType = loginInfo.userType;
    } catch (error) {
      console.log(error);
    }
    let user = { username, clientEmail, clientID, userType, shoppingCart};
    return done(null, user, { message: "You are now logged in." });
  }));


passport.serializeUser((user, done) => {
  done(null, user);
});

passport.deserializeUser((userId, done) => {
  done(null, userId);
});

