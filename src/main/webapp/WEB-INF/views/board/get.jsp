<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../includes/header.jsp"%>
<link type="text/css" rel="stylesheet" href="/resources/css/boardStyle.css" />

<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>

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
				<form style="display: inline" role="form" action="/board/remove" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token }" />
					<div class="form-group">
						<label>번호</label> <input class="form-control" name="bno"
							value='<c:out value="${board.bno}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name="title"
							value='<c:out value="${board.title}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>내용</label>
						<pre><c:out value="${board.content}" escapeXml="false"/></pre>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>ip</label> <input class="form-control" name="ipAddress"
							value='<c:out value="${board.ipAddress}"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>조회수</label> <input class="form-control" name="hit"
							value='<c:out value="${board.hit}"/>' readonly="readonly">
					</div>
					<input type="hidden" name="pageNum"
						value='<c:out value="${cri.pageNum}"/>'> <input
						type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='type'
						value='<c:out value="${cri.type}"/>' /> <input type='hidden'
						name='keyword' value='<c:out value="${cri.keyword}"/>' />

					<sec:authentication property="principal" var="pinfo" />
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq board.writer}">
							<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
						</c:if>
					</sec:authorize>
				</form>
				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq board.writer}">
						<button data-oper='modify' class="btn btn-default">수정</button>
					</c:if>
				</sec:authorize>
				<button data-oper='list' class="btn btn-default">리스트</button>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="img-div">
			<c:choose>
				<c:when test="${likes ==0}">
					<button class="likeBtn"></button>
					<input type="hidden" id="likecheck" value="${likes}">
					<span id="likecount">${likes}</span>
				</c:when>
				<c:when test="${likes ==1}">
					<button class="likeBtn"></button>
					<input type="hidden" id="likecheck" value="${likes}">
					<span id="likecount">${likes}</span>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${dislike ==0}">
					<button class="dislikeBtn"></button>
					<input type="hidden" id="dislikecheck" value="${dislike}">
					<span id="dislikecount">${dislike}</span>
				</c:when>
				<c:when test="${dislike ==1}">
					<button class="dislikeBtn"></button>
					<input type="hidden" id="dislikecheck" value="${dislike}">
					<span id="dislikecount">${dislike}</span>
				</c:when>
			</c:choose>
			<input type="hidden" id="userid" name="userid" value='<c:out value="${member}"/>'> 
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">파일</div>
			<div class="panel-body">
				<div class="uploadResult">
					<ul>

					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> 댓글
				<sec:authorize access="isAuthenticated()">
					<button id='addReplyBtn' class='bt nbtn-primary btn-xs pull-right'>댓글
						작성</button>
				</sec:authorize>
			</div>

			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno='12'>
						<div>
							<div class="header">
								<strong class="primary-font">user</strong> <small
									class="pull-right text-muted">2021-07-09 10:32</small>
							</div>
							<p>안녕하세요</p>
						</div>
					</li>
				</ul>
			</div>
			<div class="panel-footer"></div>
		</div>
	</div>
</div>

