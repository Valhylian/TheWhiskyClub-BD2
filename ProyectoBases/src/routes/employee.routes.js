import { Router } from "express";
import { getConnection, querys, sql } from "../database";
import passport from "passport";
import { isAuthenticated, isNotAuthenticated, isClient, isAdmin } from "../helpers/auth";

import {registerEmployee,
    registerEmployeeProcedure,
    consultEmployee,
    consultEmployeeSearch,
    updateEmployeeMainPag,
    updateEmployeSP} from "../controllers/employee.controller"


const router = Router();

//OPEN MENU INITIAL EMPLOYEES
router.get('/employeeMenu', isAdmin, (req, res) => {
    res.render('employees/menuEmployee');
});

//CONSULT PAGE
router.post('/employeeConsult',isAdmin,consultEmployee);
router.post('/employeeConsultSearch',isAdmin,consultEmployeeSearch);

//REGISTER
router.post('/registerEmployee',isAdmin,registerEmployee);
router.post('/registerEmployeeSP',isAdmin,registerEmployeeProcedure);

//EDIT
router.post('/editEmployee',isAdmin,updateEmployeeMainPag); //Pass id employee
router.post('/updateEmployeSP',isAdmin,updateEmployeSP); //Pass id employee

export default router;