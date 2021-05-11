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
			<a href="#" onclick="location.href='/board/modify?bno=<c:out value="{board.bno}"/>'"
				class="btn btn-light btn-icon-split"> <span
				class="icon text-gray-600"> <i class="fas fa-arrow-right"></i>
			</span> <span class="text">수정</span></a> 
			<a href="#" onclick="location.href='/board/delete?bno=<c:out value="{board.bno}"/>'"
				class="btn btn-light btn-icon-split"> <span
				class="icon text-gray-600"> <i class="fas fa-arrow-right"></i>
			</span> <span class="text">삭제</span>
			</a>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>