import { getConnection, querys, sql } from "../database";


export const getAllProducts_NotSpecial = async (req, res) => {
  try {
    const pool = await getConnection();
    const result = await pool.request()
      .input('id_client', req.user.clientID)
      .execute(`consultProducts`);
    const productsResult = result.recordset;

    const resultTypes = await pool.request()
      .execute(`returnProductTypes`);
    const typesResult = resultTypes.recordset;

    res.render('products/getProducts', { productsResult, typesResult });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const addProductToCart = (req, res) => {
  const { idProduct, quantity } = req.body;
  var boughtProductInfo = {
    idProduct: idProduct,
    quantity: Number(quantity),
  };
  JSON.stringify(boughtProductInfo);
  req.user.shoppingCart.push(boughtProductInfo);
  res.send('success');
};


export const getAllProducts_search = async (req, res) => {
  try {
    const pool = await getConnection();
    const { ids_ProductType, poductName, lowPrice, higPrice, distance, order } = req.body;
    const result = await pool.request()
      .input('id_client', req.user.clientID)
      .input('id_productType_', ids_ProductType)
      .input('product_name_', poductName)
      .input('lowPrice_', lowPrice)
      .input('higPrice_', higPrice)
      .input('distance_', distance)
      .input('order_', order)
      .execute(`consultProductsParameters`);

    const productsResult = result.recordset;
    const resultTypes = await pool.request()
      .execute(`returnProductTypes`);
    const typesResult = resultTypes.recordset;
    res.render('products/getProductsSearch', { productsResult, typesResult });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};
