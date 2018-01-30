angular.module 'randomized'
 .controller 'MainController', ($timeout, $scope, $interval, HomeService) ->
    'ngInject'

    $scope.choice         = 'options'
    $scope.methods        = 
      numbers : {}
      options : {}

    # Numbers
    $scope.numbers        =
      qttNumbers   : undefined
      numbersFrom  : undefined
      numbersTo    : undefined
    $scope.randomNumbers  = []
    $scope.allNumbers     = undefined
    $scope.invalidNumbers = undefined

    $scope.methods.numbers =
      containNumber: (array, number) ->
         return if _.contains array, number then yes else no
         
      getRandomNumber: () ->
        $scope.randomNumbers  = []
        $scope.allNumbers     = [$scope.numbers.numbersFrom..$scope.numbers.numbersTo]
        min                   = $scope.numbers.numbersFrom
        max                   = $scope.numbers.numbersTo

        for i in [1..$scope.numbers.qttNumbers]
          randomNum = $scope.allNumbers[Math.floor(Math.random()*$scope.allNumbers.length)]

          while $scope.methods.numbers.containNumber($scope.randomNumbers, randomNum)
            index = $scope.allNumbers.indexOf(randomNum)
            if index > -1
              $scope.allNumbers.splice(index, 1)
              randomNum = $scope.allNumbers[Math.floor(Math.random()*$scope.allNumbers.length)]

          $scope.randomNumbers.push randomNum

    $scope.$watch 'numbers', (newVal, oldVal) ->
      $scope.allNumbers     = [$scope.numbers.numbersFrom..$scope.numbers.numbersTo]
      $scope.invalidNumbers = if (newVal.qttNumbers > $scope.allNumbers.length || newVal.numbersFrom >= newVal.numbersTo) then yes else no 
    , yes

    # Options
    $scope.options = []
    $scope.enteredOption  = ''
    $scope.randomValue = undefined

    $scope.methods.options =
      addWord : () ->
        if $scope.enteredOption isnt ''
          $scope.options.push $scope.enteredOption
          $scope.enteredOption = undefined

      removeWord : (index) ->
        $scope.options.splice(index, 1)

      clear : () ->
        $scope.options = []

      getRandomValue : () -> 
        $scope.randomValue = $scope.options[Math.floor(Math.random()*$scope.options.length)]

    return
