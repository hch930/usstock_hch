<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<link type="text/css" rel="stylesheet" href="/resources/css/list.css" />
<!-- Begin Page Content -->

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">게시판</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">게시판 
				<button name='regBtn' class="writingImgButton pull-right"></button></div>
				<!-- /.panel-heading -->
				<div class="panel-body">	
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>ip주소</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
							<c:set var="today" value="<%=new java.util.Date()%>"/>
							<fmt:formatDate var="now" type="date" value="${today}" pattern="yyyy-MM-dd"/>
							<fmt:formatDate var="regDate" pattern="yyyy-MM-dd" value="${board.regdate}" />
								<tr>
									<td><c:out value="${board.bno}" /></td>
									<td><a class="move" href='<c:out value="${board.bno}"/>'>
											<c:out value="${board.title}" /> <b>[<c:out value="${board.replyCnt}"/>]</b>
									</a></td>
									<td><c:out value="${board.writer}" /></td>
									<td>
									<c:choose> 
										<c:when test="${now gt regDate}">
											<fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" />
										</c:when>
										<c:otherwise>
											<fmt:formatDate pattern="HH:mm:ss" value="${board.regdate}" />
										</c:otherwise>
									</c:choose>
									</td>
									<td><c:out value="${board.ipAddress}" /></td>
									<td><c:out value="${board.hit}"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
						<div class="col-lg-12">
						<button name='regBtn' class="writingButton pull-right">글쓰기</button>
						<form id="searchForm" action="/board/list" method="get">
							<select name="type">
								<option value="TC"<c:out value="${pageInfo.cri.type eq 'TC'?'selected':''}"/>>제목 + 내용</option>
								<option value="T"<c:out value="${pageInfo.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"<c:out value="${pageInfo.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"<c:out value="${pageInfo.cri.type eq 'W'?'selected':''}"/>>작성자</option>
							</select>
							<input type='text' id="tKeyword" name='keyword' value='<c:out value="${pageInfo.cri.keyword}"/>'/>
							<input type="hidden" name="pageNum" value='<c:out value="${pageInfo.cri.pageNum}"/>'/>
							<input type="hidden" name="amount" value='<c:out value="${pageInfo.cri.amount}"/>'/>
							<button class="selectButton"></button>
						</form>
						</div>
					</div>
					<div class='pull-right'>
						<ul class="pagination">
							<c:if test="${pageInfo.prev}">
								<li class="paginate_button previous"><a href="${pageInfo.startPage -1}">이전</a>
								</li>
							</c:if>
							<c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
								<li class='paginate_button ${pageInfo.cri.pageNum == num ? "active":""}'>
								<a href="${num}"><c:out value="${num}"/></a>
							</li>	
							</c:forEach>
							<c:if test="${pageInfo.next}">
								<li class="paginate_button next"><a href="${pageInfo.endPage +1}">다음</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageInfo.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageInfo.cri.amount}">
	<input type='hidden' name='type' value='<c:out value="${pageInfo.cri.type}"/>'/>
	<input type='hidden' name='keyword' value='<c:out value="${pageInfo.cri.keyword}"/>'/>
</form>

<!-- 새로고침을 통한 도배 방지 -->
<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		
		history.replaceState({},null,null);
		
		$("button[name=regBtn]").on("click", function() {
			self.location = "/board/insert";
		});
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			if(!searchForm.find("input[name='keyword']").val()){
				alert("검색내용을 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit(); 
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>