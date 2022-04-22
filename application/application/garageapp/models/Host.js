const databaseConnection = require('../databaseConnection');

//Host Object Constructor
let Host = function () {
};

//mySQL request to retrieve Host with matching ID
// userID is available in req.params property form the url
Host.getHostWithId = function (req, result,) {
    databaseConnection.connection.query('SELECT * FROM Host ' +
        'WHERE idHost = ' + req.params.hostId, function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//insert Host to the database
//attributes must be provided in query string parameters
Host.addHost = function (req, result,) {
    databaseConnection.connection.query(
        "INSERT INTO Host" +
        "(idHost,Account_idAccount)" +
        "VALUES (" + "'" + req.query.hostId + "'" + "," + "'" +
        req.query.hostId + "'" + "," + "'" +
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

//mySQL request to delete Host with matching ID
//hostID is available in req.params property form the url
Host.deleteHostById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Host ' +
        'WHERE idHost = ' + req.params.hostId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//mySQL request to delete host with matching ID
//hostId is available in req.params property form the url
Host.deleteHostById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Host ' +
        'WHERE idHost = ' + req.params.hostId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//exporting the Host object for use in the App
module.exports = Host;