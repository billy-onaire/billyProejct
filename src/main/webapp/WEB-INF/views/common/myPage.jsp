<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>My Page</title>

    <!-- Favicon  -->
	<link rel="icon" href="${ pageContext.request.contextPath }/resources/img/core-img/billyTitle.png">
    

    <!-- Core Style CSS -->
    

</head>

<body>
    <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">My Page</h6>

                <!--  Catagories  -->
                <div class="catagories-menu">
                    <ul>
                    	<li><a href="mPageMain.do"><span class="catagories-menu-radios">내 정보 </span></a></li>
                        <li><a href="myproductlist.do"><span class="catagories-menu-radios">내 상품 </span></a></li>
                        <li><a href="reviewList.do"><span class="catagories-menu-radios">내가 작성한 후기 </span></a></li>
                        <li><a href="paymentSearch.do"><span class="catagories-menu-radios">거래/결제 내역 </span></a></li>
                        <li><a href="paymentWaiting.do"><span class="catagories-menu-radios">결제대기 내역 </span></a></li>
                        <li><a href="myReport.do"><span class="catagories-menu-radios">신고내역 </span></a></li>
                        <li><a href="recvList.do"><span class="catagories-menu-radios">쪽지 </span></a></li>
                    </ul>
                </div>
            </div>            
        </div> 

</body>

</html>