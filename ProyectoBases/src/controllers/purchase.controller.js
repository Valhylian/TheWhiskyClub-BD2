import { getConnection, querys, sql } from "../database";

export const getProducts_store = async (req, res) => {
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
    res.render('purchase/purchase', { productsResult, typesResult });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const completePurchase_store = async (req, res) => {
  console.log(req.body.idStoreBought);
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
  res.send('success');
};

export const loadProducts_store = async (req, res) => {
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
    res.render('purchase/purchase', { productsResult, typesResult, id_Store });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

