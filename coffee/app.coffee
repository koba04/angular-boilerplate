@myapp = angular.module "myapp", ["ngRoute", "ngAnimate"]

@myapp.config ['$routeProvider', ($routeProvider) ->
  $routeProvider

    .when "/page2",
      controller: "Page2"
      templateUrl: "page2.html"

    .otherwise
      controller: "Top"
      templateUrl: "top.html"

]

