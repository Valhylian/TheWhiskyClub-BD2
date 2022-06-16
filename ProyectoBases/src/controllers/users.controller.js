import { getConnection, querys, sql } from "../database";


export const createNewUser = async (req, res) => {
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
    
    res.json(newUser);
  } catch (error) {
    res.status(500).json(error);
  }
};

export const changeUserSubscription = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request()
      .input('newPlan', req.body.newSubscription)
      .input('username', req.user.username)
      .execute(`ChangeAccountSubscription`);
    req.flash("success_msg", "You have changed your account plan.");
    res.redirect("/");
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};