const Region = require('../models/Region');

//get all Regions in the database
exports.getRegions = function (req, res) {
    Region.getRegions(function (err, result) {
        console.log("Controller");
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result);
        }
    });
};

//get Region that matches the provided id
//regionId is available from req.params property from the url
exports.getRegionById = function (req, res) {
    Region.getRegionWithId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//add Region to the database
//the attributes must be passed as query string parameters
exports.postRegion = function (req, res) {
    Region.addRegion(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//Delete Region that matches the provided id
//regionId is available from req.params property from the url
exports.deleteRegionById = function (req, res) {
    Region.deleteRegionById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};