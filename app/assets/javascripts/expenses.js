app.controller('ExpensesController', ['$scope', '$http', function($scope, $http) {
	window.scope = $scope;

	$scope.new_expense = null;
	$scope.filter_data = {};
	$scope.expenses = [];
	$scope.creating = false;
	$scope.group_users = [];

	var getGroups = function () {
		$http.get('/groups')
			.success(function (data) {
				$scope.group_users = data.users;
			});
	};
	getGroups();

	$scope.cancelNew = function () {
		$scope.new_expense = null;
		$scope.creating = false;
	};

	$scope.save = function (expense) {
		var url = '/';
		var method = 'PUT';
		if (expense == $scope.new_expense) {
			url = '/expenses';
			method = 'POST';
		}
		$.blockUI();
		$http({
			method: method,
			url: url,
			data: {
				expense: {
					name: expense.name,
					price: expense.price,
					date: expense.date,
					owner_id: 1
				}
			} 
		})
		.success(function (data) {
			$scope.new_expense = null;
		});
	}

	$scope.filter = function () {
		$.blockUI();
		$http.get('/expenses/filter', {params: $scope.filter_data})
			.success(function (data) {
				$scope.expenses = data.expenses;
			});
	}
	$scope.filter();

}]);
