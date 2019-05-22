<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Billy - 관리자메뉴</title>
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

.chat{
	width: 100px;
	height: 100px;
}
</style>

</head>
<body>
	<!-- Mobile Nav (max width 767px)-->
		 <!-- Mobile Nav (max width 767px)-->
		<div class="mobile-nav">
			<!-- Navbar Brand -->
			<div class="amado-navbar-brand">
				<a href="amain.do"><img src="/billy/resources/img/core-img/billylogo4.png" alt=""></a>
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
				<a href="amain.do" class="billya"><img src="/billy/resources/img/core-img/billylogo3.png" alt=""></a>
			</div>
			<!-- Cart Menu -->
			<c:if test="${empty loginAdmin}">
			<div class="cart-fav-search mb-100">
				<a href="login.do" class=""><img src="/billy/resources/img/core-img/search.png" alt=""> Login</a>
				<a href="recvList.do">쪽지 확인용</a>
			</div>
			</c:if>
			<c:if test="${!empty loginAdmin}">
			<div class="cart-fav-search mb-100" id="socialLogin">
				<img id="google_img"  src="${googleLogin.profile }">&nbsp; <span id="pname">${googleLogin.name }님</span>
				<a href="logout.do">로그아웃</a>
			</div>
			</c:if>

			<!-- Amado Nav -->
			<nav class="amado-nav">
				<ul>
					<li class="active"><a href="amain.do" >Home</a></li>
					<li><a href="adminnoticelist.do" >Notice</a></li>
					<li><a href="adminProductList.do" >제품게시글관리</a></li>
					<li><a href="goReportAdmin.do" >신고관리</a></li>
					<li><a href="#" >About us</a></li>
					<li><a href="memberManagementPage.do" >회원관리</a></li>
				</ul>
			</nav>
			<!-- Button Group -->
			<div class="amado-btn-group mt-30 mb-100">
				<a href="showlist.do"><img src="/billy/resources/img/core-img/chatting.png" class="chat"></a>
				<!-- <a href="#" class="btn amado-btn active">Add a Product</a> -->
			</div>
		</header>
		<!-- Header Area End -->
</body>
</html>