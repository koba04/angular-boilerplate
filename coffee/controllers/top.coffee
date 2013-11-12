@myapp.controller 'Top', ['$scope', ($scope) ->
  $scope.list = [
    "Bob"
    "Jim"
  ]
  $scope.add = -> $scope.list.push $scope.name if $scope.name
  $scope.multiAdd = -> $scope.list.push $scope.name, $scope.name if $scope.name
  $scope.delete = -> $scope.list.pop() if $scope.list.length
]
