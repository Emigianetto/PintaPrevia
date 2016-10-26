// app/assets/javascripts/cable.js
// require action_cable
//= require_self
// require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer("ws://cable.example.com");
}).call(this);