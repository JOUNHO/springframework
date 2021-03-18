<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--jsp에서 리다이렉트 방법 1 --%>
<%-- <%response.sendRedirect(application.getContextPath()+"/home");%> --%>

<%--방법 2 --%>
<c:redirect url="/home"></c:redirect>