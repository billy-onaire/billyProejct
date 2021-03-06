<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Billy - 사용자메뉴</title>
<link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
</script>
<script>
 $(document).ready(function(){
	var userid = "${loginMember.user_id}"
	//alert(userid);
	$.ajax({
		type: "POST",
		url: "unread.do",
		data: "userid="+userid,
		success : function(result){
			if(result != 0){
			$("#num").html(result);
			//$("#mmsalert").css("visibility", "visible");
			$(".btn btn-primary.badge badge-light").text(result);
			$("#alert").text(result);
			}
		}
	});
}); 

//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('fbadc90fdfd0a397c43e051918cc2a0d');
function plusFriendChat() {
  Kakao.PlusFriend.chat({
    plusFriendId: '_KXxaYj' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
  });
}
//]]>

function abc(){
	var aIframe = document.createElement("iframe");

	aIframe.style.width = "200px";
	aIframe.style.height = "100px";
	aIframe.src = "https://app.closer.ai/webchat/Bdo33r";

	document.body.appendChild(aIframe);
	}

</script>

<style type="text/css">

@font-face {
	font-family: 'DXSeNB-KSCpc-EUC-H';
	src: url(/billy/resources/fonts/DXSeNB-KSCpc-EUC-H.ttf) format('truetype');
}

#google_img{
	width: 50px;
    height: 50px;
    border-radius: 50px;
}

#pname {
	font-family: 'DXSeNB-KSCpc-EUC-H';
	font-size: 16pt;
}

.mb-100{
	margin-bottom: 50px;
}
#chatbot a{
float: left;
}
#chatbot a img:hover{
cursor: pointer;
-webkit-filter: drop-shadow(0 1px 2px rgba(0,0,0,.5));
-moz-filter: drop-shadow(0 1px 2px rgba(0,0,0,.5));
-ms-filter: drop-shadow(0 1px 2px rgba(0,0,0,.5));
-o-filter: drop-shadow(0 1px 2px rgba(0,0,0,.5));
filter: drop-shadow(0 1px 2px rgba(0,0,0,.5));
}

</style>

</head>
<body>
	<!-- Mobile Nav (max width 767px)-->
         <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="main.do"><img src="/billy/resources/img/core-img/billylogo4.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>


        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="main.do" class="billya"><img src="/billy/resources/img/core-img/billylogo3.png" alt=""></a>
            </div>
            <!-- Cart Menu -->
            <c:if test="${empty loginMember}">
            <div class="cart-fav-search mb-100">
                <a href="login.do" class=""><img src="/billy/resources/img/core-img/search.png" alt=""> Login</a>
            </div>
       		</c:if>
       		<%-- <c:if test="${!empty googleLogin or !empty loginMember or !empty naverLogin or !empty kakaoLogin or !empty facebookLogin}"> --%>
       		<c:if test="${!empty loginMember}">
       		<!-- 메세지 알림 -->
       		<br>
       		<button id="mmsalert" type="button" style="font-size:8pt; width: 60px; cursor:pointer;" onclick="location.href='recvList.do'" class="btn btn-primary">
       		<img src="/billy/resources/img/core-img/mail.png" style="width: 18px;">
       		&nbsp;<span id="num" class="badge badge-light">
       		</span>
       		</button>
       		<br>
       		<br>
       			<div class="cart-fav-search mb-100" id="socialLogin">
       			<c:if test="${loginMember.social_type eq 'naver' or loginMember.social_type eq 'kakao'}">
       			<img id="google_img"  src="${loginMember.profile }">&nbsp; <span id="pname">${fn:replace(loginMember.user_name, "+", " ") }님</span>
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'google'}">
       			<img id="google_img"  src="${loginMember.profile }">&nbsp; <span id="pname">${fn:replace(loginMember.user_name, "+", " ") }님</span>
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'facebook'}">
       			<img id="facebook_img"  src="/billy/resources/img/social-img/fLogo.JPG">&nbsp; <span id="pname">${fn:replace(loginMember.user_name, "+", " ") }님</span>
       			</c:if>		
       			<c:if test="${loginMember.social_type eq 'user' }">
       			<span id="pname">${fn:replace(loginMember.user_name, "+", " ") }님</span>

       			</c:if>
                <a href="logout.do">로그아웃</a>
       		</div>
       		</c:if>

            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="main.do" >Home</a></li>
                    <li><a href="noticelist.do" >Notice</a></li>
                    <li><a href="aboutUs.do" >About us</a></li>
                    <c:if test="${!empty loginMember }">
                      <li><a href="mPageMain.do" >MyPage</a></li>
                    </c:if>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
            <!-- 챗봇 -->
            <div id="chatbot" align="right"><a href="javascript:void plusFriendChat()" style="align:left;">
  			<img src="/billy/resources/img/core-img/kakaologo.png" style="width: 40px;"/>
  			</a>
			<a href="javascript:window.open('https://app.closer.ai/webchat/Bdo33r','name','width=400px, height=500px,scrollbars=yes,resizable=no');">
			<img src="/billy/resources/img/core-img/chat.png" style="width: 40px;">
			</a>
			</div>
            	<a href="#" class="btn amado-btn mb-15">Chatting</a>
                <a href="showlist.do" class="btn amado-btn mb-15" >Product List</a>
                <c:if test="${!empty loginMember }">
               	<a href="productinsertmain.do" class="btn amado-btn mb-15" >Add a Product</a>
               	</c:if>
                <!-- <a href="#" class="btn amado-btn active">Add a Product</a> -->
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="https://github.com/billy-onaire/billyProejct"><i class="fab fa-git" aria-hidden="true"></i></a>
                <a href="https://github.com/billy-onaire/billyProejct"><i class="fab fa-github" aria-hidden="true"></i></a>
                <a href="https://github.com/billy-onaire/billyProejct"><i class="fab fa-github-square" aria-hidden="true"></i></a>
                <a href="https://github.com/billy-onaire/billyProejct"><i class="fab fa-git-square" aria-hidden="true"></i></a>
            </div>
        </header>
        <!-- Header Area End -->
</body>

<script type="text/javascript">
function popupOpen(){

	var popUrl = "chat.do";	//팝업창에 출력될 페이지 URL

	var popOption = "width=450, height=660, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);

	}
</script>
</html>