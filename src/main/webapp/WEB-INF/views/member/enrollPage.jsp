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
$(function(){
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    	
    $("#user_id").on('keydown', function(e){
   		var id = $('#user_id').val();
   	 
    	if(id.length > 12){
    		e.preventDefault();
    		alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력.");
            $(this).val("");
            $(this).focus();
       } 
    	
   	}).on('blur', function(){
   		if($(this).val() == '') return;
   		var id = $('#user_id').val();
   		if(id.length < 6){
   			alert("아이디는 4~12자의 영문 대소문자와 숫자로만 입력.");
            $(this).val("");
            $(this).focus();	
   		}
   	});
   	
    
   	 $("#user_pwd").on('keydown', function(e){
   		var pwd = $('#user_pwd').val();
   	 
    	if(pwd.length >= 20){
    		e.preventDefault();
    		alert("비밀번호는 4~20자의 영문 대소문자와 숫자로만 입력.");
            $(this).val("");
            $(this).focus();
       } 
    	
   	}).on('blur', function(){
   		if($(this).val() == '') return;
   		var pwd = $('#user_pwd').val();
   		if(pwd.length <= 4){
   			alert("비밀번호는 4~20자의 영문 대소문자와 숫자로만 입력.");
            $(this).val("");
            $(this).focus();	
   		}
   	});
   	 
   	
   	$("#user_pwd2").on('blur', function(){
   		if($(this).val() == '') return;
   		var pwd = $('#user_pwd').val();
   		var pwd2 = $('#user_pwd2').val();
   		
   		if(pwd != pwd2){
   			alert("입력하신 비밀번호와 다릅니다. ");
            $(this).val("");
            $(this).focus();	   		
   		}
 
   		
   	});

   	 
   	  $("#email").on('blur', function(e){
   		 if($(this).val() == '') return;
  		 	if(!getMail.test($("#email").val())){
	        alert("이메일형식에 맞게 입력해주세요")
	        $('#email').val("");
            $('#email').focus();
	   		
  		 	}  
 	  	});
    
});
 

$(function(){

    $("#user_mobile").on('keydown', function(e){
       // 숫자만 입력받기
    var trans_num = $(this).val().replace(/-/gi,'');
	var k = e.keyCode;
				
	if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
	{
  	    e.preventDefault();
	}
    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        if($(this).val() == '') return;

        // 기존 번호에서 - 를 삭제합니다.
        var trans_num = $(this).val().replace(/-/gi,'');
      
        // 입력값이 있을때만 실행합니다.
        if(trans_num != null && trans_num != '')
        {
            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            if(trans_num.length==11 || trans_num.length==10) 
            {   
                // 유효성 체크
                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                if(regExp_ctn.test(trans_num))
                {
                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                    $(this).val(trans_num);
                }
                else
                {
                    alert("유효하지 않은 전화번호 입니다.");
                    $(this).val("");
                    $(this).focus();
                }
            }
            else 
            {
                alert("유효하지 않은 전화번호 입니다.");
                $(this).val("");
                $(this).focus();
            }
      }
  });  
});
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
		<form action="joinPost.do" name = "join" onsubmit="return validate();" method="post" enctype="multipart/form-data">
				<h1>회원가입</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>

					<label for="user_id"><b>아이디</b></label> 
					<input type="text"placeholder="Enter ID" id="user_id" name="user_id" required> 
					<label for="user_name"><b>이름</b></label> 
					<input type="text"placeholder="Enter Name" id="user_name" name="user_name" required> 
					<label for="user_pwd"><b>비밀번호</b></label> 
					<input type="password" placeholder="Enter Password" id="user_pwd" name="user_pwd" required> 
					<label for="user_pwd2"><b>비밀번호 재입력</b></label> 
					<input type="password" placeholder="Repeat Password" id="user_pwd2" name="user_pwd2" required> 
					<label for="user_mobile"><b>핸드폰 번호</b></label> 
					<input type="text" placeholder="Enter Phone" id="user_mobile" name="user_mobile" required> 
					<label for="email"><b>이메일 인증</b></label> 
					<input type="text" placeholder="Enter Email" id="email" name="email" required>
					<p id="pp" style="color: orange">E-mail로 발송된 내용을 확인한 후 인증하셔야 회원가입이 완료됩니다.</p>

				<label for="verify"><b>인증 번호</b></label> <input type="text"
					placeholder="Enter verification number" id="verift" name="verify" required>

				<label for="address"><b>주소</b></label> 
				<input type="text" placeholder="Enter address" id="address" name="address" required> 
				<label for="location_area"><b>주거래가능 지역</b></label> 
				<input type="text" placeholder="Enter Possible Transaction Area" id="location_area" name="location_area" required> 
				<label for="my_introduce"><b>본인소개</b></label>
				<textarea style="background-color: #f1f1f1" class="form-control"
					rows="5" name="my_introduce" id="my_introduce" placeholder="500자 이내로 작성하세요."></textarea>

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