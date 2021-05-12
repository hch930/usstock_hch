<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">게시글</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">게시글</h6>
		</div>
		<div class="card-body">
		<form role="form" action="/board/modify" method="post">
			<div class="form-group">
				<label>제목</label> <input class="form-control" name="bno"
					value='<c:out value="${board.bno}"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>제목</label> <input class="form-control" name="title"
					value='<c:out value="${board.title}"/>'>
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name="content"><c:out value="${board.content}" /></textarea>
			</div>
			<div class="form-group">
				<label>작성자</label> <input class="form-control" name="writer"
					value='<c:out value="${board.writer}"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>ip</label> <input class="form-control" name="ipAddress"
					value='<c:out value="${board.ipAddress}"/>' readonly="readonly">
			</div>
			<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
			<button type="submit" data-oper='list' class="btn btn-info">리스트</button>
		</form>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>