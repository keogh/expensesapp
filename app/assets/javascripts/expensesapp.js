app = angular.module('expensesapp', ['ui']);

app.config(['$httpProvider', function($httpProvider) {
	$httpProvider.defaults.headers.post['X-CSRF-Token'] = $("meta[name='csrf-token']").attr('content');
	$httpProvider.responseInterceptors.push('httpInterceptor');
}]);

app.factory('httpInterceptor', ['$q', function($q) {
	return function(promise) {
		return promise.then(function(response) {
			$.unblockUI();
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
			$.unblockUI();
			app.message.error('Ha ocurrido un error en su petición');
		});
	}
}]);

app.value('ui.config', {
  select2: {
    width: 'element'
  }
});
