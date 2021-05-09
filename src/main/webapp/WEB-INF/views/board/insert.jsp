<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">게시글 등록</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">게시글 등록</h6>
		</div>
		<div class="card-body">
			<form role="form" id="insertForm" action="/board/insert"
				method="post">
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="title">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name="content"></textarea>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="writer">
				</div>
				<a href="#" onclick="history.back()"
					class="btn btn-light btn-icon-split"> <span
					class="icon text-gray-600"> <i class="fas fa-arrow-right"></i>
				</span> <span class="text">취소</span></a> 
				<a href="javascript:;" onclick="document.getElementById('insertForm').submit()"
					class="btn btn-light btn-icon-split"> <span
					class="icon text-gray-600"> <i class="fas fa-arrow-right"></i>
				</span> <span class="text">등록</span>
				</a>
			</form>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<%@include file="../includes/footer.jsp"%>