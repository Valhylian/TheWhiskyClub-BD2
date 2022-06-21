import { Router } from "express";
import { getConnection, querys, sql } from "../database";
import passport from "passport";
import { isAuthenticated, isNotAuthenticated, isClient, isAdmin } from "../helpers/auth";

import {registerEmployee,
    registerEmployeeProcedure,
    consultEmployee,
    consultEmployeeSearch,
    updateEmployeeMainPag,
    consultEmployeeClient,
    consultEmployeeClientParameters,
    reportEmployeeClient,
    updateEmployeSP,
    sendReportEmployee,
    viewEmployeeReports,
    resolveReport
    } from "../controllers/employee.controller"


const router = Router();

//FOR ADMIN USER-------------------------------------------------------------------------
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

//FOR CLIENTS USERS----------------------------------------------------------------------
router.get('/employeeReviewMainPage',isClient,consultEmployeeClient);
router.post('/employeeReviewMainPage',isClient,consultEmployeeClientParameters);
router.post('/reviewEmployee',isClient,reportEmployeeClient);
router.post('/employee/sendReport',isClient,sendReportEmployee); 

//RESOLVE REPORTS (FOR ADMIN USER)
router.post('/employee/resolveReview',isAdmin,viewEmployeeReports); 
router.post('/employee/sendResolveReview',isAdmin,resolveReport); 


export default router;