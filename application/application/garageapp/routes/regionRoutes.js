const express = require('express');
const router = express.Router();
const Region = require('../controllers/regionController');

//endpoint to retrieve all parking spots in the database
router.route('/region/').get(Region.getRegions);

//endpoint to retrieve parking spot that matches the provided id
//the id is passed to the controller and used by the Parking Spot methods to request it from the database
router.route('/region/:regionId').get(Region.getRegionById);

//endpoint for adding Region to the database
//User attributes must be provided as query parameters in the URL
router.route('/region/').post(Region.postRegion);

//endpoint for deleting a User with matching ID
router.route('/region/delete/:regionId').delete(Region.deleteRegionById);

//exporting router with added parking spot routes for use in App
module.exports = router;

