const express = require('express');
const router = express.Router();
const Host = require('../controllers/hostController');

//endpoint for retrieving User with matching ID
router.route('/host/:hostId').get(Host.getHostById);

//endpoint for adding user to the database
//User attributes must be provided as query parameters in the URL
router.route('/host/').post(Host.postHost);

//endpoint for deleting a Host with matching ID
router.route('/host/delete/:hostId').delete(Host.deleteHostById);

//exporting the router with the /host routes for use in the App
module.exports = router;