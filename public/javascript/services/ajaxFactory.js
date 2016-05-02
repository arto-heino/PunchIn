/**
 * Created by Artsi on 16/03/16.
 */
angular.module('itasema')
    .factory('ajaxFactory', ['$http',
        function ($http) {
            var urlBase = '/';
            var ajaxFunctions = {};

            ajaxFunctions.loadAllProducts = function () {
                return $http.get(urlBase + 'products')
                    .success(function (data) {
                        return data;
                    });
            };
            return ajaxFunctions;
        }]);