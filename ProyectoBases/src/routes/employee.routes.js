import { Router } from "express";
import { getConnection, querys, sql } from "../database";
import passport from "passport";
import { isAuthenticated, isNotAuthenticated, isClient, isAdmin } from "../helpers/auth";

import {registerEmployee} from "../controllers/employee.controller"


const router = Router();

router.get('/employeeMenu', isAdmin, (req, res) => {
    res.render('employees/menuEmployee');
});

router.post('/registerEmployee',registerEmployee);

export default router;