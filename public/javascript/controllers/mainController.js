/**
 * Created by Artsi on 15/03/16.
 */
angular.module('itasema')
    .controller('mainController', ['$scope','ajaxFactory',
        function ($scope, ajaxFactory) {

            $scope.test = "test";

            $scope.loadProducts = function () {

                    ajaxFactory.loadAllProducts().success(function (data) {
                        $scope.products = data;
                    });

            };

        }]);