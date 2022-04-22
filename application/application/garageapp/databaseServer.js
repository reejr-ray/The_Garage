const mysql = require('mysql');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'garageOwner',
    password: 'h3r3inMyG4rag3',
    database: 'myGaragedb',
});

connection.connect();

connection.query('SELECT table_name FROM information_schema.tables ' +
    'WHERE table_schema = "GarageApp"', function (err, results, fields) {
    if (err) throw err;

    console.log('The GarageApp Table Names : ', results);
});

connection.end();