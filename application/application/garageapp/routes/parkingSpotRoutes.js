const express = require('express');
const router = express.Router();
const ParkingSpot = require('../controllers/parkingSpotController');

//endpoint to retrieve all Parking Spots in the database
router.route('/parking-spot/').get(ParkingSpot.getParkingSpots);

//endpoint to retrieve parking spot that matches the provided id
//the id is passed to the controller and used by the Parking Spot methods to request it from the database
router.route('/parking-spot/:parkingSpotId').get(ParkingSpot.getParkingSpotById);

//endpoint for adding a parking spot
router.route('/parking-spot/:hostId').get(ParkingSpot.addParkingSpot);

//endpoint for deleting a Parking Spot with matching ID
router.route('/parking-spot/delete/:parkingSpotId').delete(ParkingSpot.deleteParkingSpotById);

//endpoint for viewing Host listings
router.route('/parking-spot/listings/:hostId').get(ParkingSpot.getHostListingsByHostId);

//endpoint for viewing Guest favorites
router.route('/parking-spot/favorites/:guestId').get(ParkingSpot.getFavoritesByGuestId);

//exporting router with added parking spot routes for use in App
module.exports = router;
