<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- 메뉴 내용 부분 --%>
method.jsp
<hr/>
<div class="alert alert-primary">
	현재 요청 방식: ${method}
</div>

<h6>&lt;form&gt;</h6>
<form method="get" action="method3" class="mb-2 d-inline-block">
	<input class="btn btn-success" type="submit" value="GET 전송">
</form>

<form method="post" action="method3" class="mb-2 d-inline-block">
	<input class="btn btn-success" type="submit" value="POST 전송">
</form>

<!-- <form method="put" action="method3">
	<input class="btn btn-success" type="submit" value="PUT 전송">
</form>

<form method="delete" action="method3">
	<input class="btn btn-success" type="submit" value="DELETE 전송">
</form> -->

<hr/>

<h6>&lt;ajax 이용&gt;</h6>
<button class="btn btn-info" onclick="sendGet()">AJAX GET 방식 요청</button>
<script>
const sendGet= () => {
	$.ajax({url:"method3", method:"get"})
		.then(response => {
			console.log("success");
		});
};
</script>

<button class="btn btn-info" onclick="sendPost()">AJAX POST 방식 요청</button>
<script>
const sendPost= () => {
	$.ajax({url:"method3", method:"post"})
		.then(response => {
			console.log("success");
		});
};
</script>

<button class="btn btn-info" onclick="sendPut()">AJAX PUT 방식 요청</button>
<script>
const sendPut= () => {
	$.ajax({url:"method3", method:"put"})
		.then(response => {
			console.log("success");
		});
};
</script>

<button class="btn btn-info" onclick="sendDelete()">AJAX DELETE 방식 요청</button>
<script>
const sendDelete= () => {
	$.ajax({url:"method3", method:"delete"})
		.then(response => {
			console.log("success");
		});
};
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
