const databaseConnection = require('../databaseConnection');

//Region Object Constructor
let Region = function () {
};

//get all Regions in the database
Region.getRegions = function (result) {
    databaseConnection.connection.query('SELECT * FROM Region',
        function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};


//mySQL request to retrieve Region with matching ID
// RegionID is available in req.params property form the url
Region.getRegionWithId = function (req, result,) {
    databaseConnection.connection.query('SELECT * FROM Region ' +
        'WHERE idRegion = ' + req.params.regionId, function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//insert Region to the database
//attributes must be provided in query string parameters
Region.addRegion = function (req, result,) {
    databaseConnection.connection.query(
        "INSERT INTO Region" +
        "(idRegion,regionName)" +
        "VALUES (" + "'" + req.query.idRegion + "'" + "," + "'" +
        req.query.regionName + "'" + ");", function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//mySQL request to delete region with matching ID
//regionId is available in req.params property form the url
Region.deleteRegionById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Region ' +
        'WHERE idRegion = ' + req.params.regionId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//exporting the Region object for use in the App
module.exports = Region;