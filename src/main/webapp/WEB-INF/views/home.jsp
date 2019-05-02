<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>Billy - main</title>

<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
	<c:if test="${!empty param.code}">
		$.ajax({
			url: "token.do",
			data: { code: "${param.code}", 
				client_id: "1095803907906-ngbfa3hauqa9d6v4t9um7n4u0gkof7g9.apps.googleusercontent.com", 
				client_secret: "PgasrNGtVq5aRtEci9joCM8v",
				redirect_uri: "http://localhost:8888/billy",
				grant_type: "authorization_code"},
			type: "post",
			dataType: "json",
			success: function(result){
				if(result != null){
					alert("토큰성공!");
					console.log("result : " + result.hashMap.access_token + "body : " + result.hashMap.body + "name : " + result.hashMap.name + "profile : " + result.hashMap.profile);
					$("#googleLogin").html("<img src='"+result.hashMap.profile+"'/><h4>"+result.hashMap.name+"</h4>");
				}
			},error: function(request, status, errorData){
				console.log("error code : " + request.status
						+ "\nmessage : " + request.responseText
						+ "\nerror : " + errorData);
			}
		}); //ajax
	</c:if>
			
	}); //ready
</script>
</head>

<body> 
	<!-- Search Wrapper Area Start -->
	<div class="search-wrapper section-padding-100">
		<div class="search-close">
			<i class="fa fa-close" aria-hidden="true"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="search-content">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type your keyword...">
							<button type="submit">
								<img src="/billy/resources/img/core-img/search.png" alt="">
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Search Wrapper Area End -->

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">
		<c:import url="common/nav.jsp" />
		<!-- Product Catagories Area Start -->
		<div class="products-catagories-area clearfix">
			<div class="amado-pro-catagory clearfix">
				<!-- Single Catagory -->
                <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="/billy/resources/img/bg-img/living.jpg" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>생활</p>
                            <h4>Living</h4>
                        </div>
                    </a>
                </div>

                <!-- Single Catagory -->
                <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="/billy/resources/img/bg-img/clothes2.jpg" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>의류</p>
                            <h4>Clothes</h4>
                        </div>
                    </a>
                </div>

                <!-- Single Catagory -->
                <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="/billy/resources/img/bg-img/electronics4.jpg" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>전자기기</p>
                            <h4>Electronics</h4>
                        </div>
                    </a>
                </div>

                <!-- Single Catagory -->
                <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="/billy/resources/img/bg-img/5.jpg" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>기타</p>
                            <h4>ETC</h4>
                        </div>
                    </a>
                </div>

                <!-- Single Catagory -->
                <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="/billy/resources/img/bg-img/6.jpg" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>키즈</p>
                            <h4>Kids</h4>
                        </div>
                    </a>
                </div>           

                <!-- Single Catagory -->
                <div class="single-products-catagory clearfix">
                    <a href="shop.html">
                        <img src="/billy/resources/img/bg-img/sports.jpg" alt="">
                        <!-- Hover Content -->
                        <div class="hover-content">
                            <div class="line"></div>
                            <p>스포츠</p>
                            <h4>Sports</h4>
                        </div>
                    </a>
                </div>

			</div>
		</div>
		<!-- Product Catagories Area End -->
	</div>
	<c:import url="common/footer.jsp" />

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