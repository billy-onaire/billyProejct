<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#google_img{
	width: 30px;
    height: 30px;
    border-radius: 30px;
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
                <a href="main.do"><img src="/billy/resources/img/core-img/billylogo3.png" alt=""></a>
            </div>
            <!-- Cart Menu -->
            <c:set var="profile" value="${profile }" scope="session" /> 
			<c:set var="name" value="${name }" scope="session" /> 
            <c:if test="${empty googleLogin }">
            <div class="cart-fav-search mb-100">
                <a href="login.do" class="search-nav"><img src="/billy/resources/img/core-img/search.png" alt=""> Login</a>
                <a href="recvList.do">쪽지 확인용</a>
            </div>
       		</c:if>
       		<c:if test="${!empty googleLogin }">
       			<div class="cart-fav-search mb-100" id="googleLogin">
       			<img id="google_img"  src="${profile }">&nbsp; <span>${name }</span>
                <a href="recvList.do">쪽지 확인용</a>
                <a href="logout.do">로그아웃</a>
       		</div>
       		</c:if>
       		
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li class="active"><a href="main.do">Home</a></li>
                    <li><a href="#">Notice</a></li>
                    <li><a href="#">About us</a></li>
                    <li><a href="myproductlist.do">MyPage</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="showlist.do" class="btn amado-btn mb-15">Product List</a>
                <a href="productinsertmain.do" class="btn amado-btn mb-15">Add a Product</a>
                <a href="resultPay.do" class="btn amado-btn mb-15">PAYMENT</a>
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