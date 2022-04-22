const express = require('express');
const router = express.Router();
const Login = require('../controllers/loginController');

//endpoint for login
router.route('/login/:email/password/:password/').get(Login.verifyLogin);

//exporting router with the login routes for use in the App
module.exports = router;