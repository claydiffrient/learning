var memoryAdapter = require('sails-memory');
var Waterline = require ('waterline');
var fs = require('fs');
var path = require('path');

var orm = new Waterline();

var config = {
  adapters: {
    'memory': memoryAdapter
  },
  connections: {
    default: {
      adapter: 'memory'
    }
  }
};

fs
  .readdirSync(__dirname)
  .filter(function(file) {
    return (file.indexOf(".") !== 0) && (file !== "index.js");
  })
  .forEach(function(file) {
    var model = require(path.join(__dirname, file));
    orm.loadCollection(model);
  });

module.exports = {waterline: orm, config: config};