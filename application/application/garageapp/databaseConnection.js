const mysql = require('mysql');

const mySqldatabaseName = 'myGaragedb';

const mySqlConnection = mysql.createConnection({
    host: 'localhost',
    user: 'garageOwner',
    password: 'h3r3inMyG4rag3',
    database: mySqldatabaseName,
});

mySqlConnection.connect(function (err) {
    if (err) throw err;
});
console.log('MySQL Database Connection initiated');

module.exports = {
    connection: mySqlConnection,
    databaseName: mySqldatabaseName,
}