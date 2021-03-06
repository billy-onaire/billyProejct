<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Billy - login</title>
<link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<style type="text/css">
	body {
		background: #aaaaaa;
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
    .social-btn .btn {
		color: #fff;
        margin: 10px 0;
		font-size: 18px;
		border-radius: 50px;
		text-indent: 10px;
		font-weight: normal;
		border: none;
		text-align: center;		
    }
	.social-btn .btn:hover {
		opacity: 0.9;
	}
    .social-btn .btn-primary {
		background: #507cc0;
	}
	.social-btn .btn-info {
		background: #03CF5D;
	}
	.social-btn .btn-danger {
		background: #df4930;
	}
    .social-btn .btn-four {
		background: #FFCD00;
	}
	.social-btn .btn i {
		margin-right: 9px;
		font-size: 20px;
		min-width: 25px;
		position: relative;
		top: 2px;
	}
	
    .or-seperator {
        margin: 50px 0 15px;
        text-align: center;
        border-top: 1px solid #e0e0e0;
    }
    .or-seperator b {
        padding: 0 10px;
		width: 40px;
		height: 40px;
		font-size: 16px;
		text-align: center;
		line-height: 40px;
		background: #fff;
		display: inline-block;
        border: 1px solid #e0e0e0;
		border-radius: 50%;
        position: relative;
        top: -22px;
        z-index: 1;
    }
    .login-form a {
		color: #FF9F00;
	}
</style>
</head>
<body>
<div class="login-form">
    <form action="loginCheck.do" method="post">		
        <div class="form-group">
        	<input type="text" class="form-control input-lg" name="user_id" placeholder="Username" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control input-lg" name="user_pwd" placeholder="Password" required="required">
        </div>        
        <div class="form-group">
            <input type="submit" class="btn btn-success btn-lg btn-block login-btn" value="로그인">
        </div>
        <div class="form-group">
            <button type="button" class="btn btn-success btn-lg btn-block login-btn"
            onclick="location.href='enroll.do'">회원가입</button>
        </div>
        <a href="#" onclick="window.open('mfind.do', 'findIdPwd', 'width=500, height=450, menubar=no, status=no, toolbar=no, left=700, top=200'); return false;">아이디/비밀번호찾기</a>
		<div class="or-seperator"><b>or</b></div>
        <div class="text-center social-btn">
            <!-- <a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=4iyl7WdA8WiEQF2arBLP&redirect_uri=http%3A%2F%2Flocalhost%3A8888%2Fbilly%2FnaverCheck.do&state=87675e2b-33fd-4d30-8b50-c1f209886c8e" class="btn btn-info btn-lg btn-block"><i class="fa fa-twitter"></i> Sign in with <b>Naver</b></a> -->
            <a href="${url }" class="btn btn-info btn-lg btn-block"><i class="fab fa-neos"></i> Sign in with <b>Naver</b></a>
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=8820ef6337a09d8f33573af30f80442c&redirect_uri=http://localhost:8888/billy/kakaoLogin.do&response_type=code" class="btn btn-four btn-lg btn-block"><i class="fab fa-kickstarter-k"></i> Sign in with <b>Kakao</b></a>
            <a href="https://accounts.google.com/o/oauth2/auth?client_id=1095803907906-ngbfa3hauqa9d6v4t9um7n4u0gkof7g9.apps.googleusercontent.com&response_type=code&scope=profile&redirect_uri=http%3A%2F%2Flocalhost%3A8888%2Fbilly%2FgoogleCheck.do" class="btn btn-danger btn-lg btn-block" ><i class="fab fa-google"></i> Sign in with <b>Google</b></a>
            <a href="${facebook_url}" class="btn btn-primary btn-lg btn-block"><i class="fab fa-facebook"></i> Sign in with <b>Facebook</b></a>
            
        </div>
    </form>
</div>
</body>
</html>                            