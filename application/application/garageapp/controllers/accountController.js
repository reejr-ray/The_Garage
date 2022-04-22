const Account = require('../models/Account');

//get Account with matching ID
// Account ID is available from req.params properties from the URL
exports.getAccountById = function (req, res) {
    Account.getAccountWithId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//add Account to database
//Account properties must be provided as query parameters in request
exports.postAccount = function (req, res) {
    Account.addAccount(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });

};

//Delete Account that matches the provided id
//accountId is available from req.params property from the url
exports.deleteAccountById = function (req, res) {
    Account.deleteAccountById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};