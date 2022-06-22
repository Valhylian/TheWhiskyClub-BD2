import { getConnection, querys, sql } from "../database";
import path from 'path';
import fs from 'fs';
import {nodemailer,transporter,sendMail} from "../mailConfig"

//LOAD CONSULT CLIENT (MAIN PAGE)
export const consultClient = async (req, res) => {
    try {
        const pool = await getConnection();

        //GET CLIENTS
        const get_clients = await pool.request()
            .input('name_client_', '')
            .input('id_pais_',0)
            .input('id_subs_',0)
            .input('fristDate','')
            .input('lastDate','')
            .execute(`Consult_Clients`);
        const result_clients = get_clients.recordset;

        //GET SUBS
        const get_subs = await pool.request()
            .execute(`getSubscriptionCatalog`);
        const result_subs = get_subs.recordset;

        res.render('clients/getSearchClient', {result_clients,result_subs });

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};



export const consultClient2 = async (req, res) => {
    try {
        const pool = await getConnection();

        //GET CLIENTS
        const get_clients = await pool.request()
            .input('name_client_', req.body.clientName)
            .input('id_pais_',req.body.id_Country)
            .input('id_subs_',req.body.id_Sub)
            .input('fristDate',req.body.start)
            .input('lastDate',req.body.finish)
            .execute(`Consult_Clients`);
        const result_clients = get_clients.recordset;
        console.log(req.body.start);
        //GET SUBS
        const get_subs = await pool.request()
            .execute(`getSubscriptionCatalog`);
        const result_subs = get_subs.recordset;

        res.render('clients/getSearchClient', {result_clients,result_subs });

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};


export const loadPurchases = async (req, res) => {
    try {
        const pool = await getConnection();

        //GET PURCHASES
        const get_purchase = await pool.request()
            .input('id_client_', req.body.id_client)
            .execute(`Consult_PurchaseXClient`);

        const result_purchase = get_purchase.recordset;

        res.render('clients/loadPurchase', {result_purchase});

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};