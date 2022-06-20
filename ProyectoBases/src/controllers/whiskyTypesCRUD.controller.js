import { getConnection, querys, sql } from "../database";

export const loadTypeMenu = async (req, res) => {
    try {
        const pool = await getConnection();
        const get_types = await pool.request()
            .execute(`getProductTypesSelect`);
        const result_types = get_types.recordset;
        res.render('CRUD/whiskyTypes/optionsTypes', { result_types });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};



export const loadCreateType = async (req, res) => {

    res.render('CRUD/whiskyTypes/createTypes');
};

export const uploadNewType = async (req, res) => {
    var { name } = req.body;
    try {
        const pool = await getConnection();
        const resultAddType = await pool.
            request()
            .input('productTypeName', name)
            .execute(`AddProductType`);
        console.log(resultAddType.returnValue);
        if (resultAddType.returnValue != 0) {

            if (resultAddType.returnValue == 1) {
                req.flash("error_msg", "One of the inputs was null, the whisky type was not created.");
                res.redirect("/createNewType");
                return;
            }
            else if (resultAddType.returnValue == 2) {
                req.flash("error_msg", "There already exists a whisky type with that name.");
                res.redirect("/createNewType");
                return;
            }
        }
        req.flash("success_msg", "The whisky type was created successfully.");
        res.redirect("/typeMenu");
        return;
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};


export const loadTypeInfo = async (req, res) => {
    try {
        const pool = await getConnection();
        const get_types = await pool.request()
            .input('idProductType', req.body.ids_Type)
            .execute(`getProductTypesSelect`);
        const typesResult = get_types.recordset;
        res.render('CRUD/whiskyTypes/readTypes', { typesResult });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const loadTypeInfoUpdate = async (req, res) => {
    try {
        const pool = await getConnection();

        const idTypeSelected = req.body.ids_Type;
        const get_presentations = await pool.request()
            .input('idProductType', idTypeSelected)
            .execute(`getProductTypesSelect`);
        const typesResult = get_presentations.recordset;
        res.render('CRUD/whiskyTypes/updateTypes', { typesResult, idTypeSelected });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};



export const uploadUpdateType = async (req, res) => {

    var { name, activeRadio, selectedIdType } = req.body;
    console.log(req.body);

    if (!name) {
        name = null;
    }
    if (!activeRadio) {
        activeRadio = null;
    }


    try {
        const pool = await getConnection();
        const resultAddType = await pool.
            request()
            .input('idProductType', selectedIdType)
            .input('productTypeName', name)
            .input('active', activeRadio)
            .execute(`updateProductType`);
        const addType = resultAddType.recordset;
        if (resultAddType.returnValue != 0) {

            if (resultAddType.returnValue == 1) {
                req.flash("error_msg", "One of the inputs was null, the whisky type was not created.");
                res.redirect("/typeMenu");
                return;
            }
            else if (resultAddType.returnValue == 2) {
                req.flash("error_msg", "There already exists a whisky type with that name.");
                res.redirect("/typeMenu");
                return;
            }

            req.flash("error_msg", "The whisky type couldn't be updated due to an error.");
            res.redirect("/typeMenu");
            return;
        }
        req.flash("success_msg", "The whisky type was updated successfully.");
        res.redirect("/typeMenu");
        return;
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }




}