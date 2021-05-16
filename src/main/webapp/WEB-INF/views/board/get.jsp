<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<style>
 form{display:inline}
</style>

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
				<div class="panel-heading">게시판</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
			<form role="form" action="/board/remove" method="post">
			<div class="form-group">
				<label>제목</label> <input class="form-control" name="bno"
					value='<c:out value="${board.bno}"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>제목</label> <input class="form-control" name="title"
					value='<c:out value="${board.title}"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="3" name="content" 
				readonly="readonly"><c:out value="${board.content}" /></textarea>
			</div>
			<div class="form-group">
				<label>작성자</label> <input class="form-control" name="writer"
					value='<c:out value="${board.writer}"/>' readonly="readonly">
			</div>
			<div class="form-group">
				<label>ip</label> <input class="form-control" name="ipAddress"
					value='<c:out value="${board.ipAddress}"/>' readonly="readonly">
			</div>
			<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
			</form>
			<button id="modify" data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">수정</button>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>