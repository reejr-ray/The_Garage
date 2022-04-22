const Vehicle = require('../models/Vehicle');

//get all parking spots in the database
exports.getVehicles = function (req, res) {
    Vehicle.getVehicles(function (err, result) {
        console.log("Controller");
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result);
        }
    });
};

//get Vehicle that matches the provided id
//vehicleId is available from req.params property from the url
exports.getVehicleById = function (req, res) {
    Vehicle.getVehicleWithId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//add Vehicle to the database
//the attributes must be passed as query string parameters
exports.postVehicle = function (req, res) {
    Vehicle.addVehicle(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//Delete Vehicle that matches the provided id
//vehicleId is available from req.params property from the url
exports.deleteVehicleById = function (req, res) {
    Vehicle.deleteVehicleById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};