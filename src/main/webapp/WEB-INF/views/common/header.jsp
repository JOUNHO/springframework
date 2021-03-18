<!DOCTYPE html>
<html>
	<head>
		<title>Spring</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/js/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/bootstrap-4.6.0/js/bootstrap.min.js"></script>
	</head>
  <body>
    <div class="d-flex flex-column vh-100">
			
      <div class="flex-grow-1 container-fluid">
        <div class="row h-100">
          <div class="col-md-4 p-3 bg-dark">
            <div class="h-100 d-flex flex-column">
              <div class="flex-grow-1" style="height:0px; overflow-y: auto; overflow-x: hidden;">
                <%@ include file="/WEB-INF/views/common/menu.jsp"%>
              </div>
            </div>
          </div>

          <div class="col-md-8 p-3">
            <div class=" h-100 d-flex flex-column">
              <div class="flex-grow-1 overflow-auto pr-3" style="height:0px">