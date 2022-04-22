const databaseConnection = require('../databaseConnection');

//Vehicle Object Constructor
let Vehicle = function () {
};

//get all Vehicles in the database
Vehicle.getVehicles = function (result) {
    databaseConnection.connection.query('SELECT * FROM Vehicle',
        function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//mySQL request to retrieve Vehicle with matching ID
// VehicleID is available in req.params property form the url
Vehicle.getVehicleWithId = function (req, result,) {
    databaseConnection.connection.query('SELECT * FROM Vehicle ' +
        'WHERE idVehicle = ' + req.params.vehicleId, function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//insert Vehicle to the database
//attributes must be provided in query string parameters
Vehicle.addVehicle = function (req, result,) {
    databaseConnection.connection.query(
        "INSERT INTO Vehicle" +
        "(idVehicle,size,color,make,model,license_num,Guest_idGuest,Guest_Account_idAccount)" +
        "VALUES (" + "'" + req.query.idVehicle + "'" + "," + "'" +
        req.query.size + "'" + "," + "'" +
        req.query.color + "'" + "," + "'" +
        req.query.make + "'" + "," + "'" +
        req.query.model + "'" + "," + "'" +
        req.query.license_num + "'" + "," + "'" +
        req.query.Guest_idGuest + "'" + "," + "'" +
        req.query.Guest_Account_idAccount + "'" + ");", function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//mySQL request to delete vehicle with matching ID
//vehicleId is available in req.params property form the url
Vehicle.deleteVehicleById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Vehicle ' +
        'WHERE idVehicle = ' + req.params.vehicleId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//exporting the Vehicle object for use in the App
module.exports = Vehicle;