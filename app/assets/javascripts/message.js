app = app || {};

app.message = {
	set: function (msg, type) {
		alert(msg);
	},

	success: function (msg) {
		this.set('success: ' + msg, 'success');
	},

	info: function (msg) {
		this.set('info: ' + msg, 'info');
	},

	error: function (msg) {
		this.set('error: ' + msg, 'error');
	},

	warning: function (msg) {
		this.set('warning: ' + msg, 'warning');
	}
}