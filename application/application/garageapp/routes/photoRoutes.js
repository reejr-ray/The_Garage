const express = require('express');
const router = express.Router();
const Photo = require('../controllers/photoController');

//endpoint for retrieving Photo with matching ID
router.route('/photo/:photoId').get(Photo.getPhotoById);

//endpoint for adding User Photos to the database
//Photos attributes must be provided as query parameters in the URL
router.route('/photo/user/').post(Photo.postUserPhoto);

//endpoint for adding Parking Spot Photos to the database
//Photos attributes must be provided as query parameters in the URL
router.route('/photo/parking-spot/').post(Photo.postParkingSpotPhoto);

//endpoint for deleting a User with matching ID
router.route('/photo/delete/:photoId').delete(Photo.deletePhotoById);

//exporting the router with the /photo routes for use in the App
module.exports = router;