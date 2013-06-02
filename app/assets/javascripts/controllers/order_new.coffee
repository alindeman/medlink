angular.module('medSupplies.controllers')

.controller('OrderNewCtrl', [
  '$scope',
  'Order',
  'Supply',

  ($scope, Order, Supply) ->
    ###
    order = new Order(
      requests_attributes: [
          supply_id: 1
        ,
          supply_id: 2
      ]
    )

    order.create().then (result) ->
      console.log result
    ###

    $scope.supplies = Supply.query()

    $scope.order =
      requestsAttributes: []
      extra: ''

    $scope.addRequest = ->
      $scope.order.requestsAttributes.push
        supplyId: ''
        dosageValue: ''
        dosageUnits: ''
        quantity: ''

    $scope.submitOrder = ->
      orderData = angular.copy($scope.order)
      angular.forEach orderData.requestsAttributes, (req) ->
        req.dose = req.dosageValue + req.dosageUnits
        delete req.dosageValue
        delete req.dosageUnits
      console.log orderData

    $scope.addRequest()
    $scope.units = [
      'mg'
      'mL'
      'g'
      'dL'
      'gr'
      'kg'
      'oz'
      'tbsp'
      'tsp'
      'μg'
    ]
])