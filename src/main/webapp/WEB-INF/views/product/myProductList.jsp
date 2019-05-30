<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" >
   <!--  <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>상품수정</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
	<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <style>
    .line{
        width: 80px;
    height: 3px;
    background-color: #fbb710;
    margin-bottom: 15px;
    display: block;
    }
    .product-price{
    font-size: 24px;
    font-weight: 400;
    color: #fbb710;
    line-height: 1;
    margin-bottom: 10px;
    }   
    
    .pagination {
     justify-content: center;
    }
    
    .btn-warning{
        color: white;
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
	<c:import url="../common/myPage.jsp" />
	
       

        <!-- Product Details Area Start -->
        <div class="amado_product_area section-padding-100">
        
            <div class="container-fluid">
            
                <div class="row">
                
                   <div class="col-12">
                   
                     	<div class="single_product_desc">
                     	
	                        <!-- Product Meta Data -->
	                        <div class="product-meta-data">
	                            <div class="line"></div>
	                            <p class="product-price">내 상품</p>
			
	                        </div>
	                        
	                        <br><br><br><br>
                       		                         
                          <div class="container" >
                            <table class="table table-hover " style="width:100%; text-align: center;" id="productList">
                              <tr>
                                  <th width="42.5%">상품명</th>
                                  <th width="7.5%">수량</th>
                                  <th width="12.5%">가격</th>
                                  <th width="15%">대여가능기간</th>                                  
                                  <th width="17.5%">수정/삭제</th>
                              </tr>
                              <c:forEach items="${list }" var="list">
                                <tr><td onclick="location.href='pdetail.do?pno=${list.product_no}'" style="cursor:pointer;"><a href="#" style="font-size: 15px; color: #2a6496;">${list.product_name}</a></td>
                                <td>${list.product_quantity }</td>
                                <td>${list.price }원</td>
                                <td>${list.datecal}<%-- ${list.product_modifydate } --%></td>
                                <td><form action="myproductdelete.do?product_no=${list.product_no}" method="post" onsubmit="return deletecheck();">
                                <button type="button" class="btn btn-warning btn-sm" onclick="location.href='myproductupdateview.do?product_no=${list.product_no}' ">수정</button>&nbsp;
                                <button type="submit" class="btn btn-warning btn-sm" onclick="">삭제</button>
                                </form></td></tr>
                              </c:forEach>
                            </table>                                          
                            <ul class="pagination" style="width:100%;">
                                <c:if test="${pageMaker.prev }">
                                <li class="page-item"><a class="page-link" href="<c:url value="myproductlist.do?page=${pageMaker.startPage-1 }"/>"><i class="fa fa-chevron-left"></i></a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                <li class="page-item"><a class="page-link" href="<c:url value="myproductlist.do?page=${idx }"/>">${idx }</a></li>
                                </c:forEach>
                                <c:if test="${pageMaker.next }">
                                <li class="page-item"><a class="page-link" href="<c:url value="myproductlist.do?page=${pageMaker.endPage+1 }"/>"><i class="fa fa-chevron-right"></i></a></li>
                              </c:if>
                            </ul>
                          </div>  
                          <br>                          
                    	</div> 
                	</div>
            	</div>
        	</div>
    	</div>      
    <!-- Product Details Area End -->      
</div>
<!-- ##### Main Content Wrapper End ##### -->



    <c:import url="../common/footer.jsp" />

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->

        <script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>

        <script src="/billy/resources/js/jquery-ui.js"></script>
        <!-- Popper js -->
        <script src="/billy/resources/js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="/billy/resources/js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="/billy/resources/js/plugins.js"></script>
        
        <script src="/billy/resources/js/active.js"></script>
        <script type="text/javascript">
        function deletecheck(){
			if(confirm("등록한 상품을 삭제 하시겠습니까?")) { 
				alert('상품이 삭제되었습니다.');
            } else {
            	return false;
            }
        }
        
        </script>
        </body>

</html>