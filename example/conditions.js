function Conditions() {}

Conditions.prototype.getData = function() {
  var success = function(position) {
    console.log("Possition", position);
  }
  var failure = function() {
    console.log("Error");
  }
  this.getLocation(success, failure);
}

Conditions.prototype.displayData = function() {
  console.log("Loading conditions");
}

Conditions.prototype.getLocation = function(success, error) {
  navigator.geolocation.getCurrentPosition(success, error);
}

$(function() {
  var conditions = new Conditions();
  conditions.getData();
});
