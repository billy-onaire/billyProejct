<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>회원가입</title>

<script type="text/javascript" src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
<script type="text/javascript"></script>

<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: white;
}

* {
	box-sizing: border-box;
}

/* Add padding to containers */
.container {
	padding: 10px;
	/* background-color: white; */
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Overwrite default styles of hr */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.registerbtn:hover {
	opacity: 1;
}

/* Add a blue text color to links */
a {
	color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
	background-color: #f1f1f1;
	text-align: center;
}

#pp {
	margin-top: -15px;
	margin-left: 10px;
}
</style>
</head>

<body>

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">
		<c:import url="../common/nav.jsp" />
		<!-- 회원가입 폼 -->
		<div class="login-enroll-form clearfix">
		<div class="container">
		<form action="#">
				<h1>회원가입</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>

				<label for="email"><b>아이디</b></label> <input type="text"
					placeholder="Enter ID" name="user_id" required> <label
					for="email"><b>비밀번호</b></label> <input type="text"
					placeholder="Enter Password" name="user_pwd" required> <label
					for="psw-repeat"><b>비밀번호 재입력</b></label> <input type="password"
					placeholder="Repeat Password" name="psw-repeat" required> <label
					for="email"><b>핸드폰 번호</b></label> <input type="text"
					placeholder="Enter Phone" name="phone" required> <label
					for="email"><b>이메일 인증</b></label> <input type="text"
					placeholder="Enter Email" name="email" required>
				<p id="pp" style="color: orange">E-mail로 발송된 내용을 확인한 후 인증하셔야
					회원가입이 완료됩니다.</p>

				<label for="email"><b>인증 번호</b></label> <input type="text"
					placeholder="Enter verification number" name="certifi" required>

				<label for="email"><b>주소</b></label> <input type="text"
					placeholder="Enter Phone" name="address" required> <label
					for="email"><b>주거래가능 지역</b></label> <input type="text"
					placeholder="Enter Possible Transaction Area" name="location_area"
					required> <label for="email"><b>본인소개</b></label>
				<textarea style="background-color: #f1f1f1" class="form-control"
					rows="5" id="comment" placeholder="500자 이내로 작성하세요."></textarea>

				<hr>
				<p>
					By creating an account you agree to our <a href="#">Terms &
						Privacy</a>.
				</p>

				<button type="submit" class="registerbtn"
					style="background-color: orange">등록하기</button>
		</form>
		</div>
		</div>
	</div>

	<c:import url="../common/footer.jsp" />
	
	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
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