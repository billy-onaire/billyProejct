<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Billy - 사용자메뉴</title>
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
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
	font-size: 30pt;
}

.mb-100{
	margin-bottom: 50px;
}
</style>

</head>
<body>
	<!-- Mobile Nav (max width 767px)-->
         <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="/billy/resources/img/core-img/billylogo4.png" alt=""></a>
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
            <c:if test="${empty googleLogin and empty loginMember and empty naverLogin and empty kakaoLogin and empty facebookLogin}">
            <div class="cart-fav-search mb-100">
                <a href="login.do" class=""><img src="/billy/resources/img/core-img/search.png" alt=""> Login</a>
            </div>
       		</c:if>
       		<c:if test="${!empty googleLogin or !empty loginMember or !empty naverLogin or !empty kakaoLogin or !empty facebookLogin}">
       			<div class="cart-fav-search mb-100" id="socialLogin">
       			<c:if test="${!empty googleLogin}">
       			<img id="google_img"  src="${googleLogin.profile }">&nbsp; <span id="pname">${googleLogin.name }님</span>
       			</c:if>
       			<c:if test="${!empty naverLogin}">
       			<img id="google_img"  src="${naverLogin.profile }">&nbsp; <span id="pname">${naverLogin.name }님</span>
       			</c:if>
       			<c:if test="${!empty kakaoLogin}">
       			<img id="google_img"  src="${kakaoLogin.profile }">&nbsp; <span id="pname">${kakaoLogin.name }님</span>
       			</c:if>
       			<c:if test="${!empty facebookLogin}">
       			<img id="facebook_img"  src="/billy/resources/img/social-img/fLogo.JPG">&nbsp; <span id="pname">${facebookLogin.name }님</span>
       			</c:if>		
       			<c:if test="${!empty loginMember  }">
       			<span id="pname">${loginMember.user_name }님</span>
       			</c:if>
                <a href="logout.do">로그아웃</a>
       		</div>
       		</c:if>


            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="main.do" >Home</a></li>
                    <li><a href="selectnoticelist.do" >Notice</a></li>
                    <li><a href="#" >About us</a></li>
                    <li><a href="myproductlist.do" >MyPage</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="showlist.do" class="btn amado-btn mb-15" >채팅</a>
               	<a href="productinsertmain.do" class="btn amado-btn mb-15" >Add a Product</a>
                <a href="resultPay.do" class="btn amado-btn mb-15" >PAYMENT</a>
                <!-- <a href="#" class="btn amado-btn active">Add a Product</a> -->
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
        <!-- Header Area End -->
</body>
</html>