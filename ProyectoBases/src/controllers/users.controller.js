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

export const loadPageSubscription = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool
      .request()
      .execute(`getSubscriptionCatalog`);
    const subscriptionInfo = result.recordset;
    res.render("users/subscription", { subscriptionInfo });
  } catch (error) {
    res.status(500).json(error);
  }
};

export const addLocation = async (req, res) => {
  try {
    const { markerPositionLat, markerPositionLong, addressName } = req.body;
    Number(markerPositionLat);
    Number(markerPositionLong);
    if (markerPositionLat == '' || markerPositionLong == '') {
      req.flash("error_msg", "Please set the marker by pressing the map before you send the information.");
      res.redirect("/users/addAdress");
      return;
    }
    else {
      const pool = await getConnection();
      const resultAddAdress = await pool.
        request()
        .input('idClient_', req.user.clientID)
        .input('latitude', markerPositionLat)
        .input('longitude', markerPositionLong)
        .input('name', addressName)
        .execute(`insertLocation`);
      const addProduct = resultAddAdress.recordset;
      if (resultAddAdress.returnValue == 2) {
        req.flash("error_msg", "You already have an address with this name, please choose a differente one.");
        res.redirect("/users/addAdress");
        return;
      }
      else if (resultAddAdress.returnValue == 1) {
        req.flash("error_msg", "The address wasn't created due to an error.");
        res.redirect("/users/addAdress");
        return;
      }
      else {
        req.flash("success_msg", "Address saved.");
        res.redirect("/users/addAdress");
        return;
      }
    }
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

export const getInfoChangeAddress = async (req, res) => {
  try {
    const pool = await getConnection();
    const resultUserAddresses = await pool.request()
      .input('idClient_', req.user.clientID)
      .execute(`getUserAddresses`);
    const addressesResult = resultUserAddresses.recordset;
    //console.log(addressesResult);
    res.render('users/changeSelectedAddress', { addressesResult });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const updatePreferredAddress = async (req, res) => {
  try {
    const pool = await getConnection();
    //console.log(req.body.idSelectedAddress);
    const resultUserAddresses = await pool.request()
      .input('idClient_', req.user.clientID)
      .input('preferredLocationId', req.body.idSelectedAddress)
      .execute(`changePreferredAddress`);
    const addressesResult = resultUserAddresses.recordset;
    if (resultUserAddresses.returnValue == 0) {
      req.flash("success_msg", "You have changed your preferred address.");
      res.redirect("/");
    }
    else {
      req.flash("error_msg", "There has been an error on the update of your preferred address, please try again.");
      res.redirect("/users/changeSelectedAddress");
    }
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};