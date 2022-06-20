import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
const router = Router();
import {loadCreateType,loadTypeMenu,uploadNewType,loadTypeInfo, loadTypeInfoUpdate,uploadUpdateType} from "../controllers/whiskyTypesCRUD.controller"

router.get('/createNewType',isAdmin,loadCreateType)

router.post('/uploadNewType',isAdmin,uploadNewType);

router.get('/typeMenu',isAdmin,loadTypeMenu);

router.post('/loadTypeInfo',isAdmin,loadTypeInfo);

router.post('/loadTypeInfoUpdate',isAdmin,loadTypeInfoUpdate);

router.post('/uploadUpdateType',isAdmin,uploadUpdateType)
export default router;