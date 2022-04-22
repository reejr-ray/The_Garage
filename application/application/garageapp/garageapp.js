const express = require('express');
const parkingSpotRoutes = require('./routes/parkingSpotRoutes');
const userRoutes = require('./routes/userRoutes');
const accountRoutes = require('./routes/accountRoutes');
const hostRoutes = require('./routes/hostRoutes');
const guestRoutes = require('./routes/guestRoutes');
const regionRoutes = require('./routes/regionRoutes');
const vehicleRoutes = require('./routes/vehicleRoutes');
const photoRoutes = require('./routes/photoRoutes');
const uploadRoutes = require('./routes/uploadRoutes');
const loginRoutes = require('./routes/loginRoutes');

//staring the express app to listen for requests on port
const app = express();
const port = process.env.PORT || 80;
app.listen(port);
console.log("Listening on port:  " + port);


//this makes use of the routes in the /routes directory
//parkingRoutes(app);
//userRoutes(app);
app.use(parkingSpotRoutes);
app.use(userRoutes);
app.use(accountRoutes);
app.use(hostRoutes);
app.use(guestRoutes);
app.use(regionRoutes);
app.use(vehicleRoutes);
app.use(photoRoutes);
app.use(uploadRoutes);
app.use(loginRoutes);

app.get('/', function (req, res) {
    res.sendFile(path + 'homepage.html');
});

let path = __dirname + '/views/';

//app.use('/', router);
app.use(express.static(__dirname));
app.use(express.static(path));
console.log('Directory name: ' + __dirname);
