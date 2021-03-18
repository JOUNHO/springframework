<%-- page 지시자 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mycompany.webapp.dto.*" %>
<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>글쓴이</th>
	</tr>
	
	<c:forEach var="board" items="${list}">
		<tr>
			<td>${board.bno}</td>
			<td>${board.title}</td>
			<td>${board.content}</td>
			<td>${board.writer}</td>
		</tr>
	</c:forEach>
</table>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>








