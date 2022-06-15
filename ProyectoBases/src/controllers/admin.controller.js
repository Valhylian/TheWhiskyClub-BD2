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


function str_encode(file) {
    return fs.readFileSync(file);
}

export const uploadNewProduct = async (req, res) => {

    try {

        var bufferedStr = str_encode(req.file.path);
        console.log(bufferedStr);
        const pool = await getConnection();
        const resultCreateNewProduct = await pool.request()
            
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }




}

    