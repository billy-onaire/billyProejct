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
    var checkPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/ // 숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var checkId = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    
    $("#user_id").on('keydown', function(e){
         var id = $('#user_id').val();
       
       if(id.length > 12){
          e.preventDefault();
          alert("아이디는 6~12자의 영문 대소문자와 숫자로만 입력.");
            $(this).val("");
            $(this).focus();
       } 
            
       
      }).on('blur', function(e){
         if($(this).val() == '') return;
         var id = $('#user_id').val();
         if(id.length < 6){
        	 $(".result").text("");
            alert("아이디는 6~12자의 영문 대소문자와 숫자로만 입력.");
            $(this).val("");
            $(this).focus();  
       			
         }
         
         if (!(e.keyCode >=37 && e.keyCode<=40)) {	
     		var v = $(this).val();
     		$(this).val(v.replace(/[^a-z0-9]/gi,''));
     	}

   
      });
		
    	$("#user_pwd").on('keydown', function(e){
          var pwd = $('#user_pwd').val();
          
    	  if(pwd.length > 20){
           e.preventDefault();
           alert("비밀번호는 20자리 이하로 사용해야합니다");
            $(this).val("");
            $(this).focus();
    	  } 
 		 });
 
       $("#user_pwd").on('blur', function(){
    	  if($(this).val() == '') return;
          var pwd = $('#user_pwd').val();
          var uid = $('#user_id').val();
     	  if(!checkPwd.test(pwd)){
          alert("숫자+영문자+특수문자 조합으로 8자리 이상 20자리 이하로 사용해야 합니다");
            
       	  }     
     	  
     	 if(pwd == uid){
             alert("아이디와 동일한 비밀번호는 지정할 수 없습니다.")
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
         
        $("#my_introduce").on('keyup', function(e){
        	if($(this).val() == '') return;	
      	   var my = $("#my_introduce").val();
      	   if(my.length > 500){
      		   alert("500자 이내로 입력하세요");
      		   $(this).val($(this).val().substring(0,500));
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

var idck = 0;
var mailck = 0;

$(function() {

	
	
    //idck 버튼을 클릭했을 때 
    $("#idck").click(function() {
    	$('#checkid').val($("#user_id").val());
        
        $.ajax({
           url : "idCheck.do",
            type : "post",
            dataType: "json",
            data : {userId : $("#user_id").val()},
            success : function(data) {
               console.log("ajax success 확인 : " + data.hashMap.cnt);
               
                if (data.hashMap.cnt > 0) {
                   
                   $(".result").text("존재하는 아이디입니다.");
                    $(".result").attr("style", "color:#f00"); 
                    $("#user_id").val('');
                    $("#user_id").focus();
 					idck = 0;
                   
                } else if($("#user_id").val() == null) {
                   
                   $(".result").text("아이디를 입력해주세요.");
                    $(".result").attr("style", "color:#00f"); 
                             
                } else {
                    
                   $(".result").text("사용가능한 아이디입니다.");
                    $(".result").attr("style", "color:#00f");
                    idck = 1;
                    

                }
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
    });
    
   //인증번호 버튼을 눌렀을때 
  $("#eSend").click(function() {
        
	  if($("#email").val() == ""){
		  alert("이메일을 입력해주세요");
		  $(this).focus(); 
		  
	  }else{
	    alert("인증번호를 발송하였습니다")
        $.ajax({
           url : "joinPost.do",
            type : "post",
            dataType: "json",
            data : {email : $("#email").val()},
            success : function(authdata) {
               console.log("ajax 이메일 인증 확인 : " + authdata.hashMap.auth);
               
               if(authdata.hashMap.auth != null){
            	   $("#mailResult").val(authdata.hashMap.auth);
            	   
               }	
            	
            	
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });
	  }
    });
  
  $("#everify").click(function() {
	  var mailin = $("#authkey").val();
	  var mailResult = $("#mailResult").val();
	  if(mailin == mailResult){
		  $(".result5").text("인증되었습니다.");
		  $(".result5").attr("style", "color:#00f");
		  mailck = 1;
		  
	  }else{
		  $(".result5").text("인증번호가 다릅니다.");
		  $(".result5").attr("style", "color:#f00");
		  mailck = 0;
		  mailin.val('');
		  mailin.focus();	  
	  }
	  
	  
  });
       
});
    //처음에 아이디체크 버튼 누를때 느려서 만든거
    $.ajax({
       url : "idCheck.do",
        type : "post",
        dataType: "json",
        data : {userId : $("#user_id").val()},
        
    });


function goSubmit() {
   
   var loca = $('#location_area').val();
   var findStr = "서울";	
	
   if(idck == 0){
       alert('아이디 중복체크를 해주세요');
       $("#user_id").focus();
       return false;
       
   }
   
   if(mailck == 0){
       alert('이메일 인증을 해주세요');
       $("#email").focus();
       return false;
       
   }

    
   if(idck = 0){
	  alert("존재하는 아이디입니다. 아이디 체크 해주세요") 
   }else if($('#user_id').val() == ''){
	  alert("아이디를 입력해주세요");
   }else if($('#user_name').val() == ''){
      alert("이름을 입력해주세요");
   }else if($('#user_pwd').val() == ''){
      alert("비밀번호를 입력해주세요");
   }else if($('#user_pwd2').val() == ''){	
      alert("비밀번호를 입력해주세요");
   }else if($('#user_mobile').val() == ''){
      alert("핸드폰번호를 입력해주세요");
   }else if($('#email').val() == ''){
      alert("이메일을 입력해주세요");
   }else if($('#address').val() == ''){
      alert("주소를 입력해주세요");
   }else if($('#location_area').val() == ''){
      alert("거래 가능지역을 입력해주세요");
   }else if(loca.indexOf(findStr) == -1){
   	  alert("주 거래가능 지역은 서울만 가능합니다")
   }else if($("#user_id").val() != $('#checkid').val()){
	   alert("다시 아이디 중복체크를 해주세요.");
	   $("#user_id").focus();
   }
   else{
       $("#join").submit();
       alert("회원가입이 완료되었습니다")
   }
   
}

</script>


<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">

<style>
#mainv {
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
      
      <div class="amado_product_area section-padding-100" id="mainv">
      <div class="login-enroll-form clearfix">
      <div class="container">
      <form action="joinUser.do" id="join" name = "join" method="post" enctype="multipart/form-data">
      <input type="hidden" id="checkid">
            <h1>회원가입</h1>
            <p>Please fill in this form to create an account.</p>
            <hr>
               <label for="user_id"><b>아이디</b></label> 
               <div class="input-group mb-3">               
               <input type="text" class="form-control" placeholder="Enter ID" id="user_id" name="user_id" required>
                  <div class="input-group-append">
                  <button id="idck" class="btn btn-dark btn-sm" type="button">아이디 중복체크</button>
                  </div>
               </div>
               <p id="pp" style="color: orange">아이디는 6~12자의 영문 대소문자와 숫자로만 입력가능합니다</p>
               <p class="result"></p>

               <label for="user_name"><b>이름</b></label> 
               <input type="text"placeholder="Enter Name" id="user_name" name="user_name" required> 
               <label for="user_pwd"><b>비밀번호</b></label> 
               <input type="password" placeholder="Enter Password" id="user_pwd" name="user_pwd" required> 
               <label for="user_pwd2"><b>비밀번호 재입력</b></label> 
               <input type="password" placeholder="Repeat Password" id="user_pwd2" name="user_pwd2" required> 
               <label for="user_mobile"><b>핸드폰 번호</b></label> 
               <input type="text" placeholder="Enter Phone" id="user_mobile" name="user_mobile" required> 
               
               <label for="email"><b>이메일</b></label>             
               <div class="input-group mb-4">                       
               <input type="text" class="form-control" placeholder="abc@abc.com 형식으로 작성해주세요" id="email" name="email" required>
               <div class="input-group-append">
               <input type="button" id="eSend" class="btn btn-dark btn-sm" value="인증번호 발송">
                </div>
               </div>
               <p id="pp" style="color: orange">E-mail로 발송된 내용을 확인한 후 인증하셔야 회원가입이 완료됩니다.</p>
               <!-- 이메일 인증번호  -->
               <input type="hidden" id="mailResult" required>
               
               <label for="email"><b>인증번호 입력</b></label>
               <div class="input-group mb-4">  
               <input type="text" class="form-control" id="authkey" name="authkey" placeholder="인증번호를 입력하세요" required>
               <div class="input-group-append">  
               <input type="button" id="everify" class="btn btn-dark btn-sm" value="인증 하기">
               </div>           
               </div> 
               <p class="result5"></p>
               
         
            <label for="address"><b>주소</b></label> 
            <div class="input-group mb-4">   
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
            <p id="pp" style="color: orange">서울 지역만 등록 가능합니다</p>         
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
            
      </form>
            <button id="register" type="button" class="registerbtn"
               style="background-color: orange" onclick="goSubmit();">등록하기</button>   
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