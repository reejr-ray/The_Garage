const User = require('../models/User');

//get User that matches the provided id
//userId is available from req.params property from the url
exports.getUserById = function (req, res) {
    User.getUserWithId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//add User to the database
//the attributes must be passed as query string parameters
exports.postUser = function (req, res) {
    User.addUser(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result);
        }
    });
};

//Delete User that matches the provided id
//userId is available from req.params property from the url
exports.deleteUserById = function (req, res) {
    User.deleteUserById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result);
        }
    });
};