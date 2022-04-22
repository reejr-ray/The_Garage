const databaseConnection = require('../databaseConnection');

//Parking Spot Object Constructor
let ParkingSpot = function () {
};

//get all parking spots in the database
ParkingSpot.getParkingSpots = function (result) {
    databaseConnection.connection.query('SELECT * ' +
        'FROM myGaragedb.Parking_Spot ' +
        'JOIN myGaragedb.Parking_Spot_Photos ON Parking_Spot_Photos.Parking_Spot_idParking_Spot = Parking_Spot.idParking_Spot;',
        function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//get the parking spot that matches the id
//parkingSpotId is available in the req.params property in the URL
ParkingSpot.getParkingSpotById = function (req, result) {
    databaseConnection.connection.query('SELECT * FROM Parking_Spot ' +
        'WHERE idParking_Spot = ' + req.params.parkingSpotId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//mySQL request to delete parking spot with matching ID
//parkingSpotId is available in req.params property form the url
ParkingSpot.deleteParkingSpotById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Parking_Spot ' +
        'WHERE idParking_Spot = ' + req.params.parkingSpotId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//get the parking spot that matches the id
//parkingSpotId is available in the req.params property in the URL
ParkingSpot.getHostListingsByHostId = function (req, result) {
    databaseConnection.connection.query('SELECT * FROM Parking_Spot ' +
        ' JOIN myGaragedb.Parking_Spot_Photos ON Parking_Spot_Photos.Parking_Spot_idParking_Spot = Parking_Spot.idParking_Spot ' +
        'Having myGaragedb.Parking_Spot.Host_idHost = ' + req.params.hostId + ';',
        function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

ParkingSpot.getFavoritesByGuestId = function (req, result) {
    databaseConnection.connection.query('SELECT * FROM Parking_Spot WHERE Guest_idGuest = ' + req.params.guestId +
        ' JOIN myGaragedb.Parking_Spot_Photos ON Parking_Spot_Photos.Parking_Spot_idParking_Spot = Parking_Spot.idParking_Spot;',
        function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//insert parking spot to the database
//attributes must be provided in query string parameters
ParkingSpot.addUser = function (req, result,) {
    databaseConnection.connection.query(
        "INSERT INTO Parking_Spot" +
        "(idParking_Spot,Street,City,State,Country,ZipCode,Status,rentalRate,parkingType,Host_idHost,Host_Account_idAccount" +
        ",Start_Time,End_Time,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday)" +
        "VALUES (" + "'" + req.query.idParking_Spot + "'" + "," + "'" +
        req.query.Street + "'" + "," + "'" +
        req.query.City + "'" + "," + "'" +
        req.query.State + "'" + "," + "'" +
        req.query.Country + "'" + "," + "'" +
        req.query.ZipCode + "'" + "," + "'" +
        req.query.Status + "'" + "," + "'" +
        req.query.rentalRate + "'" + "," + "'" +
        req.query.parkingType + "'" + "," + "'" +
        req.query.Host_idHost + "'" + "," + "'" +
        req.query.Host_Account_idAccount + "'" + "," + "'" +
        req.query.Start_Time + "'" + "," + "'" +
        req.query.End_Time + "'" + "," + "'" +
        req.query.Monday + "'" + "," + "'" +
        req.query.Tuesday + "'" + "," + "'" +
        req.query.Wednesday + "'" + "," + "'" +
        req.query.Thursday + "'" + "," + "'" +
        req.query.Friday + "'" + "," + "'" +
        req.query.Saturday + "'" + "," + "'" +
        req.query.Sunday + "'" + ");", function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//exporting the ParkingSpot object for use in the App
module.exports = ParkingSpot;