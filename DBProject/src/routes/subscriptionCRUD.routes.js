import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
const router = Router();
import {loadSubscriptionsMenu,uploadUpdateSubscription,uploadNewSubscriptions,loadCreateSubscription,loadSubscriptionInfo,loadSubscriptionInfoUpdate} from "../controllers/subscriptionCRUD.controller"


router.get('/subscriptionMenu',isAdmin,loadSubscriptionsMenu);

router.get('/createNewsubscription',isAdmin,loadCreateSubscription);

router.post('/uploadNewSubscriptions',isAdmin,uploadNewSubscriptions);

router.post('/loadsubscriptionInfo',isAdmin,loadSubscriptionInfo);

router.post('/loadsubscriptionInfoUpdate',isAdmin,loadSubscriptionInfoUpdate);

router.post('/uploadUpdateSubscription',isAdmin,uploadUpdateSubscription)
export default router;