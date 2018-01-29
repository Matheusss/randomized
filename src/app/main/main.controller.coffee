angular.module 'randomized'
 .controller 'MainController', ($timeout, $scope, $interval, HomeService) ->
    'ngInject'

    $scope.choice       = 'numbers'
    $scope.qttNumbers   = 5
    $scope.numbersFrom  = 1
    $scope.numbersTo    = 10
    $scope.randomNumbers  = []
    $scope.allNumbers     = [$scope.numbersFrom..$scope.numbersTo]

    $scope.methods =
      getRandomNumber: () ->
        $scope.randomNumbers  = []
        min                   = $scope.numbersFrom
        max                   = $scope.numbersTo

        for i in [1..$scope.qttNumbers]
          # randomNum = Math.floor(Math.random()*(max-min+1)+min)
          randomNum = $scope.allNumbers[Math.floor(Math.random()*$scope.allNumbers.length)]

          if _.contains $scope.randomNumbers, randomNum
            index = $scope.allNumbers.indexOf($scope.randomNumbers)
            if index > -1
              $scope.allNumbers.splice(index, 1);

            randomNum = $scope.allNumbers[Math.floor(Math.random()*$scope.allNumbers.length)]
            $scope.randomNumbers.push randomNum
          else
            randomNum = $scope.allNumbers[Math.floor(Math.random()*$scope.allNumbers.length)]
            $scope.randomNumbers.push randomNum

        # $scope.randomNumbers = [1,2,3,4,5,6,7,8,9,10]

    return
