<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div>
	<div class="alert alert-success"> 
		게시물 입력
	</div>
	
	
	<form method="post" action="create">
	  <div class="form-group">
	    <label for="btitle">제목</label>
	    <input type="text" class="form-control" name="btitle" id="btitle" >
	  </div>
	  <div class="form-group">
	    <label for="bcontent">내용</label>
	    <input type="text" class="form-control" name="bcontent" id="bcontent">
	  </div>
	  <button type="submit" class="btn btn-primary">저장</button>
	</form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>             