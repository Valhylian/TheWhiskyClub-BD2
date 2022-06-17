import { getConnection, querys, sql } from "../database";



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
  
      res.render('employees/createEmployee', { result_jobs, result_department, result_store});

    } catch (error) {
      res.status(500);
      res.send(error.message);
    }
  };