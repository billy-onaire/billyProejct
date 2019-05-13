<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html lang="en">

<head>

<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">
<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
<meta charset="UTF-8">

<title>Billy - 비밀번호변경</title>
<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#changepwd").on("click", function(){
		var userPwd = $("#userPwd").val();
		var userPwd2 = $("#userPwd2").val();
		var userId = $("#userId").val();
		
		if(userPwd == null || userPwd == ""){
			alert("비밀번호를 입력해주세요.");
			$("#userPwd").focus();
			return false;
		}else if(userPwd2 == null || userPwd2 == ""){
			alert("위 비밀번호와 동일하게 입력해주세요.");
			$("#userPwd2").focus();
			return false;
		}
		console.log(userPwd+", " + userPwd2);
		if(userPwd != userPwd2){
			alert("비밀번호가 맞지않습니다.");
			$("#userPwd").focus();
			return false;
		}else{
			console.log("여기 들어와함");
			$.ajax({
				url: "changePwd.do",
				data: {
					user_id: userId,
					user_pwd: userPwd
				},
				type: "post",
				success: function(result){
					alert(decodeURIComponent(result.hashMap.message).replace(/\+/g, " "));
					if(decodeURIComponent(result.hashMap.message).replace(/\+/g, " ") == "비밀번호 변경성공"){
						self.close();
					}
				},error: function(request, status, errorData){
					console.log("error code : " + request.status
							+ "\nmessage : " + request.responseText
							+ "\nerror : " + errorData);
					}
				});
			}
		});
	});
</script>
</head>
<body>
<br>
<div class="container">
<div class="row">
	<div class="col-sm-6">
		<div class="form-group">
		<h2>비밀번호 변경</h2>
		</div>
		<!-- <form action="changePwd.do" method="post" onSubmit="return checkPwd();"> -->
			<input type="hidden" id="userId" name="user_id" value="${userId }">
			<div class="form-group">
				<label for="userPwd">비밀번호</label> <input type="password"
				class="form-control" id="userPwd" placeholder="Enter userpwd"
				name="user_pwd" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="form-group">
				<label for="userPwd">비밀번호확인</label> <input type="password"
				class="form-control" id="userPwd2"
				placeholder="Enter userpwd" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<br><br> <span id="changePwd"></span>
			<button type="submit" class="btn btn-warning btn-block"
			id="changepwd" style="color: white">변경하기</button>
		<!-- </form> -->
	</div>
	</div>
</div>
<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
	<!-- Popper js -->
	<script src="/billy/resources/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="/billy/resources/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="/billy/resources/js/plugins.js"></script>
	<!-- Active js -->
	<script src="/billy/resources/js/active.js"></script>
</body>
</html>