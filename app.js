const express = require('express');

const app = express();

app.get('/vagrant', function (req, res) {
  res.send('Yeah, vagrant is working!');
});

app.get('/', function (req, res) {
  res.send('API is up...');
});

app.listen(3000, () => {
  console.log('Listening on port 3000');
});
