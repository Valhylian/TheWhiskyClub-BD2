import { getConnection, querys, sql } from "../database";
import path from 'path';
import fs from 'fs';




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

