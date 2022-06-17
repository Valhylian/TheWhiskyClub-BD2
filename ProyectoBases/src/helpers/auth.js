const helpers = {};

helpers.isAuthenticated = (req, res, next)  => {
    if(req.isAuthenticated()){
        return next();
    }
    req.flash('error_msg','You need to be logged in order to access this section');
    res.redirect('/users/signin');
};

helpers.isNotAuthenticated = (req, res, next)  => {
    if(!req.isAuthenticated()){
        return next();
    }
    req.flash('error_msg','You need to be logged out in order to access this section');
    res.redirect('/');
};

helpers.isClient = (req, res, next)  => {
    if(req.isAuthenticated()){
        if(req.user.userType == 1){
        return next();
        }
        req.flash('error_msg','This operation is exclusive to clients');
        res.redirect('/');
    }
    req.flash('error_msg','You need to be logged in order to access this section');
    res.redirect('/users/signin');
};

helpers.isAdmin = (req, res, next)  => {
    if(req.isAuthenticated()){
        if(req.user.userType == 2){
        return next();
        }
        req.flash('error_msg','This account does does not have access to this section');
        res.redirect('/');
    }
    req.flash('error_msg','You need to be logged in order to access this section');
    res.redirect('/users/signin');
};

module.exports = helpers;