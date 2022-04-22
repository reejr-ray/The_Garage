const databaseConnection = require('../databaseConnection');

//Photos Object Constructor
let Photo = function () {
};

//mySQL request to retrieve Photos with matching ID
//photoId is available in req.params property form the url
Photo.getPhotoWithId = function (req, result,) {
    databaseConnection.connection.query('SELECT * FROM Photos ' +
        'WHERE idPhotos = ' + req.params.photoId, function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};

//insert Parking Spot Photos to the database
//attributes must be provided in query string parameters
Photo.addParkingSpotPhoto = function (req, result,) {
    databaseConnection.connection.query(
        "INSERT INTO Parking_Spot_Photos" +
        "(idPhotos,img_name,Host_idHost,Host_Account_idAccount,Parking_Spot_idParking_Spot,Parking_Spot_Host_idHost,Parking_Spot_Host_Account_idAccount) " +
        "VALUES (" + "'" +
        req.query.idPhoto + "'" + "," + "'" +
        req.query.img_name + "'" + "," + "'" +
        req.query.host_idHost + "'" + "," + "'" +
        req.query.host_account_idAccount + "'" + "," + "'" +
        req.query.parking_spot_idParking_spot + "'" + "," + "'" +
        req.query.parking_spot_host_idHost + "'" + "," + "'" +
        req.query.parking_spot_host_account_idAccount + "'" + ");", function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//insert User Photos to the database
//attributes must be provided in query string parameters
Photo.addUserPhoto = function (req, result,) {
    databaseConnection.connection.query(
        "INSERT INTO User_Photos" +
        "(idPhotos,img_name,Host_idHost,Host_Account_idAccount,Guest_idGuest,Guest_Account_idAccount) " +
        "VALUES (" + "'" +
        req.query.idPhoto + "'" + "," + "'" +
        req.query.img_name + "'" + "," + "'" +
        req.query.host_idHost + "'" + "," + "'" +
        req.query.host_account_idAccount + "'" + "," + "'" +
        req.query.Guest_idGuest + "'" + "," + "'" +
        req.query.Guest_Account_idAccount + "'" + "," + "'" + ");", function (err, res,) {
            if (err) {
                console.log("error: " + err);
                result(err, null);
            } else {
                result(null, res);
            }
        });
};

//mySQL request to delete photo with matching ID
//userId is available in req.params property form the url
Photo.deletePhotoById = function (req, result) {
    databaseConnection.connection.query('DELETE FROM Photos ' +
        'WHERE idPhotos = ' + req.params.userId + ";", function (err, res,) {
        if (err) {
            console.log("error: " + err);
            result(err, null);
        } else {
            result(null, res);
        }
    });
};


//exporting the Photos object for use in the App
module.exports = Photo;