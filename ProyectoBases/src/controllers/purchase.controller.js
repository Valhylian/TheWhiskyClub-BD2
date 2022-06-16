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

const nodemailer = require('nodemailer');

//TRANSPORTER FOR MAILS------------------------------------------------
let transporter = nodemailer.createTransport({
  host: "smtp-mail.outlook.com", // hostname
  secureConnection: false, // TLS requires secureConnection to be false
  port: 587, // port for secure SMTP
  tls: {
     ciphers:'SSLv3'
  },
  auth: {
      user: 'shopatwhiskybrothers@outlook.com',
      pass: 'proyectobases2'
  }
});
//--------------------------------------------------------------------------
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
    
    //SEN MAIL------------------------------------------------------------------------
 

    //BODY EMAIL
    const clientName = purchaseInfo[0].name_client
    const clientMail = purchaseInfo[0].email_client

    const purchaseCode = purchaseInfo[0].id_purchase
    const purchaseLocation = purchaseInfo[0].direction
    const purchaseShipping = purchaseInfo[0].shipping
    const total = purchaseInfo[0].total
    const subtotal = purchaseInfo[0].subtotal
    const moneyType = purchaseInfo[0].moneyType

    let client_sub = 'NA'
    let store = 'NA'
    if (productsResult.length > 0){
      client_sub = productsResult[0].client_sub
      store = productsResult[0].store_name
    }

    let body = '<b> Dear '+clientName+'</b><br> Confirmation of your purchase: '+purchaseCode+' is attached. </b><br>'
    body = body + 'Direction: '+purchaseLocation + '</b><br>'
    body = body + 'Store: '+store + '</b><br>'
    body = body + 'The benefits of your subscription were applied: '+client_sub + '</b><br>'
    body = body + 'Money Type: '+moneyType + '</b><br>'
    body = body + 'Shipping Price: '+purchaseShipping + '</b><br>'
    body = body + 'subtotal: '+subtotal + '</b><br>'
    body = body + 'Total: '+total + '</b><br>'
    body = body + 'Status: '+purchaseInfo[0].name_StatusPurchase + '</b><br>'

    for(var k in productsResult) {
      body = body + '</b><br><pre>Product: '+ productsResult[k].product_name+'</pre>' 
      body = body + 'Price: '+ productsResult[k].product_priceInd 
      body = body + '</b><br>Quantity: '+ productsResult[k].product_amount 
      body = body + '</b><br>Subtotal: '+ productsResult[k].product_subtotal
      body = body + '</b><br>Status: '+ productsResult[k].product_success 
   }

    body = body + '</b><br></b><br>Your purchase has not been sent, when it is processed you will receive another email with the necessary information.'
    body = body +'</b><br>If the status is canceled it will not be processed'

    var mailOptions = {
      from: 'shopatwhiskybrothers@outlook.com', // sender address (who sends)
      to: clientMail, // list of receivers (who receives)
      subject: 'PURCHASE CONFIRMATION', // Subject line
      text: 'Dear: '+clientName ,  // plaintext body
      html:  body// html body
    };

    transporter.sendMail(mailOptions, function(error, info){
      if(error){
          return console.log(error);
      }
  
      console.log('Message sent: ' + info.response);
    });


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

