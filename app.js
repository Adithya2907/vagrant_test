const express = require('express');

const app = express();

app.get('/', function (req, res) {
  res.send('API is up...');
});

app.get('/route', function (req, res) {
  res.send('This is a new route');
});

app.get('/vagrant', function (req, res) {
  res.send('Vagrant has been set up successfully on your machine');
});

app.listen(3000, () => {
  console.log('Listening on port 3000');
});
