import { Router } from "express";
import { isAuthenticated, isClient, isAdmin } from "../helpers/auth";
import {
  } from "../controllers/admin.controller";

  const router = Router();