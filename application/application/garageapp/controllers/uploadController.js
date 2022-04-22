const Upload = require('../models/Upload');

//upload file
exports.postFile = function (req, res) {
    Upload.addFile(req, res, function (err, result) {
        if (err) {
            res.status(400).send(err);
            console.log('res ', result);
        } else {
            console.log('else ', req.file);
            res.send(req.file);
        }
    });
};