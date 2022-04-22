const multer = require('multer');

//configuring multer with the path where file uploads will be stored to disk
//filename will be pulled from the forms filename
const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, (__dirname + '/../resources/'));
    },
    filename: function (req, file, cb) {
        cb(null, file.originalname);
    },
});

//configuring multer to limit the maximum file size for uploads
const multerUpload = multer({
    storage: storage,
    limits: 15000000,
}).single('file');

//upload Object Constructor
let Upload = function () {
};

//method to handle file uploads
//the file path for storing the files should be an environment variable
Upload.addFile = function (req, res) {
    console.log('Upload Request made: ' + req.filename);
    multerUpload(req, res, (err) => {
        if (err) {
            res.status(400).send(err);
        }
        console.log('Multer called, req.file: ' + req.toString());
        res.send(req.file);
    });
};

//exporting Upload for use in the app
module.exports = Upload;