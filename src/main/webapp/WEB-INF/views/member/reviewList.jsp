<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | Checkout</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <link rel="stylesheet" href="/billy/resources/css/style.css">

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
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="/billy/resources/img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->
    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">
	<c:import url="../common/nav.jsp" />
		<div class="list">
		<center>
			<div>
				<img src="/billy/resources/img/product-img/pro-big-1.jpg" width="150px" height="150px">	
			</div>
			<div>
				<h3>더러운 신발</h3><br><br><h6>2019.4.12 ~ 2019.4.15</h6>
			</div> 
	        <div class="cart-btn mt-100">
	        	<c:url var="insertReview" value="writeReview.do">
	        		<c:param name="payNo" value="hi" />
	        	</c:url>
                <a href="${insertReview }" class="btn amado-btn w-100">대여후기 쓰기</a>
             </div><hr>
        </center>
	    </div> &nbsp;&nbsp;&nbsp;
        <div class="list">
		<center>
			<div>
				<img src="/billy/resources/img/product-img/pro-big-1.jpg" width="150px" height="150px">	
			</div>
			<div>
				<h3>더러운 신발</h3><br><br><h6>2019.4.12 ~ 2019.4.15</h6>
			</div> 
	        <div class="cart-btn mt-100">
                <a href="#" class="btn amado-btn w-100">대여후기 쓰기</a>
             </div><hr>
        </center>
	    </div>
	    
        
        
    </div>
 
    <!-- ##### Main Content Wrapper End ##### -->
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