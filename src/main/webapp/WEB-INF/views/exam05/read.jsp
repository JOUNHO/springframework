<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div>
	<div class="alert alert-success"> 
		게시물 내용
	</div>
	  <div class="form-group">
	    <label>글 번호</label>
	    <input type="text" class="form-control" value="${board.bno}" readonly >
	  </div>
	
	  <div class="form-group">
	    <labe>제목</label>
	    <input type="text" class="form-control" value="${board.btitle}" readonly >
	  </div>
	  <div class="form-group">
	    <label>내용</label>
	    <input type="text" class="form-control" value="${board.bcontent}" readonly>
	  </div>
	  <div class="form-group">
	    <label>글쓴이</label>
	    <input type="text" class="form-control" value="${board.bwriter}" readonly>
	  </div>
	  <div class="form-group">
	    <label>날짜</label>
	    <input type="text" class="form-control" value='<fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd"/>' readonly>
	  </div>
	  <div class="form-group">
	    <label>조회수</label>
	    <input type="text" class="form-control" value="${board.bhitcount}" readonly>
	  </div>
	  
	  <div class="mb-3">
	  	  <label>첨부</label><br>
		  <c:if test="${board.battachoname != null}">
		  	<a href="downloadAttach?bno=${board.bno}">
		  		<img src="downloadAttach?bno=${board.bno}" width="200px" height="100px"/>
			</a>		 
		  </c:if>
	  </div>
	  
	  
	  <div>
	  	<button onclick="getList()" class="btn btn-primary btn-sm">목록</button>
	  	
	  	<c:if test="${loginUid==board.bwriter }">
	  		<button onclick="updateForm(${board.bno})" class="btn btn-danger btn-sm">수정</button>
	  		<button onclick="deleteBoard(${board.bno})" class="btn btn-primary btn-sm">삭제</button>
	  	</c:if>
	  

	  </div>
	  
</div>