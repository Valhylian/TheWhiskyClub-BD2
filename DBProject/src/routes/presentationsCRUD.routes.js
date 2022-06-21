import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
const router = Router();
import {loadCreatePresentation,loadPresentationMenu,uploadNewPresentation,loadPresentationInfo, loadPresentationInfoUpdate,uploadUpdatePresentation} from "../controllers/presentationsCRUD.controller"

router.get('/createNewPresentation',isAdmin,loadCreatePresentation)

router.post('/uploadNewPresentations',isAdmin,uploadNewPresentation);

router.get('/presentationsMenu',isAdmin,loadPresentationMenu);

router.post('/loadPresentationInfo',isAdmin,loadPresentationInfo);

router.post('/loadPresentationInfoUpdate',isAdmin,loadPresentationInfoUpdate);

router.post('/uploadUpdatePresentation',isAdmin,uploadUpdatePresentation)
export default router;