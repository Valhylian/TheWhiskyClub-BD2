import express from "express";
import path from "path";
import { engine } from 'express-handlebars';
import cors from "cors";
import userRoutes from "./routes/users.routes";
import morgan from "morgan";
import methodOverride from "method-override";
import session from "express-session";

import config from "./config";

const app = express();

// settings
app.set('port', config.port);
app.set('views', path.join(__dirname,'views'));
app.engine(".hbs", engine({
    layoutsDir: path.join(app.get('views'),'layouts'),
    partialsDir: path.join(app.get('views'),'partials'),
    defaultLayout: 'main',
    extname: '.hbs'
}));
app.set('view engine', '.hbs');

// Middlewares
app.use(cors());
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(methodOverride('_method'));
app.use(session({
    secret: 'mysecretapp',
    resave: true,
    saveUninitialized: true 
}));

// Routes
app.use(userRoutes);

export default app;
