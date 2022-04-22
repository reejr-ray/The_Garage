const databaseConnection = require('../databaseConnection');

//Login Object Constructor
let Login = function () {
};

//mySql request to retrieve user with matching username and password
Login.verifyLoginCredentials = function (req, result,) {
    databaseConnection.connection.query('SELECT * FROM User ' +
        'WHERE email = "' + req.params.email + '" AND password = "' + req.params.password + '" ;'
        , function (err, res) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};


//exporting the login object for use in the App
module.exports = Login;