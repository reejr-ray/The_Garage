const express = require('express');
const router = express.Router();
const Upload = require('../controllers/uploadController');

//endpoint for uploading files
router.route('/upload').post(Upload.postFile);

//exporting the router with the /upload routes for use in the app
module.exports = router;