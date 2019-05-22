<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Billy - 아이디/비밀번호 찾기</title>

<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    
 /*  $(function () {
      showDiv();

      $("input[name=item]").on("change", function () {
        showDiv();
      });
    });

    function showDiv() {
      if ($("input[name=item]").eq(0).is(":checked")) {
        $("#findId").css("display", "block");
        $("#findPwd").css("display", "none");
      }

      if ($("input[name=item]").eq(1).is(":checked")) {
        $("#findId").css("display", "none");
        $("#findPwd").css("display", "block");
      }
    } */

//아이디 찾기
 $(function() {   
	
	$("#findId").click(function() {
	
	  $("#findId").hide();
	  
      $.ajax({
        url: "findId.do",
        type: "post",
        data: {user_name: $("#user_name").val(), user_mobile: $("#phone").val() },
        dataType: "json",
        success: function(obj){       	
        	console.log(obj);  //object 라고 출력됨
			//리턴된 객체 하나를 문자열로 변환 처리
			var objStr = JSON.stringify(obj);
			//문자열을 json 객체로 바꿈
			var jsonObj = JSON.parse(objStr);
			
			var outValues = $("#d3").html();
			
			if(jsonObj != null){
			for(var i in jsonObj.list){
				outValues += jsonObj.list[i].user_id + "<br>";
			}		
			$("#d3").append("<p style=text-align:center;>" + "조회하신 회원님의 아이디 : " + "<br>" + outValues + "</p>")
			}else{
			$("#d3").append("<p style=text-align:center;>" + "아이디가 존재하지 않습니다." + "</p>")}
       		 },
            error: function (XMLHttpRequest, textStatus, errorThrown){

            	alert('정보를 다시 입력해주시길 바랍니다.' );
            }
      });
    });
	}); 
    
    function sendSms(){
    	var userId = $("#puserId").val();
    	var phone = $("#pphone").val();
    	
    	if(userId == null || userId == ""){
    		alert("아이디를 입력해주세요.");
    		$("#puserId").focus();
    		return false;
    	}else if(phone == null || phone == ""){
    		alert("전화번호를 입력해주세요.");
    		$("#pphone").focus();
    		return false;
    	}
    	
    	$.ajax({
    		url: "sendSms.do",
    		data: {user_mobile : phone,
    			user_id : userId},
    		type: "post",
    		success: function(result){
    			alert(decodeURIComponent(result.hashMap.message).replace(/\+/g, " "));
    			if(decodeURIComponent(result.hashMap.message).replace(/\+/g, " ") == "인증번호 발송 성공하였습니다."){
    				console.log(result.hashMap.authno + ", " + result.hashMap.userId);
    				$("#findpwd").on("click",function(){
    				if($("#phoneAuth").val() == null || $("#phoneAuth").val() == ""){
    					alert("인증번호를 입력해주세요.");
    					$("#phoneAuth").focus();
    					return false;
    				}	
    				$("#userId").val(result.hashMap.userId);
    				var authno = $("#phoneAuth").val();
    				var userId = $("#userId").val();
    				$.ajax({
    					url: "checkAuthNo.do",
    					data: {
    						authno: authno,
    						userId: userId
    					},
    					type: "post",
    					success: function(result){
    						alert(decodeURIComponent(result.hashMap.message).replace(/\+/g, " "));
    						if(decodeURIComponent(result.hashMap.message).replace(/\+/g, " ") == "인증 성공"){
    							location.href="changePwdPage.do?userId="+result.hashMap.userId;
    						}else{
    							$("#phoneAuth").focus();
    						}
    					},error: function(request, status, errorData){
    						console.log("error code : " + request.status
    								+ "\nmessage : " + request.responseText
    								+ "\nerror : " + errorData);
    						}
    					});//ajax
    				}); //click
    			}
    		},error: function(request, status, errorData){
				console.log("error code : " + request.status
						+ "\nmessage : " + request.responseText
						+ "\nerror : " + errorData);
			}
    		
    	});
    }
  </script>

<style>

</style>

</head>

<body>
	 <div class="tab-content"> 
	 
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li class="nav-item"><a class="nav-link active"
				data-toggle="tab" href="#findIdd">아이디 찾기</a></li>
			<li class="nav-item"><a class="nav-link" data-toggle="tab"
				href="#findPwd">비밀번호 찾기</a></li>
		</ul>


		<!-- 아이디 찾기  -->
		<div id="findIdd" class="container tab-pane active">
			<div class="form-group"><br>
				<label for="uname">Username:</label> <input type="text"
					class="form-control" id="user_name" placeholder="Enter username"
					name="user_name" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>

			<div class="form-group">
				<label for="phone">Phone:</label> <input type="text"
					class="form-control" id="phone" placeholder="Enter phone number"
					name="phone" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<p>
			<div id="d3"></div>
			</p>
			<button type="submit" class="btn btn-warning btn-block" id="findId"
				style="color: white">확인</button>
		</div>
		<!-- 비밀번호 찾기  -->
		<div id="findPwd" class="container tab-pane fade">
			<div class="form-group"><br>
				<label for="puserId">UserId :</label> <input type="text"
					class="form-control" id="puserId" placeholder="Enter username"
					name="user_id" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="form-group">
				<label for="pphone">phone : </label> <input type="text"
					class="form-control" id="pphone" placeholder="Enter phone number"
					name="user_moblie" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<button type="button" class="btn btn-dark" onclick="sendSms();">인증요청</button>
			<div class="form-group">
				<label for="phoneAuth">인증번호:</label> <input type="text"
					class="form-control" id="phoneAuth" name="authno" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<input type="hidden" id="userId" name="user_id"> <br> <br>
			<span id="pwdList"></span>
			<button type="submit" class="btn btn-warning btn-block" id="findpwd"
				style="color: white">확인</button>
		</div>

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