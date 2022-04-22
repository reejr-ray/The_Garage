const databaseConnection = require('../databaseConnection');

//Guest Object Constructor
let Guest = function () {
};

//mySQL request to retrieve Guest with matching ID
// guestID is available in req.params property form the url
Guest.getGuestWithId = function (req, result) {
    databaseConnection.connection.query('SELECT * FROM Guest ' +
        'WHERE idGuest = ' + req.params.guestId, function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//insert Guest to the database
//attributes must be provided in query string parameters
Guest.addGuest = function (req, result) {
    databaseConnection.connection.query(
        "INSERT INTO Guest" +
        "(idGuest,Account_idAccount)" +
        "VALUES (" + "'" + req.query.guestId + "'" + "," + "'" +
        req.query.account_idAccount + "'" + ");",
        function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//delete Guest with matching ID
//guestId is available in the req.params property from the url
Guest.deleteGuestById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Guest ' +
        'WHERE idGuest = ' + req.params.guestId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//mySQL request to delete guest with matching ID
//guestId is available in req.params property form the url
Guest.deleteGuestById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Guest ' +
        'WHERE idGuest = ' + req.params.guestId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//exporting the Guest object for use in the App
module.exports = Guest;