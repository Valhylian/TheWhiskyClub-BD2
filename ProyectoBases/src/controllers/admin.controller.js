import { getConnection, querys, sql } from "../database";
import path from 'path';
import fs from 'fs';
import {nodemailer,transporter,sendMail} from "../mailConfig"



export const getInfoCreateProduct = async (req, res) => {
    try {
        const pool = await getConnection();

        const resultDistilleryCatalog = await pool.request()
            .execute(`getDistilleryCatalog`);
        const distilleryResult = resultDistilleryCatalog.recordset;

        const resultContainerCatalog = await pool.request()
            .execute(`getContainerCatalog`);
        const containerResult = resultContainerCatalog.recordset;

        const resultProductTypeCatalog = await pool.request()
            .execute(`returnProductTypes`);
        const productTypeResult = resultProductTypeCatalog.recordset;

        const resultStore = await pool.request()
            .execute(`returnStores`);
        const storeResult = resultStore.recordset;


        res.render('admin/createNewProduct', { productTypeResult, containerResult, distilleryResult, storeResult });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};


function decode_string(file) {
    return fs.readFileSync(file);
}

export const uploadNewProduct = async (req, res) => {

    const { name, idProductType, idDistillery, idContainer, exclusiveRadio, price, age, quantity, storeID } = req.body;
    Number(idProductType);
    Number(idDistillery);
    Number(idContainer);
    Number(exclusiveRadio);
    Number(price);
    Number(age);
    Number(storeID);
    const sum = quantity.reduce((partialSum, a) => Number(partialSum) + Number(a), 0);
    try {
        console.log(req.body);
        var binaryStr = decode_string(req.file.path);
        const pool = await getConnection();
        const resultAddProduct = await pool.
            request()
            .input('productName', name)
            .input('whiskyType', idProductType)
            .input('ageProduct', age)
            .input('containerType', idContainer)
            .input('idDistillery', idDistillery)
            .input('price', price)
            .input('exclusivity', exclusiveRadio)
            .input('image', sql.VarBinary(sql.MAX), binaryStr)
            .input('amount', sum)
            .execute(`AddProduct`);
        const addProduct = resultAddProduct.recordset;
        if (resultAddProduct.returnValue != 0) {
            req.flash("error_msg", "The product couldn't be created due to an error.");
            res.redirect("/");
            return;
        }
        for (var i = 0; i < storeID.length; i++) {
            const idStoreCurrent = storeID[i];
            const quantityCurrent = quantity[i];
            Number(idStoreCurrent);
            Number(quantityCurrent);
            console.log(idStoreCurrent);
            console.log(idStoreCurrent);
            console.log('nuevo');
            const resultAddProductStore = await pool.
                request()
                .input('idStore', idStoreCurrent)
                .input('amount', quantityCurrent)
                .execute(`AddProductToStore`);
            const addProductStore = resultAddProductStore.recordset;
            if (resultAddProduct.returnValue != 0) {
                req.flash("error_msg", "The product was created but an error occurred while adding it to one of the stores.");
                res.redirect("/");
                return;
            }
        }
        req.flash("success_msg", "The product was created and added to the stores successfully.");
        res.redirect("/");
        return;
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }




}


//-------------PROCESS PURCHASES---------------------------------
export const getInfoPurchase = async (req, res) => {
    try {
        const pool = await getConnection();
        //STORES
        const resultStore = await pool.request()
            .execute(`returnStores`);
        const storeResult = resultStore.recordset;

        //PURCHASES
        const resultPurchaseStore = await pool.request()
            .input('idStore_', req.body.id_Store)  
            .execute(`consultPurchaseXStore`);
        const purchaseStoreResult = resultPurchaseStore.recordset;
        

        //MANAGER EMPLOYEES
        const resultEmployeeManager = await pool.request()
            .input('idStore_', req.body.id_Store) //FIRST CALL 1
            .input('idJob',1)
            .execute(`Consult_employeeXStoreXJob`);
        const employeeManagerResult = resultEmployeeManager.recordset;
        console.log(employeeManagerResult);

        //DEALER EMPLOYEES
        const resultEmployeeDealer = await pool.request()
            .input('idStore_', req.body.id_Store) //FIRST CALL 1
            .input('idJob',2)
            .execute(`Consult_employeeXStoreXJob`);
        const employeeDealerResult = resultEmployeeDealer.recordset;
        console.log(employeeDealerResult);

        res.render('purchase/purchaseProcess', { storeResult, purchaseStoreResult, manager:employeeManagerResult, dealer:employeeDealerResult });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const getInfoPurchase_FirstCall = async (req, res) => {
    try {
        const pool = await getConnection();
        //STORES
        const resultStore = await pool.request()
            .execute(`returnStores`);
        const storeResult = resultStore.recordset;

        //PURCHASES
        const resultPurchaseStore = await pool.request()
            .input('idStore_', 1)  //First call 1
            .execute(`consultPurchaseXStore`);
        const purchaseStoreResult = resultPurchaseStore.recordset;
   

        //MANAGER EMPLOYEES
        const resultEmployeeManager = await pool.request()
            .input('idStore_', 1) //FIRST CALL 1
            .input('idJob',1)
            .execute(`Consult_employeeXStoreXJob`);
        const employeeManagerResult = resultEmployeeManager.recordset;


        //DEALER EMPLOYEES
        const resultEmployeeDealer = await pool.request()
            .input('idStore_', 1) //FIRST CALL 1
            .input('idJob',2)
            .execute(`Consult_employeeXStoreXJob`);
        const employeeDealerResult = resultEmployeeDealer.recordset;
      

        res.render('purchase/purchaseProcess', { storeResult, purchaseStoreResult, manager:employeeManagerResult, dealer:employeeDealerResult });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};


//PROCESS PURCHASE (UPDATE STATUS, MANAGER AND DEALER)
export const processPurchase = async (req, res) => {
    try {
        const pool = await getConnection();

        //PURCHASES
        const resultPurchaseStore = await pool.request()
            .input('idPurchase', req.body.id_purchase) 
            .input('idManager', req.body.id_Manager) 
            .input('idDealer', req.body.id_Dealer)  
            .execute(`processPurchase`);

        //GET ID CLIENTE
        const resultPurchase = await pool.request()
            .input('idPurchase_', req.body.id_purchase) 
            .execute(`consultPurchase`);

        //GET NAME MANAGER
        const resultManager = await pool.request()
            .input('id_employee', req.body.id_Manager) 
            .execute(`Consult_employeeXID`);
        
        //GET NAME DEALER
        const resultDealer = await pool.request()
        .input('id_employee', req.body.id_Dealer) 
        .execute(`Consult_employeeXID`);
           
        const resultPurchase_idClient = resultPurchase.recordset[0].client_purchase
        const resultPurchase_emailClient = resultPurchase.recordset[0].email_client
        const resultManager_name_manager= resultManager.recordset[0].name_employee
        const resultManager_name_dealer= resultDealer.recordset[0].name_employee

        //VALIDATE ERROR
        if (resultPurchaseStore.returnValue == 1){
            req.flash("error_msg", "There has been an error on the process of the purchase, please try again.");
            res.redirect("/processPurchase");

        }
        else if (resultPurchaseStore.returnValue == 2){
            req.flash("error_msg", "There has been an error on the process of the purchase, please try again.");
            res.redirect("/processPurchase");

        }
        else{
            req.flash("success_msg", "Successfully processed.");
            //SEND CONFIRMATION MAIL
            let body = '<b> Your purchase Code: '+req.body.id_purchase+' has been sent.. </b><br>'
            body = body + 'Processed by: '+resultManager_name_manager + '</b><br>'
            body = body + 'Shipping Manager: '+resultManager_name_dealer + '</b><br>'
    
            sendMail(resultPurchase_emailClient, body);
            res.redirect("/processPurchase");
            
            
        }
        
        
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};
