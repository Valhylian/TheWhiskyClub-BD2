import { getConnection, querys, sql } from "../database";

export const loadSubscriptionsMenu = async (req, res) => {
    try {
        const pool = await getConnection();
        const get_subscription = await pool.request()
            .execute(`getSubscriptionInfo`);
        const result_subscription = get_subscription.recordset;
        res.render('CRUD/subscription/optionsPageSubscription', { result_subscription });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const loadCreateSubscription = async (req, res) => {

    res.render('CRUD/subscription/createSubscription');
};

export const uploadNewSubscriptions = async (req, res) => {
    var { name, price, discount_subscription, discount_shipping, description } = req.body;
    try {
        const pool = await getConnection();
        const resultAddSubscription = await pool.
            request()
            .input('subscriptionName', name)
            .input('price', price)
            .input('discountSubscription', discount_subscription)
            .input('discountShipping', discount_shipping)
            .input('description', description)
            .execute(`AddSubscription`);
        console.log(resultAddSubscription.returnValue);
        if (resultAddSubscription.returnValue != 0) {

            if (resultAddSubscription.returnValue == 1) {
                req.flash("error_msg", "One of the inputs was null, the subscription was not created.");
                res.redirect("/createNewsubscription");
                return;
            }
            else if (resultAddSubscription.returnValue == 2) {
                req.flash("error_msg", "There already exists a subscription with that name, please choose another one.");
                res.redirect("/createNewsubscription");
                return;
            }
        }
        req.flash("success_msg", "The subscription was updated successfully.");
        res.redirect("/subscriptionMenu");
        return;
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const loadSubscriptionInfo = async (req, res) => {
    try {
        const pool = await getConnection();
        const get_subscriptions = await pool.request()
            .input('idSubscription',req.body.ids_subscription)
            .execute(`getSubscriptionInfo`);
        const subscriptionResult = get_subscriptions.recordset;
        res.render('CRUD/subscription/readSubscription', { subscriptionResult });
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const loadSubscriptionInfoUpdate = async (req, res) => {
    try {
        const selectedIdSub = req.body.ids_subscription;
        const pool = await getConnection();
        const get_subscriptions = await pool.request()
            .input('idSubscription',selectedIdSub)
            .execute(`getSubscriptionInfo`);
        const subscriptionResult = get_subscriptions.recordset;
        res.render('CRUD/subscription/updateSubscription', { subscriptionResult, selectedIdSub});
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

export const uploadUpdateSubscription = async (req, res) => {

    var {name, price, discount_subscription, discount_shipping, description, activeRadio, selectedSubId} =req.body

    if(!name){
        name = null;
        console.log(name);
    }
    if(!price){
        price = null;
        console.log(price);
    }
    if(!discount_subscription){
        discount_subscription = null;
        console.log(discount_subscription);
    }
    if(!discount_shipping){
        discount_shipping = null;
        console.log(discount_shipping);
    }
    if(!description){
        description = null;
        console.log(description);
    }
    if(!activeRadio){
        activeRadio = null;
        console.log(activeRadio);
    }

    try {
        const pool = await getConnection();
        const update_subscriptions = await pool.request()
            .input('idSubscription',selectedSubId)
            .input('subscriptionName',name)
            .input('description',description)
            .input('price',price)
            .input('discountSubscription',discount_subscription)
            .input('discountShipping',discount_shipping)
            .input('active',activeRadio)
            .execute(`updateSubscription`);
        const subscriptionResult = update_subscriptions.recordset;
        if (update_subscriptions.returnValue != 0) {
            req.flash("error_msg", "The subscription couldn't be updated due to an error.");
            res.redirect("subscriptionMenu");
            return;
        }
        req.flash("success_msg", "The subscriptionMenu was updated successfully.");
        res.redirect("subscriptionMenu");
        return;
    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

