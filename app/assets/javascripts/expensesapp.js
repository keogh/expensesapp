app = angular.module('expensesapp', []);

app.config(['$httpProvider', function($httpProvider) {
	$httpProvider.responseInterceptors.push('httpInterceptor');
}]);

app.factory('httpInterceptor', ['$q', function($q) {
	return function(promise) {
		return promise.then(function(response) {
			if (response.data.message) {
				if (response.data.success) 
					app.message.success(response.data.message);
				else
					app.message.error(response.data.message);
			}
			if (!response.data.success) {
				$q.reject(response);
			}
			return response;
		}, function(response) {
			app.message.error('Ha ocurrido un error en su petición');
		});
	}
}]);

