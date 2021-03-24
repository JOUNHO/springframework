<%-- page 지시자 --%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%-- taglib 지시자 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="card"> 
	<div class="card-header">
	게시물 목록
	</div>
	
	<div class="card-body">
		<table class="table">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>글쓴이</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		
			<c:forEach var="board" items="${list}">
			<tr>
				<td>${board.bno}</td>
				<td><a href="javascript: read(${board.bno})">${board.btitle}</a></td>
				<td>${board.bcontent}</td>
				<td>${board.bwriter}</td>
				<td><fmt:formatDate value="${board.bdate}" pattern="yyyy-MM-dd" /></td>
				<td>${board.bhitcount}</td>
				
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5" class="text-center">
			<div class="d-flex justify-content-between">
				<div>
					<!-- [처음][이전] 6 7 8 9 10 [다음][맨끝] -->
					<button class="btn btn-outline-primary btn-sm" onclick="getList(1)">[처음]</button>
					<c:if test="${pager.groupNo>1}">
						<button class="btn btn-outline-primary btn-sm" onclick="getList(${pager.startPageNo-1})">[이전]</button>
					</c:if>
					
					
					
					<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
						<c:if test="${pager.pageNo!=i}"><button class="btn btn-outline-success btn-sm" onclick="getList(${i})">${i}</button></c:if>
	
						<c:if test="${pager.pageNo==i}"><button class="btn btn-danger btn-sm" onclick="getList(${i})">${i}</button></c:if>
					</c:forEach>
					
					<c:if test="${pager.groupNo<pager.totalGroupNo}">
						<button class="btn btn-outline-primary btn-sm" onclick="getList(${pager.endPageNo+1})">[다음]</button>
					</c:if>
						<button class="btn btn-outline-primary btn-sm" onclick="getList(${pager.totalPageNo})">[맨끝]</button>
				</div>
				<button class="btn btn-success btn-sm" onclick="creaetForm()">글쓰기</button>
			</div>
			</td>
		</tr>
		
		</table>
	</div>
</div>







