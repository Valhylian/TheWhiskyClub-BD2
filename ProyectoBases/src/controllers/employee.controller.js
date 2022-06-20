import { getConnection, querys, sql } from "../database";


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