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
  this.myapp.controller('Page2', ['$scope', function($scope) {}]);

}).call(this);

(function() {
  this.myapp.controller('Top', [
    '$scope', function($scope) {
      $scope.list = ["Angular.js", "Backbone.js", "Ember.js", "Knockout.js"];
      $scope.add = function() {
        if ($scope.name) {
          return $scope.list.push($scope.name);
        }
      };
      return $scope["delete"] = function() {
        return $scope.list.pop();
      };
    }
  ]);

}).call(this);
