@myapp.controller 'Top', ['$scope', ($scope) ->
  $scope.list = [
    "Angular.js"
    "Backbone.js"
    "Ember.js"
    "Knockout.js"
  ]
  $scope.add = -> $scope.list.push $scope.name if $scope.name
  $scope.delete = -> $scope.list.pop()
]
