const Login = require('../models/Login');

//verify login information
exports.verifyLogin = function (req, res) {
    Login.verifyLoginCredentials( req,function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result);
        }
    });
}