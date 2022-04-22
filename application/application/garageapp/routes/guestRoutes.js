const express = require('express');
const router = express.Router();
const Guest = require('../controllers/guestController');

//endpoint for retrieving User with matching ID
router.route('/guest/:guestId').get(Guest.getGuestById);

//endpoint for adding guest to the database
//User attributes must be provided as query parameters in the URL
router.route('/guest/').post(Guest.postGuest);

//endpoint for deleting a User with matching ID
router.route('/guest/delete/:guestId').delete(Guest.deleteGuestById);

//exporting the router with the /guest routes for use in the App
module.exports = router;