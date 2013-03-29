app.controller('ExpensesController', ['$scope', '$http', function($scope, $http) {

	$http.get('/expenses/new')
		.success(function (data, status) { 
			console.log('asi');
			console.log(data, status);
		});

}])
