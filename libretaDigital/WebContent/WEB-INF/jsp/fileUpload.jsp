<%@ page import="org.codehaus.jackson.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="app">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%
	String pageTitle = (String) request.getAttribute("tituloPagina");
	if (pageTitle == null) {
		pageTitle = "Libreta Digital";
	}
%>
<title><%=pageTitle%></title>
<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>

<body ng-controller="fileUploadCtrl" nv-file-drop="" uploader="uploader" filters="queueLimit, customFilter">

	<div class="container">

		<jsp:include page="/WEB-INF/jsp/parts/menu-head.jsp" />

		<div class="row">
		<div class="alert alert-danger" ng-show="uploadError!=null">{{uploadError}}</div>
			<div class="col-md-4">
				<h3>Dep�sito de archivos</h3>
				<div ng-show="uploader.isHTML5" class="drop-zone">
					<div class="well my-drop-zone" nv-file-over="" uploader="uploader">
					</div>					
				</div>
				<br/> 				
				<input type="file" nv-file-select="" uploader="uploader" class="btn btn-default"/>
			</div>
			<div class="col-md-8" style="margin-bottom: 40px">
				<h3>Cola de Carga</h3>
				<p>Tama�o: {{ uploader.queue.length }}</p>
				
				<table class="table">
					<thead>
						<tr>
							<th width="50%">Nombre</th>
							<th ng-show="uploader.isHTML5">Tama�o</th>
							<th ng-show="uploader.isHTML5">Progreso</th>
							<th>Estado</th>
							<th>Acciones</th>
						</tr>
					<tbody>
						<tr ng-repeat="item in uploader.queue">
							<td><strong>{{ item.file.name }}</strong></td>
							<td ng-show="uploader.isHTML5" nowrap>{{ item.file.size/1024/1024|number:2 }} MB</td>
							<td ng-show="uploader.isHTML5">
								<div class="progress" style="margin-bottom: 0;">
									<div class="progress-bar" role="progressbar" ng-style="{ 'width': item.progress + '%' }"></div>
								</div>
							</td>
							<td class="text-center"><span ng-show="item.isSuccess"><i class="glyphicon glyphicon-ok"></i></span> <span
								ng-show="item.isCancel"><i class="glyphicon glyphicon-ban-circle"></i></span> <span ng-show="item.isError"><i
									class="glyphicon glyphicon-remove"></i></span></td>
							<td nowrap>
							
								<button type="button" class="btn btn-success btn-xs" ng-click="item.upload()"
									ng-disabled="item.isReady || item.isUploading || item.isSuccess">
									<span class="glyphicon glyphicon-upload"></span> Subir
								</button>
								<button type="button" class="btn btn-warning btn-xs" ng-click="item.cancel()" ng-disabled="!item.isUploading">
									<span class="glyphicon glyphicon-ban-circle"></span> Cancelar
								</button>
								<button type="button" class="btn btn-danger btn-xs" ng-click="item.remove()">
									<span class="glyphicon glyphicon-trash"></span> Remover
								</button>
							</td>
						</tr>
					</tbody>
				</table>

				<div>
					<div>
						Progreso:
						<div class="progress" style="">
							<div class="progress-bar" role="progressbar" ng-style="{ 'width': uploader.progress + '%' }"></div>
						</div>
					</div>
					<button type="button" class="btn btn-success btn-s" ng-click="uploader.uploadAll()"
						ng-disabled="!uploader.getNotUploadedItems().length">
						<span class="glyphicon glyphicon-upload"></span> Cargar
					</button>
					<button type="button" class="btn btn-warning btn-s" ng-click="uploader.cancelAll()" ng-disabled="!uploader.isUploading">
						<span class="glyphicon glyphicon-ban-circle"></span> Cancelar
					</button>
					<button type="button" class="btn btn-danger btn-s" ng-click="uploader.clearQueue()" ng-disabled="!uploader.queue.length">
						<span class="glyphicon glyphicon-trash"></span> Remover
					</button>
				</div>

			</div>

		</div>

	</div>

</body>

<jsp:include page="/WEB-INF/jsp/parts/footer.jsp" />


</html>

