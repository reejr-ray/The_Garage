const express = require('express');
const router = express.Router();
const Account = require('../controllers/accountController');

//endpoint for retreiveing Account with matching ID
router.route('/account/:accountId').get(Account.getAccountById);

//endpoint for adding an account to the database
//Account attributes must be provided in query parameters in the request
router.route('/account/').post(Account.postAccount);

//endpoint for deleting an Account with matching ID
router.route('/account/delete/:accountId').delete(Account.deleteAccountById);

//exporting router with /account routes for use in the App
module.exports = router;