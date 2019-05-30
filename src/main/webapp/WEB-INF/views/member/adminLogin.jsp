<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Billy - 관리자로그인</title>
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("adminId").focus();
} 

function adminCheck(){
	var adminPwd = document.getElementById("adminPwd").value;
	var regId = /^[A-Za-z0-9+]{4,12}$/;
	if(regId.test(document.getElementById("adminId").value)){
		if(adminPwd.length >=4 && adminPwd.length <= 12){
			return true;
		}else{
			alert("비밀번호는 4~12자리입니다.");
			document.getElementById("adminPwd").focus();
			return false;
		}
	}else{
		alert("아이디가 조건에 맞지 않습니다.(영문,숫자 조합 4~12글자)");
		document.getElementById("adminId").focus();
		return false;
	}

}

</script>
<style type="text/css">
	body {
		/* background-image: url("${ pageContext.request.contextPath }/resources/img/core-img/adminLogin.jpg" ); */
		background-color: #F2F2F2;
		font-family: 'Roboto', sans-serif;
	}
    .form-control {
		font-size: 16px;
	}
    .form-control:focus {
        border-color: #FF9F00;
    }
    .form-control, .btn {
        border-radius: 50px;
		outline: none !important;
    }
	.login-form {
		width: 400px;
    	margin: 0 auto;
		padding: 30px 0;
	}
    .login-form form {
		border-radius: 5px;
        margin-top: 10px; 
    	margin-bottom: 20px;
        background: #fff;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 40px 50px;
    }
    .login-form .btn {        
        font-size: 18px;
		line-height: 26px;
        font-weight: bold;
		text-align: center;
		border: none;
		background: #FF9F00;
    }
 
    .login-form a {
		color: #FF9F00;
	}
</style>
</head>
<body>
<div class="login-form text-center">
	<img src="${ pageContext.request.contextPath }/resources/img/core-img/loginAdmin1.png" id="logoimg" width="300" height="200">
    <form action="adminLogin.do" method="post" onSubmit="return adminCheck();">		
        <div class="form-group">
        	<input type="text" class="form-control input-lg" id="adminId" name="admin_id" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control input-lg" id="adminPwd" name="admin_pwd" required="required">
        </div>        
        <div class="form-group">
            <input type="submit" class="btn btn-success btn-lg btn-block login-btn" value="로그인">
        </div>
    </form>
</div>
</body>
</html>