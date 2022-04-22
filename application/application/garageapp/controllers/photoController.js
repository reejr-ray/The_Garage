const Photo = require('../models/Photo');

//get Photo that matches the provided id
//PhotoId is available from req.params property from the url
exports.getPhotoById = function (req, res) {
    Photo.getPhotoWithId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//add Photo to the database
//the attributes must be passed as query string parameters
exports.postUserPhoto = function (req, res) {
    Photo.addPhoto(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//add Photo to the database
//the attributes must be passed as query string parameters
exports.postParkingSpotPhoto = function (req, res) {
    Photo.addPhoto(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//Delete Photo that matches the provided id
//photoId is available from req.params property from the url
exports.deletePhotoById = function (req, res) {
    Photo.deletePhotoById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};