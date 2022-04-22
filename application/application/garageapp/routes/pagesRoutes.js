module.exports = function (app) {
    let ParkingSpot = require('../controllers/parkingSpotController');

    app.route('/parking-spot')
        .get(ParkingSpot.listAllTables);
};