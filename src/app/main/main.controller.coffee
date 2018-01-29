angular.module 'randomized'
 .controller 'MainController', ($timeout, $scope, $interval, HomeService) ->
    'ngInject'

    $scope.choice       = 'numbers'
    $scope.qttNumbers   = 10
    $scope.numbersTo    = 1
    $scope.numbersFrom  = 10

    $scope.methods =
      getRandomNumber: () ->
        min = $scope.numbersFrom
        max = $scope.numbersTo


        randomNum = Math.floor(Math.random()*(max-min+1)+min)
        console.log a

        $scope.randomNumbers = [1,2,3,4,5,6,7,8,9,10]

    return
