const Host = require('../models/Host');

//get Host that matches the provided id
//hostId is available from req.params property from the url
exports.getHostById = function (req, res) {
    Host.getHostWithId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//add Host to the database
//the attributes must be passed as query string parameters
exports.postHost = function (req, res) {
    Host.addHostst(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//Delete Host that matches the provided id
//hostId is available from req.params property from the url
exports.deleteHostById = function (req, res) {
    Host.deleteHostById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};