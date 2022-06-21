import { getConnection, querys, sql } from "../database";
import fs from 'fs';




export const loadPresentationMenu = async (req, res) => {
    try {
        const pool = await getConnection();
        const get_presentations = await pool.request()
            .execute(`getContainerSelect`);
        const result_presentations = get_presentations.recordset;
        res.render('CRUD/presentations/optionsPagePresentation', { result_presentations });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const loadCreatePresentation = async (req, res) => {

    res.render('CRUD/presentations/createPresentation');
};

export const uploadNewPresentation = async (req, res) => {
    var { name, description } = req.body;
    try {
        const pool = await getConnection();
        const resultAddPresentation = await pool.
            request()
            .input('containerDescription', description)
            .execute(`AddContainer`);
        console.log(resultAddPresentation.returnValue);
        if (resultAddPresentation.returnValue != 0) {

            if (resultAddPresentation.returnValue == 1) {
                req.flash("error_msg", "One of the inputs was null, the presentation was not created.");
                res.redirect("/createNewPresentation");
                return;
            }
            else if (resultAddPresentation.returnValue == 2) {
                req.flash("error_msg", "There already exists a presentation with that description.");
                res.redirect("/createNewPresentation");
                return;
            }
        }
        req.flash("success_msg", "The presentation was created successfully.");
        res.redirect("/presentationsMenu");
        return;
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};


export const loadPresentationInfo = async (req, res) => {
    try {
        const pool = await getConnection();
        const get_presentations = await pool.request()
            .input('idContainer',req.body.ids_Presentation)
            .execute(`getContainerSelect`);
        const presentationsResult = get_presentations.recordset;
        res.render('CRUD/presentations/readPresentation', { presentationsResult });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const loadPresentationInfoUpdate = async (req, res) => {
    try {
        const pool = await getConnection();

        const idPresentationSelected = req.body.ids_Presentation; 
        const get_presentations = await pool.request()
            .input('idContainer',idPresentationSelected)
            .execute(`getContainerSelect`);
        const presentationsResult = get_presentations.recordset;
        res.render('CRUD/presentations/updatePresentation', { presentationsResult,idPresentationSelected });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};



export const uploadUpdatePresentation = async (req, res) => {

    var { description, activeRadio, selectedIdPresentation } = req.body;
    console.log(req.body);

    if(!description){
        description = null;
    }
    if(!activeRadio){
        activeRadio = null;
    }


    try {
        const pool = await getConnection();
        const resultAddPresentation = await pool.
            request()
            .input('idContainer',selectedIdPresentation)
            .input('containerDescription', description)
            .input('active', activeRadio)
            .execute(`updateContainer`);
        const addPresentation = resultAddPresentation.recordset;
        console.log(resultAddPresentation.returnValue);
        if (resultAddPresentation.returnValue != 0) {


            if (resultAddType.returnValue == 1) {
                req.flash("error_msg", "One of the inputs was null, the presentation was not updated.");
                res.redirect("/presentationsMenu");
                return;
            }
            else if (resultAddType.returnValue == 2) {
                req.flash("error_msg", "There already exists a presentation with that name.");
                res.redirect("/presentationsMenu");
                return;
            }

            req.flash("error_msg", "The presentation couldn't be updated due to an error.");
            res.redirect("/presentationsMenu");
            return;
        }
        req.flash("success_msg", "The presentation was updated successfully.");
        res.redirect("/presentationsMenu");
        return;
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }




}