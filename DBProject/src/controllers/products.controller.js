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
    
    //console.log(imagePr2);

    productsResult.forEach(element => {
      if (element.product_image != null){
        element.product_image = "data:image/gif;base64,"+element.product_image.toString('base64')
        //console.log(element.product_image);
        //prueba = element.product_image
      }
      
    });
    //console.log(prueba);
    //console.log(imagePr2);
    res.render('products/getProducts', {productsResult, typesResult });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};



export const addProductToCart = (req, res) => {
  const { idProduct, quantity } = req.body;
  var boughtProductInfo = {
    idProduct: Number(idProduct),
    quantity: Number(quantity),
  };
  JSON.stringify(boughtProductInfo);
  req.user.shoppingCart.push(boughtProductInfo);
  res.send('success');
};


export const getAllProducts_search = async (req, res) => {
  try {
    const pool = await getConnection();
    const { ids_ProductType, poductName, lowPrice, higPrice, distance, order, amount_purchase } = req.body;
    const result = await pool.request()
      .input('id_client', req.user.clientID)
      .input('id_productType_', ids_ProductType)
      .input('product_name_', poductName)
      .input('lowPrice_', lowPrice)
      .input('higPrice_', higPrice)
      .input('distance_', distance)
      .input('orderByPurchase', amount_purchase)
      .input('order_', order)
      .execute(`consultProductsParameters`);

    const productsResult = result.recordset;

    productsResult.forEach(element => {
      if (element.product_image != null){
        element.product_image = "data:image/gif;base64,"+element.product_image.toString('base64')
        //console.log(element.product_image);
        //prueba = element.product_image
      }
      
    });
    
    const resultTypes = await pool.request()
      .execute(`returnProductTypes`);
    const typesResult = resultTypes.recordset;
    
    res.render('products/getProductsSearch', { productsResult, typesResult });
  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};



export const reviewProduct = async (req, res) => {
  try {
    const pool = await getConnection();
    
    const {idProduct} = req.body;

    //exec producedure for product info
    const result = await pool.request()
      .input('idProduct', idProduct)
      .execute(`getProductInfoXID`);

    const productsResult = result.recordset;//PRODUCT INFO

    const info = req.user.dollarEquivalent;
    for(var k in productsResult) {
      productsResult[k].newPrice = productsResult[k].price_product * info;
   }

    
    res.render('products/review', {idProduct,productsResult});

  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};

export const sendReviewProduct = async (req, res) => {
  try {
    const pool = await getConnection();
    
    const {idProduct, review_} = req.body;

    //exec producedure for post review
    const result = await pool.request()
      .input('idProduct_', idProduct)
      .input('idClient_',  req.user.clientID)
      .input('review', review_)
      .execute(`generateReview`);

    //VALIDATE ERROR
    if (result.returnValue == 1){
      req.flash("error_msg", "The review was not saved, error validating your user data..");
      res.redirect("/products");
    }
    else if (result.returnValue == 2){
      req.flash("error_msg", "Error validating product data.");
      res.redirect("/products");
    }
    else{
      req.flash("success_msg", "Saved Review.");
      res.redirect("/products");
    }



  } catch (error) {
    res.status(500);
    res.send(error.message);
  }
};