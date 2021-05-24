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
			
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
			<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'/>
			<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'/>
			</form>
			<button data-oper='modify' class="btn btn-default">수정</button>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> 댓글
					<button id='addReplyBtn' class='bt nbtn-primary btn-xs pull-right'>댓글 작성</button>
				</div>
				
				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix" data-rno='12'>
							<div>
								<div class="header">
									<strong class="primary-font">user00</strong>
									<small class="pull-right text-muted">2021-05-24 10:32</small>
								</div>
								<p>Good job!</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
</div>

<form id="operForm" action="/board/modify" method="get">
	<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'>
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'/>
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'/>
</form>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">댓글 작성</h4>
			</div>
			<div class="modal-body">
				<div class = "form-group">
					<label>댓글</label>
					<input class="form-control" name="reply" value="새로운 댓글">
				</div>
				<div class = "form-group">
					<label>댓글 작성자</label>
					<input class="form-control" name="replyer" value="댓글 작성자">
				</div>
				<div class = "form-group">
					<label>댓글 작성일</label>
					<input class="form-control" name="replyDate" value="댓글 작성일">
				</div>
				<div class = "form-group">
					<label>ip</label>
					<input class="form-control" name="replyipAddress" value="ip">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
				<button id="modalInsertBtn" type="button" class="btn btn-default">등록</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<!-- 댓글 목록 이벤트 -->
<script>
$(document).ready(function(){
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");

	showList(1);

	function showList(page){
		replyService.getList({bno:bnoValue,page: page|| 1}, function(list){
			var str = "";
			if(list == null || list.length == 0){
				replyUL.html("");
				
				return;
			}
			for(var i = 0, len = list.length || 0; i < len; i++){
				str +="<li clas='left clearfix' data-rno='"+list[i].rno+"'>";
				str +="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
				str +="<small class='pull-right text muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
				str +="<small class='pull-right text muted'>"+list[i].ipAddress+"</small>";
				str +="<p>" + list[i].reply+"</p></div></li>";
			}
			replyUL.html(str);
		});
	}
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	var modalInputIpAddress = modal.find("input[name='replyipAddress']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalInsertBtn = $("#modalInsertBtn");
	
	$("#addReplyBtn").on("click", function(e){
		var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno: bnoValue
		};
		modalInputReplyDate.closest("div").hide();
		modalInputIpAddress.closest("div").hide();
		modalInputReplyer.val(reply.replyer).attr("readonly", false);
		modal.find("input").val("");
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalInsertBtn.show();
		
		$(".modal").modal("show");
	});
	
	//댓글 등록
	modalInsertBtn.on("click",function(e){
		var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno: bnoValue
		};
		replyService.add(reply, function(result){
			alert(result);
			modal.find("input").val("");
			modal.modal("hide");
			showList(1);
		});
	})
	
	//댓글 수정
	modalModBtn.on("click", function(e){
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(1);
		});
	});
	
	modalRemoveBtn.on("click", function(e){
		var rno = modal.data("rno");
		
		replyService.remove(rno, function(result){
			alert(result);
			modal.modal("hide");
			showList(1);
		});
	});
	
	//댓글 클릭시 모달 창
	$(".chat").on("click", "li", function(e){
		modalInputReplyDate.closest("div").show();
		modalInputIpAddress.closest("div").show();
		var rno = $(this).data("rno");
		replyService.get(rno, function(reply){
		modalInputReply.val(reply.reply);
		modalInputReplyer.val(reply.replyer).attr("readonly", true);
		modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
		modal.data("rno", reply.rno);
		modalInputIpAddress.val(reply.ipAddress).attr("readonly","readonly");
		
		modal.find("button[id !='modalCloseBtn']").hide();
		modalModBtn.show();
		modalRemoveBtn.show();
		
		$(".modal").modal("show");
		});
	});
	
	
});
</script>

<script type="text/javascript">
console.log("=========");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.bno}"/>';

replyService.getList({bno:bnoValue, page:1}, function(list){
	for(var i = 0, len = list.length||0; i < len; i++){
		console.log(list[i]);
	}
});
/*
replyService.add(
		{reply:"JS TEST", replyer:"tester", bno:bnoValue}
		,
		function(result){
			alert("RESULT: " + result);
		}
);

replyService.remove(40, function(count){
	console.log(count);
	
	if(count == "success"){
		alert("REMOVED");
	}
},function(err){
	alert("ERROR....");
});

replyService.update({
	rno : 22,
	bno : bnoValue,
	reply : "modified Reply..."
}, function(result){
	alert("수정 완료...");
});
*/
replyService.get(20, function(data){
	console.log(data);
});
</script>

<script type="text/javascript">
$(document).ready(function(e){
	var operForm = $("#operForm");
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/board/modify").submit();
	});
	
	var formObj = $("form");
	
	$("button[data-oper='remove']").on("click", function(e){
		
		formObj.submit();
	});
});
</script>

<%@include file="../includes/footer.jsp"%>