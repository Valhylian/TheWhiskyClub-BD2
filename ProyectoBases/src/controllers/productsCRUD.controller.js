import { getConnection, querys, sql } from "../database";
import fs from 'fs';



export const loadProductsMenu = async (req, res) => {
    try {
        const pool = await getConnection();
        const get_products = await pool.request()
            .execute(`getProductInfo`);
        const result_products = get_products.recordset;
        res.render('CRUD/products/optionsPageProducts', { result_products });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const loadProductInfo = async (req, res) => {
    try {
        const pool = await getConnection();
        const get_products = await pool.request()
            .input('idProduct',req.body.ids_Product)
            .execute(`getProductInfo`);
        const productsResult = get_products.recordset;
        res.render('CRUD/products/readProducts', { productsResult });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const loadProductInfoUpdate = async (req, res) => {
    try {
        const pool = await getConnection();

        const idProductSelected = req.body.ids_Product; 

        const resultDistilleryCatalog = await pool.request()
            .execute(`getDistilleryCatalog`);
        const distilleryResult = resultDistilleryCatalog.recordset;

        const resultContainerCatalog = await pool.request()
            .execute(`getContainerCatalog`);
        const containerResult = resultContainerCatalog.recordset;

        const resultProductTypeCatalog = await pool.request()
            .execute(`returnProductTypes`);
        const productTypeResult = resultProductTypeCatalog.recordset;


        const get_products = await pool.request()
            .input('idProduct',req.body.ids_Product)
            .execute(`getProductInfo`);
        const productsResult = get_products.recordset;
        res.render('CRUD/products/updateProducts', { productsResult,productTypeResult,containerResult,distilleryResult,idProductSelected });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

function decode_string(file) {
    return fs.readFileSync(file);
}



export const uploadUpdateProduct = async (req, res) => {

    var { productIdSelected,name, idProductType, idDistillery, idContainer, exclusiveRadio, price, age, activeRadio } = req.body;
    var image = req.file
    console.log(req.body);

    if(!name){
        name = null;
    }
    if(!idProductType){
        idProductType = null;
    }
    if(!idDistillery){
        idDistillery = null;
    }
    if(!idContainer){
        idContainer = null;
    }
    if(!exclusiveRadio){
        exclusiveRadio = null;
    }
    if(!price){
        price = null;
    }
    if(!age){
        age = null;
    }
    if(!activeRadio){
        activeRadio = null;
    }
    if(image == undefined){
        image = null;
    }
    else{
        var binaryStr = decode_string(req.file.path);
    }


    try {
        const pool = await getConnection();
        const resultAddProduct = await pool.
            request()
            .input('productId',productIdSelected)
            .input('productName', name)
            .input('whiskyType', idProductType)
            .input('ageProduct', age)
            .input('containerType', idContainer)
            .input('idDistillery', idDistillery)
            .input('price', price)
            .input('exclusivity', exclusiveRadio)
            .input('active', activeRadio)
            .input('image', sql.VarBinary(sql.MAX), binaryStr)
            .execute(`updateProduct`);
        const addProduct = resultAddProduct.recordset;
        console.log(resultAddProduct.returnValue);
        if (resultAddProduct.returnValue != 0) {
            req.flash("error_msg", "The product couldn't be updated due to an error.");
            res.redirect("/productsMenu");
            return;
        }
        req.flash("success_msg", "The product was updated successfully.");
        res.redirect("/productsMenu");
        return;
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }




}