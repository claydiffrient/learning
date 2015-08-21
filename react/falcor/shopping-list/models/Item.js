var Waterline = require('waterline');

var Item = Waterline.Collection.extend({
  identity: 'item',
  connection: 'default',
  attributes: {
    name: {
      type: 'string',
      required: true
    },
    price: 'float'
  }
});

module.exports = Item;