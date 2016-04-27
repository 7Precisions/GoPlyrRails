App = angular.module('GoPlyr', ['ngRoute', 'ngResource', 'templates', 'Devise', 'naif.base64', 'nemLogging']);

App.config(['$routeProvider', '$locationProvider', '$httpProvider', function($routeProvider, $locationProvider, $httpProvider, AuthProvider) {
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
	$routeProvider
		.when('/index', { templateUrl: 'music/index.html', controller: '', title: 'GoPlyr | Play, Download & Share Music', activeTab: 'INDEX' })
		.otherwise({ redirectTo: '/index' });
  $locationProvider.html5Mode(true);
}]);