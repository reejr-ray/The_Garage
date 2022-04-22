const databaseConnection = require('../databaseConnection');

//Account Object Constructor
let Account = function () {
};

//get Account with the matching ID
//the account ID is available in req.params properties from the URL
Account.getAccountWithId = function (req, result,) {
    databaseConnection.connection.query('SELECT * FROM Account ' +
        'WHERE idAccount = ' + req.params.accountId, function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);

        }

    });
};

//Inserts an Account into the database
//attributes must be passed as query parameters in the URL
Account.addAccount = function (req, result,) {
    databaseConnection.connection.query(
        "INSERT INTO User" +
        "(idAccount,Region_idRegion,User_idUser) " +
        "VALUES(" + "'" + req.query.idAccount + '"' + ',' + +'"' +
        req.query.region_idRegion + "'" + "," + "'" +
        req.query.user_idUser + "'" + ");",
        function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);

            }
        });
};

//mySQL request to delete Account with matching ID
//accountId is available in req.params property form the url
Account.deleteAccountById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Account ' +
        'WHERE idAccount = ' + req.params.accountId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//exporting the Account Object for use in the App
module.exports = Account;