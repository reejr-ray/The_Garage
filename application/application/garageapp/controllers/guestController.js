const Guest = require('../models/Guest');

//get Guest that matches the provided id
//guestId is available from req.params property from the url
exports.getGuestById = function (req, res) {
    Guest.getGuestWithId(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });
};

//add Guest to the database
//the attributes must be passed as query string parameters
exports.postGuest = function (req, res) {
    Guest.addGuest(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);
        }
    });

};

//Delete Guest that matches the provided id
//guestId is available from req.params property from the url
exports.deleteGuestById = function (req, res) {
    Guest.deleteGuestById(req, function (err, result) {
        if (err) {
            res.send(err);
            console.log('res ', result);
        } else {
            res.send(result[0]);``
        }
    });
};