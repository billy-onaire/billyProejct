<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
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
<title>회원정보 수정</title>

<script type="text/javascript" src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$(function(){
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    
   	 $("#user_pwd").on('keydown', function(e){
   		var pwd = $('#user_pwd').val();
   	 
    	if(pwd.length > 20){
    		e.preventDefault();
    		alert("비밀번호는 4~20자의 영문 대소문자와 숫자로만 입력.");
            $(this).val("");
            $(this).focus();
       } 
    	
   	}).on('blur', function(){
   		if($(this).val() == '') return;
   		var pwd = $('#user_pwd').val();
   		if(pwd.length < 4){
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
                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})?([0-9]{3,4})?([0-9]{4})$/, "$1$2$3");                  
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
	<c:import url="../common/myPage.jsp" />
	
	
	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">
		<!-- 회원가입 폼 -->
		<div class="login-enroll-form clearfix">
		<div class="container">
		<form action="mupdate.do" method="post" enctype="multipart/form-data">
				<h1>회원정보 수정</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>
					<c:if test="${!empty loginMember }">
					<input type="hidden" id="user_id" name="user_id" value="${loginMember.user_id }">
					</c:if>
					<c:if test="${!empty kakaoLogin }">
					<input type="hidden" id="user_id" name="user_id" value="${kakaoLogin }">
					</c:if>
					<c:if test="${!empty googleLogin }">
					<input type="hidden" id="user_id" name="user_id" value="${googleLogin }">
					</c:if>
					<c:if test="${!empty naverLogin }">
					<input type="hidden" id="user_id" name="user_id" value="${naverLogin }">
					</c:if>
					<c:if test="${!empty facebookLogin }">
					<input type="hidden" id="user_id" name="user_id" value="${facebookLogin }">
					</c:if>

					<label for="user_name"><b>이름</b></label> 
					<input type="text" id="user_name" name="user_name" value="${loginMember.user_name }" required> 
							
					<c:if test="${!empty loginMember }">
					<label for="user_pwd"><b>비밀번호</b></label> 
					<input type="password" placeholder="Enter Password" id="user_pwd" name="user_pwd" required>
					<label for="user_pwd2"><b>비밀번호 재입력</b></label> 
					</c:if>
					<c:if test="${!empty kakaoLogin }">
					<input type="hidden" id="user_pwd" name="user_pwd" value="${kakaoLogin.user_pwd }">
					</c:if>
					<c:if test="${!empty googleLogin }">
					<input type="hidden" id="uuser_pwd" name="user_pwd" value="${googleLogin.user_pwd }">
					</c:if>
					<c:if test="${!empty naverLogin }">
					<input type="hidden" id="user_pwd" name="user_pwd" value="${naverLogin.user_pwd }">
					</c:if>
					<c:if test="${!empty facebookLogin }">
					<input type="hidden" id="user_pwd" name="user_pwd" value="${facebookLogin.user_pwd }">
					</c:if>
					
					
					<input type="password" placeholder="Repeat Password" id="user_pwd2" name="user_pwd2" required> 
					<label for="user_mobile"><b>핸드폰 번호</b></label> 
					<input type="text" placeholder="Enter Phone" id="user_mobile" name="user_mobile" required> 
					<label for="email"><b>이메일</b></label> 
					<input type="text" placeholder="Enter Email" id="email" name="email" required>

				<label for="address"><b>주소</b></label> 
				<div class="input-group mb-5">	
				<input type="text" class="form-control" placeholder="주소 검색 버튼을 클릭하여 주소를 선택해주세요" id="address" name="address" required readonly>
					<div class="input-group-append">
					<input type="button" class="btn btn-dark btn-sm" onclick="searchAddress1()" value="주소 검색"><br>
					</div>
				</div>
				<!-- <div id="map1" style="width:300px;height:300px;margin-top:10px;display:none"></div> -->
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e2688930bfd694b41af56058fd0928e&libraries=services"></script>
				<script>
			    function searchAddress1() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                var addr = data.address; // 최종 주소 변수

			                // 주소 정보를 해당 필드에 넣는다.
			                document.getElementById("address").value = addr;
			            }
			        }).open();
			    }
				</script>
				
				
				<label for="location_area"><b>주거래가능 지역</b></label> 
				<div class="input-group mb-4">	
				<input type="text" class="form-control" placeholder="주소 검색 버튼을 클릭하여 주소를 선택해주세요" id="location_area" name="location_area" required readonly>
					<div class="input-group-append">
					<input type="button" class="btn btn-dark btn-sm" onclick="searchAddress()" value="주소 검색"><br>
					</div>
				</div>			
			    <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
				<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e2688930bfd694b41af56058fd0928e&libraries=services"></script>
				<script>
				 var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			        mapOption = {
			            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			            level: 5 // 지도의 확대 레벨
			        };

			    //지도를 미리 생성
			    var map = new daum.maps.Map(mapContainer, mapOption);
			    //주소-좌표 변환 객체를 생성
			    var geocoder = new daum.maps.services.Geocoder();
			    //마커를 미리 생성
			    var marker = new daum.maps.Marker({
			        position: new daum.maps.LatLng(37.537187, 127.005476),
			        map: map
			    });

			    function searchAddress() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                var addr = data.address; // 최종 주소 변수

			                // 주소 정보를 해당 필드에 넣는다.
			                document.getElementById("location_area").value = addr;
			                // 주소로 상세 정보를 검색
			                geocoder.addressSearch(data.address, function(results, status) {
			                    // 정상적으로 검색이 완료됐으면
			                    if (status === daum.maps.services.Status.OK) {

			                        var result = results[0]; //첫번째 결과의 값을 활용

			                        // 해당 주소에 대한 좌표를 받아서
			                        var coords = new daum.maps.LatLng(result.y, result.x);
			                        // 지도를 보여준다.
			                        mapContainer.style.display = "block";
			                        map.relayout();
			                        // 지도 중심을 변경한다.
			                        map.setCenter(coords);
			                        // 마커를 결과값으로 받은 위치로 옮긴다.
			                        marker.setPosition(coords)
			                    }
			                });
			            }
			        }).open();
			    }
				</script>
				
				<label for="my_introduce"><b>본인소개</b></label>
				<textarea style="background-color: #f1f1f1" class="form-control"
					rows="5" name="my_introduce" id="my_introduce" placeholder="500자 이내로 작성하세요."></textarea>

				<hr>
				<p>
					By creating an account you agree to our <a href="#">Terms &
						Privacy</a>.
				</p>

				<button id="register" type="submit" class="registerbtn"
					style="background-color: orange">수정하기</button>
		</form>
		</div>
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