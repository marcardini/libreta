app.controller('fileUploadCtrl', ['$scope', '$http','FileUploader', function($scope, $http, FileUploader) {
/* https://templth.wordpress.com/2014/11/25/implement-uploads-with-angular/*/
	
	 var uploader =  $scope.uploader = new FileUploader({
		  removeAfterUpload: true,
	      autoUpload: false,
	      withCredentials: true,
	      queueLimit: 1,
	      url : '/api/upload'
	      
    });
	
	$scope.upload = function () {
	    $scope.uploader.uploadAll();
	};
	
	$scope.uploader.onBeforeUploadItem = function (fileItem) {
	    $scope.uploadError = null;
	    //fileItem.url = '/api/upload.jsp';
	};

	$scope.uploader.onAfterAddingFile = function () {
	    $scope.uploadError = null;
	};

	$scope.uploader.onErrorItem = function (fileItem) {
	    $scope.uploadError = 'Error when uploading the file '+ fileItem.file.name + '.';
	};

	$scope.uploader.onSuccessItem = function () {
	    // Example: close the current model dialog when the upload succeeds
	    $modalInstance.dismiss();
	    // Example: reload the current screen (using route) when the upload succeeds
	    $route.reload();
	};
	
	$scope.isUploading = function () {
	    return !_.isEmpty($scope.uploader.queue);
	};
	

	// FILTERS
    uploader.filters.push({
        name: 'customFilter',
        fn: function(item /*{File|FileLikeObject}*/ , options) {
            return this.queue.length < 10;
        }
    });

    // CALLBACKS
    uploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/ , filter, options) {
        console.info('onWhenAddingFileFailed', item, filter, options);
    };
    uploader.onAfterAddingFile = function(fileItem) {
        console.info('onAfterAddingFile', fileItem);
    };
    uploader.onAfterAddingAll = function(addedFileItems) {
        console.info('onAfterAddingAll', addedFileItems);
    };
    uploader.onBeforeUploadItem = function(item) {
        console.info('onBeforeUploadItem', item);
    };
    uploader.onProgressItem = function(fileItem, progress) {
        console.info('onProgressItem', fileItem, progress);
    };
    uploader.onProgressAll = function(progress) {
        console.info('onProgressAll', progress);
    };
    uploader.onSuccessItem = function(fileItem, response, status, headers) {
        console.info('onSuccessItem', fileItem, response, status, headers);
    };
    uploader.onErrorItem = function(fileItem, response, status, headers) {
        console.info('onErrorItem', fileItem, response, status, headers);
    };
    uploader.onCancelItem = function(fileItem, response, status, headers) {
        console.info('onCancelItem', fileItem, response, status, headers);
    };
    uploader.onCompleteItem = function(fileItem, response, status, headers) {
        console.info('onCompleteItem', fileItem, response, status, headers);
    };
    uploader.onCompleteAll = function() {
        console.info('onCompleteAll');
    };

    console.info('uploader', uploader);
	
}]);
