const express = require('express');
const router = express.Router();
const Vehicle = require('../controllers/vehicleController');

//endpoint to retrieve all parking spots in the database
router.route('/vehicle/').get(Vehicle.getVehicles);

//endpoint for retrieving Vehicle with matching ID
router.route('/vehicle/:vehicleId').get(Vehicle.getVehicleById);

//endpoint for adding Vehicle to the database
//Vehicle attributes must be provided as query parameters in the URL
router.route('/vehicle/').post(Vehicle.postVehicle);

//endpoint for deleting a User with matching ID
router.route('/vehicle/delete/:vehicleId').delete(Vehicle.deleteVehicleById);

//exporting the router with the /vehicle routes for use in the App
module.exports = router;