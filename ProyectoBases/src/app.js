import express from "express";
import path from "path";
import { engine } from 'express-handlebars';
import cors from "cors";
import userRoutes from "./routes/users.routes";
import productRoutes from "./routes/products.routes";
import purchaseRoutes from "./routes/purchase.routes";
import adminRoutes from "./routes/admin.routes";
import morgan from "morgan";
import methodOverride from "method-override";
import session from "express-session";
import flash from "connect-flash"
import passport from "passport";
import config from "./config";
import Handlebars from 'handlebars'
import multer from "multer";


const fs = require('fs')

//MAIL
const nodemailer = require('nodemailer');

const app = express();
import('./config/passport');

//MAIL
let transporter = nodemailer.createTransport({
    host: "smtp-mail.outlook.com", // hostname
    secureConnection: false, // TLS requires secureConnection to be false
    port: 587, // port for secure SMTP
    tls: {
       ciphers:'SSLv3'
    },
    auth: {
        user: 'shopatwhiskybrothers@outlook.com',
        pass: 'proyectobases2'
    }
});

var mailOptions = {
    from: 'shopatwhiskybrothers@outlook.com', // sender address (who sends)
    to: 'valeria44a@gmail.com', // list of receivers (who receives)
    subject: 'Hello ', // Subject line
    text: 'Hello world ', // plaintext body
    html: '<b>Hello world </b><br> This is the first email sent with Nodemailer in Node.js' // html body
};

/*transporter.sendMail(mailOptions, function(error, info){
    if(error){
        return console.log(error);
    }

    console.log('Message sent: ' + info.response);
});*/


//Satich paths
app.use(express.static(__dirname + '/public/css'));


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
app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

app.use((req, res, next) => {
    res.locals.success_msg = req.flash("success_msg");
    res.locals.error_msg = req.flash("error_msg");
    res.locals.error = req.flash("error");
    res.locals.user = req.user || null;
    next();
  }); 
  

const storage =
    multer.diskStorage({
        filename: function (req,file,cb) {
            cb(null, file.originalname); 
        },
        
    destination: path.join(__dirname,'public/uploads')
});


app.use(multer({
    storage,
    dest: path.join(__dirname,'public/uploads')
}).single('image'));

// Routes
app.use(userRoutes);
app.use(productRoutes);
app.use(purchaseRoutes);
app.use(adminRoutes);



//Helpers
Handlebars.registerHelper('ifEquals', function(arg1, arg2, options) {
    if (arg1 === arg2) {
        return options.fn(this)
    } else {
        return options.inverse(this)
    }
})

export default app;
