const databaseConnection = require('../databaseConnection');

//User Object Constructor
let User = function () {
};

//mySQL request to retrieve user with matching ID
// userID is available in req.params property form the url
User.getUserWithId = function (req, result,) {
    databaseConnection.connection.query('SELECT * FROM User ' +
        'WHERE idUser = ' + req.params.userId, function (err, res) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//insert user to the database
//attributes must be provided in query string parameters
User.addUser = function (req, result,) {
    databaseConnection.connection.query(
        "INSERT INTO User" +
        "(idUser,first_Name,last_Name,rating)" +
        "VALUES (" + "'" + req.query.idUser + "'" + "," + "'" +
        req.query.first_Name + "'" + "," + "'" +
        req.query.last_Name + "'" + "," + "'" +
        req.query.rating + "'" + ");", function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//mySQL request to delete user with matching ID
//userId is available in req.params property form the url
User.deleteUserById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM User ' +
        'WHERE idUser = ' + req.params.userId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//exporting the User object for use in the App
module.exports = User;