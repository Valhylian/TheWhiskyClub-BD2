import { getConnection, querys, sql } from "../database";
import {nodemailer,transporter,sendMail} from "../mailConfig"


//OPEN FORM TO REGISTER EMPLOYEE--------------
export const registerEmployee = async (req, res) => {
    try {
        const pool = await getConnection();

        //GET JOBS
        const get_jobs = await pool.request()
            .execute(`ReturnJobs`);
        const result_jobs = get_jobs.recordset;

        //GET DEPARTMENTS
        const get_departments = await pool.request()
            .execute(`ReturnDepartments`);
        const result_department = get_departments.recordset;

        //GET STORES
        const get_stores = await pool.request()
            .execute(`returnStores`);
        const result_store = get_stores.recordset;

        res.render('employees/createEmployee', { result_jobs, result_department, result_store });

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//CALLS REGISTER EMPLOYEE PROCEDURE AND REDIRECT TO MENU--------------
export const registerEmployeeProcedure = async (req, res) => {
    try {
        const pool = await getConnection();
        const { name, id_Job, id_Department, id_Store, salary } = req.body;

        //INSERT EMPLOYEE
        const resultInsert = await pool.request()
            .input('name_employee', name)
            .input('job_employee', id_Job)
            .input('department_employee', id_Department)
            .input('store_employee', id_Store)
            .input('salary', salary)
            .execute(`registerEmployee`);

        //VALIDATE ERROR
        if (resultInsert.returnValue == 1) {
            req.flash("error_msg", "ERROR! An error occurred in the insertion process");
            res.redirect("/employeeMenu");;
        }
        else if (resultInsert.returnValue == 2) {
            req.flash("error_msg", "ERROR! The employee name is already registered in the system");
            res.redirect("/employeeMenu");;
        }
        else{
            req.flash("success_msg", "SUCCESSFULLY INSERTED");
            res.redirect("/employeeMenu");
        }
        

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};


//OPEN FORM TO CONSULT EMPLOYEE--------------
export const consultEmployee = async (req, res) => {
    try {
        const pool = await getConnection();

        //GET EMPLOYEES
        const get_employees = await pool.request()
            .execute(`Consult_employees`);
        const result_employees = get_employees.recordset;

        //GET JOBS
        const get_jobs = await pool.request()
            .execute(`ReturnJobs`);
        const result_jobs = get_jobs.recordset;

        //GET DEPARTMENTS
        const get_departments = await pool.request()
            .execute(`ReturnDepartments`);
        const result_department = get_departments.recordset;

        //GET STORES
        const get_stores = await pool.request()
            .execute(`returnStores`);
        const result_store = get_stores.recordset;

        res.render('employees/consultEmployee', {result_employees,result_jobs,result_department,result_store });

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//OPEN FORM TO CONSULT EMPLOYEE--------------
export const consultEmployeeSearch = async (req, res) => {
    try {
        const pool = await getConnection();
        const { employeeName, id_Department, id_Job, LowBadScore, LowGodScore, LowSalary, HighSalary } = req.body;
        console.log("AQUII---");
        console.log(employeeName);
        console.log(id_Department);
        console.log(id_Job);
        console.log(LowBadScore);
        console.log(LowGodScore);
        console.log(LowSalary);
        console.log(HighSalary);
        //GET EMPLOYEES
        const get_employees2 = await pool.request()
            .input('name_employee_',employeeName)
            .input('id_department_', id_Department)
            .input('id_job_', id_Job)
            .input('lower_badSocore_', LowBadScore)
            .input('lower_goodSocore_', LowGodScore)
            .input('lower_salary_', LowSalary)
            .input('higher_salary_',HighSalary)
            .execute(`Consult_employeeGeneral`);
        const result_employees = get_employees2.recordset;

        //GET JOBS
        const get_jobs = await pool.request()
            .execute(`ReturnJobs`);
        const result_jobs = get_jobs.recordset;

        //GET DEPARTMENTS
        const get_departments = await pool.request()
            .execute(`ReturnDepartments`);
        const result_department = get_departments.recordset;

        //GET STORES
        const get_stores = await pool.request()
            .execute(`returnStores`);
        const result_store = get_stores.recordset;

        res.render('employees/consultEmployee', {result_employees,result_jobs,result_department,result_store });

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//EDIT EMPLOYEE OPEN PAG
export const updateEmployeeMainPag = async (req, res) => {
    try {
        const pool = await getConnection();

        const get_employees = await pool.request()
            .input('id_employee',req.body.id_employee)
            .execute(`Consult_employeeXID`);
        const result_employees = get_employees.recordset;

        //GET JOBS
        const get_jobs = await pool.request()
            .execute(`ReturnJobs`);
        const result_jobs = get_jobs.recordset;

        //GET DEPARTMENTS
        const get_departments = await pool.request()
            .execute(`ReturnDepartments`);
        const result_department = get_departments.recordset;

        //GET STORe
        const get_stores = await pool.request()
            .execute(`returnStores`);
        const result_store = get_stores.recordset;
        console.log(result_employees);
        console.log(result_jobs);
        res.render('employees/editEmployee', {result_employees,result_jobs,result_department,result_store});

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};



//UPDATE EMPLOYEE--------------
export const updateEmployeSP = async (req, res) => {
    try {
        const pool = await getConnection();
        const { name, id_Job, id_Department, id_Store, salary, BadScore, GoodScore, active,id_employee } = req.body;

        console.log('id_employee', id_employee)
        console.log('name_employee', name)
        console.log('job_employee', id_Job)
        console.log('department_employee', id_Department)
        console.log('store_employee', id_Store)
        console.log('salary', salary)
        console.log('badScore', BadScore)
        console.log('score', GoodScore)
        console.log('active', active)

        //UPDATE EMPLOYEE
        const resultInsert = await pool.request()
            .input('id_employee', id_employee)
            .input('name_employee', name)
            .input('job_employee', id_Job)
            .input('department_employee', id_Department)
            .input('store_employee', id_Store)
            .input('salary', salary)
            .input('badScore', BadScore)
            .input('score', GoodScore)
            .input('active', active)
            .execute(`updateEmployee`);

        //VALIDATE ERROR
        if (resultInsert.returnValue == 1) {
            req.flash("success_msg", "The name was not updated because it is occupied by another client ");
            res.redirect("/employeeMenu");
        }
        else{
            req.flash("success_msg", "SUCCESSFULLY UPDATED");
            res.redirect("/employeeMenu");
        }
        

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//LOAD ALL EMPLOYES FOR CLIENTE MAIN PAGE
export const consultEmployeeClient = async (req, res) => {
    try {
        const pool = await getConnection();

        //GET EMPLOYEES
        const get_employees = await pool.request()
            .execute(`Consult_employees`);
        const result_employees = get_employees.recordset;

        //GET JOBS
        const get_jobs = await pool.request()
            .execute(`ReturnJobs`);
        const result_jobs = get_jobs.recordset;

        //GET DEPARTMENTS
        const get_departments = await pool.request()
            .execute(`ReturnDepartments`);
        const result_department = get_departments.recordset;

        //GET STORES
        const get_stores = await pool.request()
            .execute(`returnStores`);
        const result_store = get_stores.recordset;

        res.render('employees/reportEmployee', {result_employees,result_jobs,result_department,result_store });

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//LOAD THE SEARCH OF EMPLOYEES (CLIENT) FOR A REPORT--------------
export const consultEmployeeClientParameters = async (req, res) => {
    try {
        const pool = await getConnection();
        const {employeeName, id_Department, id_Job} = req.body; //PARAMETERS

        //GET EMPLOYEES
        const get_employees2 = await pool.request()
            .input('name_employee_',employeeName)
            .input('id_department_', id_Department)
            .input('id_job_', id_Job)
            .input('lower_badSocore_', '')
            .input('lower_goodSocore_', '')
            .input('lower_salary_', '')
            .input('higher_salary_','')
            .execute(`Consult_employeeGeneral`);

        const result_employees = get_employees2.recordset;

        //GET JOBS
        const get_jobs = await pool.request()
            .execute(`ReturnJobs`);
        const result_jobs = get_jobs.recordset;

        //GET DEPARTMENTS
        const get_departments = await pool.request()
            .execute(`ReturnDepartments`);
        const result_department = get_departments.recordset;

        //GET STORES
        const get_stores = await pool.request()
            .execute(`returnStores`);
        const result_store = get_stores.recordset;

        res.render('employees/reportEmployee', {result_employees,result_jobs,result_department,result_store });

    } catch (error) {
        res.status(500);
        res.send(error.message);
    }
};

//LOAD PAGE REVIEW WITH INFO OF EMPLOYEE
export const reportEmployeeClient = async (req, res) => {
    try {
      const pool = await getConnection();
      const {id_employee} = req.body;

      //exec producedure for product info
      const result = await pool.request()
        .input('id_employee', id_employee)
        .execute(`Consult_employeeXID`);
  
      const result_employees = result.recordset;//EMPLOYEE INFO
  
      res.render('employees/sendReviewEmployee', {id_employee,result_employees});
  
    } catch (error) {
      res.status(500);
      res.send(error.message);
    }
  };

  //SEND REPORT
  export const sendReportEmployee= async (req, res) => {
    try {
      const pool = await getConnection();
      
      const {idEmploye, review_} = req.body;
        console.log('empleadooo: '+ idEmploye);
      //exec producedure for post review
      const result = await pool.request()
        .input('idEmployee_', idEmploye)
        .input('idClient_',  req.user.clientID)
        .input('review', review_)
        .execute(`generateEmployeeReport`);
  
      //VALIDATE ERROR
      if (result.returnValue == 1){
        req.flash("error_msg", "The review was not saved, error validating your user data.");
        res.redirect("/employeeReviewMainPage");
      }
      else if (result.returnValue == 2){
        req.flash("error_msg", "Error validating employee data.");
        res.redirect("/employeeReviewMainPage");
      }
      else{
        req.flash("success_msg", "Saved Review.");
        res.redirect("/employeeReviewMainPage");
      }
  
    } catch (error) {
      res.status(500);
      res.send(error.message);
    }
  };


//LOAD PAGE REVIEW WITH INFO OF REPORTS (FOR USER ADMIN)
export const viewEmployeeReports = async (req, res) => {
    try {
      const pool = await getConnection();
      const {id_ReportType} = req.body;

      //exec producedure for reports info
      const result = await pool.request()
        .input('reportType', id_ReportType)
        .execute(`loadEmployeeReport`);
  
      const result_reviews = result.recordset;//REPORTS INFO
        if (id_ReportType == 2){
            res.render('employees/processedReports', {result_reviews});
        }
        else{
            res.render('employees/loadReports', {result_reviews});
        }
      
  
    } catch (error) {
      res.status(500);
      res.send(error.message);
    }
  };


 //LOAD PAGE REVIEW WITH INFO OF REPORTS (FOR USER ADMIN)
export const resolveReport = async (req, res) => {
    try {
      const pool = await getConnection();
      const {id_Report, good_score, bad_score, emailBody} = req.body;

      //exec producedure for process report (Points to employee)
      const result = await pool.request()
        .input('id_report_', id_Report)
        .input('goodPoints_', good_score)
        .input('badPoints_', bad_score)
        .execute(`resolveEmployeeReport`);
  
      //SEND MAIL
      const resultClient = await pool.request()
        .input('report_id_', id_Report)
        .execute(`loadClientInfoReport`);
      //get info of client
      const email = resultClient.recordset[0].email_client
      const employeeName = resultClient.recordset[0].name_employee

       //SEND CONFIRMATION MAIL
        let body = '<b> Your report on the employee: ' +employeeName +' has been reviewed</b><br>'
        body = body + emailBody + '</b><br>'

        sendMail(email, body);
        req.flash("success_msg", "Report has been processed.");
  
      res.redirect('/employeeMenu');
  
    } catch (error) {
      res.status(500);
      res.send(error.message);
    }
  };



