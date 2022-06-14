import { config } from "dotenv";
config();

export default {
  port: process.env.PORT || 4000,
  dbUser: process.env.DB_USER || "WhiskyClub",
  dbPassword: process.env.DB_PASSWORD || "ProyectoBases2",
  dbServer: process.env.DB_SERVER || "localhost",
  dbDatabase: process.env.DB_DATABASE || "WhiskyClubcentral",
};
