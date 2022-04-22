const ParkingSpot = require('../models/ParkingSpot');

//get all parking spots in the database
exports.getParkingSpots = function (req, res) {
    ParkingSpot.getParkingSpots(function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.json(result);
        }
    });
};

//get parking spot which matches the provided id
//id is pulled from the req property
exports.getParkingSpotById = function (req, res) {
    ParkingSpot.getParkingSpotById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//Delete Parking Spot that matches the provided id
//parkingSpotId is available from req.params property from the url
exports.deleteParkingSpotById = function (req, res) {
    ParkingSpot.deleteParkingSpotById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};


//get all listings in the database
exports.getHostListingsByHostId = function (req, res) {
    ParkingSpot.getHostListingsByHostId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.json(result);
        }
    });
};

//get all listings in the database
exports.getFavoritesByGuestId = function (req, res) {
    ParkingSpot.getFavoritesByGuestId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.json(result);
        }
    });
};

//add User to the database
//the attributes must be passed as query string parameters
exports.addParkingSpot = function (req, res) {
    ParkingSpot.addParkingSpot(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result);
        }
    });
};