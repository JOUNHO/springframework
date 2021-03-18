<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%-- 메뉴 내용 부분 --%>
method01.jsp
<hr/>
<form method="get" action="method1">
	<div class="form-group">
		<label for="name">이름</label>
		<input id="name" name="name" class="form-control" type="text">
	</div>
	<input class="btn btn-success" type="submit" value="전송">
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
