function VideoListController($scope, $http) {
  $scope.allVideos = [];
  $scope.popularVideos = [];
  $scope.myVideos = [];

  $http.get('/home/get_list').
  success(function(data) {
    $scope.allVideos = data;
  });

  $http.get('/home/get_list?filter_by=likes').
  success(function(data) {
    $scope.popularVideos = data;
  });

  $http.get('/home/get_list?filter_by=contributor&contributor_name=admin').
  success(function(data) {
    $scope.myVideos = data;
  });
}