(function() {
  this.myapp = angular.module("myapp", ["ngRoute", "ngAnimate"]);

  this.myapp.config([
    '$routeProvider', function($routeProvider) {
      return $routeProvider.when("/page2", {
        controller: "Page2",
        templateUrl: "page2.html"
      }).otherwise({
        controller: "Top",
        templateUrl: "top.html"
      });
    }
  ]);

}).call(this);

(function() {
  this.myapp.controller('Page2', [function() {}]);

}).call(this);

(function() {
  this.myapp.controller('Top', [function() {}]);

}).call(this);
