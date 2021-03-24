<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div>
	<div class="alert alert-success"> 
		게시물 수정
	</div>
	
	
	<form onsubmit="update(${board.bno})">
		<input type="hidden" name="bno" value="${board.bno}"/>
	  <div class="form-group">
	    <label for="btitle">제목</label>
	    <input type="text" class="form-control" name="btitle" id="btitle" value="${board.btitle}">
	  </div>
	  <div class="form-group">
	    <label for="bcontent">내용</label>
	    <input type="text" class="form-control" name="bcontent" id="bcontent" value="${board.bcontent}">
	  </div>
	  <button type="submit" class="btn btn-primary">수정</button>
	  <button class="btn btn-primary" onclick="read(${board.bno})">취소</button>
	</form>
</div>
