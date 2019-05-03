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
<script type="text/javascript">
function validate() {
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일이 적합한지 검사할 정규식

    var id = document.getElementById("user_id");
    var pw = document.getElementById("user_pwd");
    var email = document.getElementById("email");

    // ------------ 이메일 까지 -----------

    if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(join.user_pwd.value != join.pwd_chk.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        join.checkpw.value = "";
        join.checkpw.focus();
        return false;
    }

    if(email.value=="") {
        alert("이메일을 입력해 주세요");
        email.focus();
        return false;
    }

    if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

    if(join.comment.value=="") {
        alert("본인소개를 적어주세요");
        join.self.focus();
        return false;
    }
    
    alert("회원가입이 완료되었습니다.");
}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}

</script>

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
		<form action="minsert.do" name = "join" onsubmit="return validate();" method="post" enctype="text/plain">
				<h1>회원가입</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>

					<label for="user_id"><b>아이디</b></label> 
					<input type="text"placeholder="Enter ID" name="user_id" required> 
					<label for="user_name"><b>이름</b></label> 
					<input type="text"placeholder="Enter Name" name="user_name" required> 
					<label for="user_pwd"><b>비밀번호</b></label> 
					<input type="text" placeholder="Enter Password" id="user_pwd" name="user_pwd" required> 
					<label for="pwd_chk"><b>비밀번호 재입력</b></label> 
					<input type="password" placeholder="Repeat Password" id="pwd_chk" name="pwd_chk" required> 
					<label for="phone"><b>핸드폰 번호</b></label> 
					<input type="text" placeholder="Enter Phone" name="phone" required> 
					<label for="email"><b>이메일 인증</b></label> 
					<input type="text" placeholder="Enter Email" name="email" required>
					<p id="pp" style="color: orange">E-mail로 발송된 내용을 확인한 후 인증하셔야 회원가입이 완료됩니다.</p>

				<label for="verify"><b>인증 번호</b></label> <input type="text"
					placeholder="Enter verification number" name="certifi" required>

				<label for="address"><b>주소</b></label> 
				<input type="text" placeholder="Enter Phone" name="address" required> 
				<label for="LOCATION_AREA"><b>주거래가능 지역</b></label> 
				<input type="text" placeholder="Enter Possible Transaction Area" name="location_area" required> 
				<label for="MY_INTRODUCE"><b>본인소개</b></label>
				<textarea style="background-color: #f1f1f1" class="form-control"
					rows="5" name="comment" id="comment" placeholder="500자 이내로 작성하세요."></textarea>

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