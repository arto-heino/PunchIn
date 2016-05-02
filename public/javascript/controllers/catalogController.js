/**
 * Created by Artsi on 21/03/16.
 */
angular.module('itasema')
    .controller('catalogController', ['$scope',
        function ($scope) {
            $scope.data = {
                repeatSelect: null,
                availableOptions: [
                    {_id: '1', c_name: 'Option A'},
                    {_id: '2', c_name: 'Option B'},
                    {_id: '3', c_name: 'Option C'}
                ]
            };
        }]);