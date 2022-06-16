import { getConnection, querys, sql } from "../database";

export const getProducts_store = async (req, res) => {
  let errors = [];
  errors.push({ text: "Your cart has been emptied!" });
  req.user.shoppingCart = [];
  try {
    const pool = await getConnection();
    const result = await pool.request()
      .input('id_client', req.user.clientID)
      .input('id_store_', 1)
      .execute(`consultProductsXStore`);

    const productsResult = result.recordset;
    const resultStore = await pool.request()
      .execute(`returnStores`);

    const typesResult = resultStore.recordset;
    req.flash("error_msg", "Your cart has been emptied!");
    res.render('purchase/purchase', { productsResult, typesResult,errors });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }

};

export const completePurchase_store = async (req, res) => {
  console.log(req.body.idStoreBought);
  console.log("hola");
  const shoppingCart = req.user.shoppingCart;
  let result = shoppingCart.reduce((r, { idProduct, quantity }) => {
    var temp = r.find(o => o.idProduct === idProduct);
    if (!temp) {
      r.push({ idProduct, quantity });
    } else {
      temp.quantity += quantity;
    }
    return r;
  }, []);
  console.log(JSON.stringify(result));
  const jsonProducts_ = JSON.stringify(result)
  //GENERATE PURCHASE
  try {
    let idStoreSelected = req.body.idStoreBought;
    if(idStoreSelected == ''){
      idStoreSelected = 1;
      console.log('paso');
    }
    const pool = await getConnection();
    const result = await pool.request()
      .input('idClient_', req.user.clientID)
      .input('jsonProducts_', jsonProducts_)
      .input('idStore_', idStoreSelected)
      .execute(`generatePurchase`);
    const productsResult = result.recordset; //RETURN ERRORS TABLE
    console.log("productsResult")
    console.log(result)
    //INFO PURCHASE
    const resultTypes = await pool.request()
      .execute(`returnPurchase`);
    const purchaseInfo = resultTypes.recordset;
    
    res.render('purchase/purchaseConfirm', { productsResult,purchaseInfo});
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }

};

export const loadProducts_store = async (req, res) => {
  let errors = [];
  errors.push({ text: "Your cart has been emptied!" });
  req.user.shoppingCart = [];
  try {
    const pool = await getConnection();
    const { id_Store } = req.body;
    const result = await pool.request()

      .input('id_client', req.user.clientID)
      .input('id_store_', id_Store)
      .execute(`consultProductsXStore`);

    const productsResult = result.recordset;
    const resultStore = await pool.request()
      .execute(`returnStores`);

    const typesResult = resultStore.recordset;
    req.flash("error_msg", "Your cart has been emptied!");
    res.render('purchase/purchase', { productsResult, typesResult, id_Store,errors });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

