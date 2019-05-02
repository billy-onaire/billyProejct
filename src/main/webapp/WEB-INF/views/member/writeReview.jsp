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

	<style type="text/css">
		table.type04 {
		    border-collapse: separate;
		    border-spacing: 1px;
		    text-align: center;
		    line-height: 1.5;
		    border-top: 1px solid #ccc;
		  margin : 20px 10px;
		}
		table.type04 th {
		    width: 350px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: center;
		    border-bottom: 1px solid #ccc;
		}
		table.type04 td {
		    width: 650px;
		    padding: 10px;
		    vertical-align: center;
		    border-bottom: 1px solid #ccc;
		}
		.starR{
		  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 30px;
		  height: 30px;
		  display: inline-block;
		  text-indent: -9999px;
		  cursor: pointer;
		}
		.starR.on{background-position:0 0;}
	</style>
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
	<h1>Review</h1>
		<form class="cart clearfix" method="post" enctype="multipart/form-data" action="insertReview.do">
                   <br><br>       	
            <table class="type04">
			    <tr>
			        <th rowspan="2"><img src="/billy/resources/img/product-img/pro-big-1.jpg" width="300px" height="300px"></th>
			        <td>더러운 신발</td>
			    </tr>
			    <tr>
			        <td>2019.04.19~2019.04.28</td>
			    </tr>
			    <tr>
			        <th>사진첨부</th>
			        <td><input type="file" name="img"></td>
			    </tr>
			    <tr>
			        <th>별점</th>
			        <td><div class="starRev">
					  <span class="starR on">1</span>
					  <span class="starR">2</span>
					  <span class="starR">3</span>
					  <span class="starR">4</span>
					  <span class="starR">5</span>
					</div></td>
			    </tr>
			    <tr>
			        <th>대여후기</th>
			        <td><div class="col-12 mb-3">
                        <textarea name="review_content" class="form-control w-100" id="comment" cols="30" rows="5" placeholder="대여한 제품에 대한 간단한 평가를 해주세요"></textarea>
                        </div>
                    </td>
			    </tr>
			</table>
        	<center><button type="submit" name="addtocart" value="5" class="btn amado-btn">작성완료</button></center>
        	<input type="hidden" name="point" id="point" value="1">
        </form>
       
        
    </div>
 
    <!-- ##### Main Content Wrapper End ##### -->
	<c:import url="../common/footer.jsp" />
   


    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript">
    $('.starRev span').click(function(){
    	  $(this).parent().children('span').removeClass('on');
    	  $(this).addClass('on').prevAll('span').addClass('on');
    	  var point = $(this).text();
    	  $("#point").val(point);
    	  return false;
    	});
    </script>
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