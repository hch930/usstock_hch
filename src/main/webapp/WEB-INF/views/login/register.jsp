<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link rel="stylesheet" href="/resources/css/register.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원가입</title>
</head>

<body>
	<!-- header -->
	<div id="header">
		<img src="/resources/img/logo.png" id="logo"></a>
	</div>
	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">
			<form action="/login/register" method="post">
				<!-- ID -->
				<div>
					<h3 class="join_title">
						<label for="userId">아이디</label>
					</h3>
					<span class="box int_id"> <input type="text" id="userid"
						name="userid" class="int" maxlength="20">	
					</span>
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>	
					<span class="final_id_ck">아이디를 입력해주세요.</span>
				</div>
				<!-- PW1 -->
				<div>
					<h3 class="join_title">
						<label for="userpw">비밀번호</label>
					</h3>
					<span class="box int_pass"> <input type="password"
						id="userpw" class="int" maxlength="20">
						<img src="/resources/img/lock.png"
						id="pswd1_img1" class="pswdImg">
					</span> <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
				</div>
				<!-- PW2 -->
				<div>
					<h3 class="join_title">
						<label for="userRepw">비밀번호 확인</label>
					</h3>
					<span class="box int_pass_check"> <input type="password"
						id="userRepw" class="int" maxlength="20"> <img
						src="/resources/img/lock.png" id="pswd2_img1" class="pswdImg">
					</span> <span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
				<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				</div>
				<!-- NAME -->
				<div>
					<h3 class="join_title">
						<label for="userName">이름</label>
					</h3>
					<span class="box int_name"> <input type="text" id="userName"
						class="int" maxlength="20">
					</span> <span class="final_name_ck">이름을 입력해주세요.</span>
				</div>
				<div class="btn_area">
					<button type="submit" id="btnJoin">
						<span>가입하기</span>
					</button>
					<button type="button" id="btnCancel">
						<span>취소</span>
					</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->
</body>
<script type="text/javascript">
	var idCheck = false; // 아이디
	var idckCheck = false; // 아이디 중복 검사
	var pwCheck = false; // 비번
	var pwckCheck = false; // 비번 확인
	var pwckcorCheck = false; // 비번 확인 일치 확인
	var nameCheck = false; // 이름

	$(document).ready(function() {
		// 취소
		$("#btnCancel").on("click", function() {
			location.href = "javascript:history.back()";
		})

		$("#btnJoin").on("click", function() {
			/* 입력값 변수 */
			var id = $('#userid').val(); // id 입력란
			var pw = $('#userpw').val(); // 비밀번호 입력란
			var pwck = $('#userRepw').val(); // 비밀번호 확인 입력란
			var name = $('#userName').val(); // 이름 입력란
			
			/* 아이디 유효성검사 */
			if(id == ""){
				$('.final_id_ck').css('display','block');
				$("#userid").focus();
				idCheck = false;
			}else{
				$('.final_id_ck').css('display', 'none');
				idCheck = true;
			}
			
			/* 비밀번호 유효성 검사 */
			if(pw == ""){
				$('.final_pw_ck').css('display','block');
				$("#userpw").focus();
				pwCheck = false;
			}else{
				$('.final_pw_ck').css('display', 'none');
				pwCheck = true;
			}
			
			/* 비밀번호 확인 유효성 검사 */
			if(pwck == ""){
				$('.final_pwck_ck').css('display','block');
				pwckCheck = false;
			}else{
				$('.final_pwck_ck').css('display', 'none');
				pwckCheck = true;
			}
			
			/* 이름 유효성 검사 */
			if(name == ""){
				$('.final_name_ck').css('display','block');
				$("#userName").focus();
				nameCheck = false;
			}else{
				$('.final_name_ck').css('display', 'none');
				nameCheck = true;
			}	
			
			if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck){
				$("#btnJoin").submit();			
			}		
			return false;
		});
	})
	
	//아이디 중복검사
$('#userid').on("propertychange change keyup paste input", function(){
	/* console.log("keyup 테스트"); */
	
	var userid = $('#userid').val();			// #userid에 입력되는 값
	var data = {userid : userid}				// '컨트롤에 넘길 데이터 이름' : '데이터(#userid에 입력되는 값)'
	
	$.ajax({
		type : "post",
		url : "/login/userIdChk",
		data : data,
		success : function(result){
			// console.log("성공 여부" + result);
			if(result != 'fail'){
				$('.id_input_re_1').css("display","inline-block");
				$('.id_input_re_2').css("display", "none");	
				idckCheck = true;
			} else {
				$('.id_input_re_2').css("display","inline-block");
				$('.id_input_re_1').css("display", "none");
				idckCheck = false;
			}	
		}// success 종료
	}); // ajax 종료	
});// function 종료

/* 비밀번호 확인 일치 유효성 검사 */
$('#userRepw').on("propertychange change keyup paste input", function(){
	
	var pw = $('#userpw').val(); // 비밀번호 입력란
	var pwck = $('#userRepw').val(); // 비밀번호 확인 입력란
	$('.final_pwck_ck').css('display', 'none');
	
	if(pw == pwck){
		$('.pwck_input_re_1').css('display','block');
		$('.pwck_input_re_2').css('display','none');
		pwckcorCheck = true;
	}else{
		$('.pwck_input_re_1').css('display','none');
		$('.pwck_input_re_2').css('display','block');
		pwckcorCheck = false;
	}
});
</script>
</html>