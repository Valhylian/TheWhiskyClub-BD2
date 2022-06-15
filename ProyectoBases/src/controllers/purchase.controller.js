import { getConnection, querys, sql } from "../database";

export const getProducts_store = async (req, res) => {
    try {
      const pool = await getConnection();
      const result = await pool.request()
      .input('id_client', req.user.clientID)
      .input('id_store_', 1)
      .execute(`consultProductsXStore`);
  
      const productsResult = result.recordset;
      const resultStore = await pool.request()
        .execute(`returnStores`);

      const typesResult = resultStore.recordset;
      res.render('purchase/purchase',{productsResult,typesResult});
    } catch (error) {
      res.status(500);
      res.send(error.message);
    }
  };

  export const loadProducts_store = async (req, res) => {
    try {
      const pool = await getConnection();
      const {id_Store} = req.body;
      const result = await pool.request()

      .input('id_client', req.user.clientID)
      .input('id_store_', id_Store)
      .execute(`consultProductsXStore`);
  
      const productsResult = result.recordset;
      const resultStore = await pool.request()
        .execute(`returnStores`);

      const typesResult = resultStore.recordset;
      res.render('purchase/purchase',{productsResult,typesResult});
    } catch (error) {
      res.status(500);
      res.send(error.message);
    }
  };

