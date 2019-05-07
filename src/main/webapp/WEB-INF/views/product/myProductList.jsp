<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" >
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>상품수정</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

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
                       		
                          <div>
                            <table class="table" style="width:800px">
                              <tr>
                                <tr>
                                  
                              </tr>
                              
                                <tr><td>1번상품</td><td>1</td><td>10000</td><td>19-04-17</td><td>19-04-17</td><td>수정/삭제</td></tr>
                                <tr><td>1번상품</td><td>1</td><td>10000</td><td>19-04-17</td><td>19-04-17</td><td>수정/삭제</td></tr>
                                <tr><td>1번상품</td><td>1</td><td>10000</td><td>19-04-17</td><td>19-04-17</td><td>수정/삭제</td></tr>
                                <tr><td>1번상품</td><td>1</td><td>10000</td><td>19-04-17</td><td>19-04-17</td><td>수정/삭제</td></tr>
                              
                              
                            </table>
                          </div>
                          <hr>
                          <div>
                            <table class="table" style="width:800px">
                              <tr>
                                  <th width="40%">상품명</th>
                                  <th width="7.5%">수량</th>
                                  <th width="10%">가격</th>
                                  <th width="15%">등록일자</th>
                                  <th width="15%">수정일자</th>
                                  <th width="12.5%">수정/삭제</th>
                              </tr>
                              <c:forEach items="${list }" var="list">
                                <tr><td>${list.product_name}</td><td>${list.product_quantity }</td><td>${list.price }</td><td>${list.product_date }</td><td>${list.product_modifydate }</td><td>수정/삭제</td></tr>
                                
                              
                              </c:forEach>
                            </table>
                          </div>
                          <hr>
                          <div>
                            <table class="table" style="width:800px">
                              <tr>
                                  <th width="40%">상품명</th>
                                  <th width="7.5%">수량</th>
                                  <th width="10%">가격</th>
                                  <th width="15%">등록일자</th>
                                  <th width="15%">수정일자</th>
                                  <th width="12.5%">수정/삭제</th>
                              </tr>
                              <c:forEach items="${list }" var="list">
                                <tr><td>${list.product_name}</td><td>${list.product_quantity }</td><td>${list.price }</td><td>${list.product_date }</td><td>${list.product_modifydate }</td><td>수정/삭제</td></tr>
                                
                              
                              </c:forEach>
                            </table>
                          </div>   
                          <br>
                             <ul class="btn-group pagination">
							    <c:if test="${pageMaker.prev }">
							    <li>
							        <a href='<c:url value="/billy/myproductlist.do?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
							    </li>
							    </c:if>
							    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							    <li>
							        <a href='<c:url value="/billy/myproductlist.do?page=${idx }"/>'><i class="fa">${idx }</i></a>
							    </li>
							    </c:forEach>
							    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
							    <li>
							        <a href='<c:url value="/billy/myproductlist.do?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
							    </li>
							    </c:if>
							</ul>

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

        <script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>

        <script src="/billy/resources/js/jquery-ui.js"></script>
        <!-- Popper js -->
        <script src="/billy/resources/js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="/billy/resources/js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="/billy/resources/js/plugins.js"></script>
        
        </body>

</html>