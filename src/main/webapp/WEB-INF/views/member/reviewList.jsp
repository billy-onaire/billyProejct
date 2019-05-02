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
		table.type06 {
		    border-collapse: collapse;
		    text-align: left;
		    line-height: 1.5;
		    border-top: 1px solid #ccc;
		    border-bottom: 1px solid #ccc;
		    margin: 20px 10px;
		}
		table.type06 th {
		    width: 150px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: center;
		}
		table.type06 td {
		    width: 350px;
		    padding: 10px;
		    vertical-align: center;
		}
		table.type06 .even {
		    /* background: #efefef; */
		    background: #ffe2b8;
		}
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
	    <table class="type06">
	    	<tr>
		        <th class="even">이미지</th>
		        <th class="even">제품명</th>
		        <th class="even">대여기간</th>
		        <th class="even">후기작성</th>
		    </tr>
		    <tr>
		        <td><img src="/billy/resources/img/product-img/pro-big-1.jpg" width="150px" height="150px"></td>
		        <td>더러운신발</td>
		        <td>2019.04.05-2019.04.08</td>
		        <td><div class="cart-btn mt-100">
		        	<c:url var="insertReview" value="writeReview.do">
		        		<c:param name="payNo" value="hi" />
		        	</c:url>
	                <a href="${insertReview }" class="btn amado-btn w-100">대여후기 쓰기</a>
	             	</div>
             	</td>
		    </tr>
		    <tr>
		        <td class="even"><img src="/billy/resources/img/product-img/pro-big-1.jpg" width="150px" height="150px"></td>
		        <td class="even">더러운신발</td>
		        <td class="even">2019.04.05-2019.04.08</td>
		        <td class="even"><button>대여후기 쓰기</button></td>
		    </tr>
		    <tr>
		        <td><img src="/billy/resources/img/product-img/pro-big-1.jpg" width="150px" height="150px"></td>
		        <td>더러운신발</td>
		        <td>2019.04.05-2019.04.08</td>
		        <td><button>대여후기 쓰기</button></td>
		    </tr>
		    <tr>
		        <td class="even"><img src="/billy/resources/img/product-img/pro-big-1.jpg" width="150px" height="150px"></td>
		        <td class="even">더러운신발</td>
		        <td class="even">2019.04.05-2019.04.08</td>
		        <td class="even"><button>대여후기 쓰기</button></td>
		    </tr>
		</table>
        
        
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