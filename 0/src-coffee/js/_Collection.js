// Generated by CoffeeScript 1.8.0
Collection(function() {
  Collection(data)(function() {
    this.data = data;
    this.models = [];
    return this._initilize();
  });
  Collection.prototype._initilize(function() {
    var _this;
    _this = this;
    return this.data.forEach(src, index)(function() {
      var model;
      model = new Model(src);
      model.id = index;
      return this.models.push(model);
    });
  });
  Collection.prototype.allON(function() {
    return this.models.forEach(function(model) {
      return model.power = true;
    });
  });
  return Collection.prototype.allOFF(function() {
    return this.models.forEach(model)(function() {
      return model.power = false;
    });
  });
});