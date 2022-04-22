const express = require('express');
const router = express.Router();
const User = require('../controllers/userController');

//endpoint for retrieving User with matching ID
router.route('/user/:userId').get(User.getUserById);

//endpoint for adding user to the database
//User attributes must be provided as query parameters in the URL
router.route('/user/').post(User.postUser);

//endpoint for deleting a User with matching ID
router.route('/user/delete/:userId').delete(User.deleteUserById);

//exporting the router with the /user routes for use in the App
module.exports = router;