<form id="operForm" action="/board/modify" method="get">
	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'> 
	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' name='type' value='<c:out value="${cri.type}"/>' />
	<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>' />
	<input type="hidden" id="bno" name="bno" value='<c:out value="${board.bno}"/>'> 
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
				<div class="form-group">
					<label>댓글</label> <input class="form-control" name="reply"
						value="새로운 댓글">
				</div>
				<div class="form-group">
					<label>댓글 작성자</label> <input class="form-control" name="replyer"
						value="댓글 작성자">
				</div>
				<div class="form-group">
					<label>댓글 작성일</label> <input class="form-control" name="replyDate"
						value="댓글 작성일">
				</div>
				<div class="form-group">
					<label>ip</label> <input class="form-control" name="replyipAddress"
						value="ip">
				</div>
			</div>
			<div class="modal-footer">
				<button id="modalModBtn" type="button" class="btn btn-warning">수정</button>
				<button id="modalRemoveBtn" type="button" class="btn btn-danger">삭제</button>
				<button id="modalInsertBtn" type="button" class="btn btn-default">등록</button>
				<button id="modalCloseBtn" type="button" class="btn btn-default"
					data-dismiss="modal">닫기</button>
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
		replyService.getList({bno:bnoValue,page: page|| 1}, function(replyCnt, list){
			
			console.log("replyCnt: " + replyCnt);
			console.log("list: " + list);
			console.log(list);
			
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
			if(list == null || list.length == 0){
				replyUL.html("");
				
				return;
			}
			for(var i = 0, len = list.length || 0; i < len; i++){
				str +="<li clas='left clearfix' data-rno='"+list[i].rno+"'>";
				str +="<div><div class='header'><strong class='primary-font'>["+list[i].rno+"]"+list[i].replyer+"</strong>";
				str +="<small class='pull-right text muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
				str +="<small class='pull-right text muted'>"+list[i].ipAddress+"</small>";
				str +="<p>" + list[i].reply+"</p></div></li>";
			}
			replyUL.html(str);
			showReplyPage(replyCnt);
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
	
	var replyer = null;
	
	<sec:authorize access = "isAuthenticated()">
	replyer = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	

	
$("#addReplyBtn").on("click", function(e){
		
		modal.find("input").val("");
		modal.find("input[name='replyer']").val(replyer).attr("readonly","readonly");
		modalInputReplyDate.closest("div").hide();
		modalInputIpAddress.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalInsertBtn.show();
		
		$(".modal").modal("show");
	});
	
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
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
			showList(-1);
		});
	})
	
	//댓글 수정
	modalModBtn.on("click", function(e){
		var originalReplyer = modalInputReplyer.val();
		
		var reply = {rno:modal.data("rno"), reply: modalInputReply.val(), replyer: originalReplyer};
		
		if(!replyer){
			alert("로그인후 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		if(replyer != originalReplyer){
			alert("자신이 작성한 댓글만 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	//댓글 삭제
	modalRemoveBtn.on("click", function(e){
		var rno = modal.data("rno");
		
		if(!replyer){
			alert("로그인후 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		var originalReplyer = modalInputReplyer.val();
		
		if(replyer != originalReplyer){
			alert("자신이 작성한 댓글만 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
		
		replyService.remove(rno, originalReplyer, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
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
	
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	function showReplyPage(replyCnt) {
		var endNum = Math.ceil(pageNum / 10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if(endNum * 10 < replyCnt) {
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		if(prev) {
			str += "<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>이전</a></li>";
		}
		
		for(var i=startNum ; i<=endNum; i++){
			var active = pageNum == i? "active":"";
			str+="<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next) {
			str+= "<li class='page-item'><a class='page-link' href='"+(endNum+1) + "'>다음</a></li>";
		}

		str += "</ul></div>";
		console.log(str);
		
		replyPageFooter.html(str);
	}	
	
	replyPageFooter.on("click", "li a", function(e) {
		e.preventDefault();
		console.log("page click");
		var targetPageNum = $(this).attr("href");
		console.log("targetPageNum : " + targetPageNum);
		pageNum = targetPageNum;
		showList(pageNum);
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
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list")
		operForm.submit();
	});
	
	(function(){
		
		var bno = '<c:out value="${board.bno}"/>';
		
		$.getJSON("/board/getAttachList", {bno : bno}, function(arr){
			console.log(arr);
			var str = " ";
			$(arr).each(function(i, attach){
				
				//img type
				if(attach.fileType){
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					
					str += "<li data-path = '" + attach.uploadPath + "' data-uuid = '" + attach.uuid + "'data-filename = '"
					+ attach.fileName + "' data-type = '" + attach.fileType+"' ><div>";
					str += "<img src='/display?fileName=" + fileCallPath + "'>";
					str += "</div>";
					str += "</li>";
				}else {
					str += "<li data-path = '" + attach.uploadPath + "' data-uuid = '" + attach.uuid + "' data-filename = '"
					+ attach.fileName + "'data-type'" + attach.fileType + "'><div>";
					str += "<span>" + attach.fileName + "</span><br />";
					str += "<img src = '/resources/img/attach.png'>";
					str += "</div>";
					str += "</li>";
				}
			});
			
			$(".uploadResult ul").html(str);
		});
	})();
});

$(".uploadResult").on("click","li", function(e){
    
    console.log("view image");
    
    var liObj = $(this);
    
    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
    
    if(liObj.data("type")){
      showImage(path.replace(new RegExp(/\\/g),"/"));
    }else {
      //download 
      self.location ="/download?fileName="+path
    }
    
    
  });
  
  function showImage(fileCallPath){
    $(".bigPictureWrapper").css("display","flex").show();
    
    $(".bigPicture")
    .html("<img src='/display?fileName="+fileCallPath+"' >")
    .animate({width:'100%', height: '100%'}, 1000);
    
  }

  $(".bigPictureWrapper").on("click", function(e){
    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
    setTimeout(function(){
      $('.bigPictureWrapper').hide();
    }, 1000);
  });
  
</script>

<script type="text/javascript">
$('.likeBtn').click(function(){
	likeupdate();
});

function likeupdate(){
	userid = $('#userid').val(),
	bno = $('#bno').val(),
	count = $('#likecheck').val(),
	data = {"userid" : userid,
			"bno" : bno,
			"count" : count};
	
$.ajax({
	url :"/like/likeupdate",
	type : 'POST',
	dataType: "json",
	contentType: 'application/json; charset=utf-8',
	data : JSON.stringify(data),
	success : function(result){
		console.log("성공" + result.result)
		console.log("수정" + result.like);
		if(count == 1){
			console.log("좋아요 취소");
			 $('#likecheck').val(0);
			 $('#likecount').html(result.like);
		}else if(count == 0){
			console.log("좋아요!");
			$('#likecheck').val(1);
			$('#likecount').html(result.like);
		}
	}, error : function(result){
		console.log("에러" + result.result)
	}
	
	});
};

$('.dislikeBtn').click(function(){
	dislikeupdate();
});

function dislikeupdate(){
	userid = $('#userid').val(),
	bno = $('#bno').val(),
	count = $('#dislikecheck').val(),
	data = {"userid" : userid,
			"bno" : bno,
			"count" : count};
	
$.ajax({
	url :"/like/dislikeupdate",
	type : 'POST',
	dataType: "json",
	contentType: 'application/json; charset=utf-8',
	data : JSON.stringify(data),
	success : function(result){
		console.log("싫어요 성공" + result.result)
		console.log("싫어요 수정" + result.dislike);
		if(count == 1){
			console.log("싫어요 취소");
			 $('#dislikecheck').val(0);
			 $('#dislikecount').html(result.dislike);
		}else if(count == 0){
			console.log("싫어요!");
			$('#dislikecheck').val(1);
			$('#dislikecount').html(result.dislike);
		}
	}, error : function(result){
		console.log("에러" + result.result)
	}
	
	});
};
</script>

<%@include file="../includes/footer.jsp"%>