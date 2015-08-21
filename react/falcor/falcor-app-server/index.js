var falcorExpress = require('falcor-express');
var Router = require('falcor-router');

var express = require('express');
var app = express();

app.use('/model.json', falcorExpress.dataSourceRoute(function (req, res) {
  return new Router([{
    route: 'greeting',
    get: function () {
      return {path:['greeting'], value: 'Hello World'};
    }
  }]);
}));

app.use(express.static(__dirname + '/'));

var server = app.listen(3000);