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
    /*.line{
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
    
    .center {
      margin: auto;
      width: 90%;
      
      padding: 10px;
    }
    .centertwo {
      margin: auto;
      width: 60%;
      
      padding: 10px;
    }*/
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

        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
        
            <div class="container-fluid">
            
                <div class="row">
                
                   <div class="col-12">
                   
                        <div class="single_product_desc">
                        
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">공지사항</p>
            
                            </div>
                            
                            <br><br><br><br>
                                                     
                           <div class="container">

                                 <h2>List Group With Contextual Classes</h2>
  <ul class="list-group">
    <li class="list-group-item list-group-item-success">Success item</li>
    <li class="list-group-item list-group-item-secondary">Secondary item</li>
    <li class="list-group-item list-group-item-info">Info item</li>
    <li class="list-group-item list-group-item-warning">Warning item</li>
    <li class="list-group-item list-group-item-danger">Danger item</li>
    <li class="list-group-item list-group-item-primary">Primary item</li>
    <li class="list-group-item list-group-item-dark">Dark item</li>
    <li class="list-group-item list-group-item-light">Light item</li>
    <li class="list-summary-wrapper">aaa</li>
  </ul>
                            <div>
                            </div>
                           </div>



                          <div class="centertwo">
                          <ul class="pagination">
                                <!-- <c:if test="${pageMaker.prev }">
                                <li class="page-item"><a class="page-link" href="<c:url value="myproductlist.do?page=${pageMaker.startPage-1 }"/>"><i class="fa fa-chevron-left"></i></a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                <li class="page-item"><a class="page-link" href="<c:url value="myproductlist.do?page=${idx }"/>">${idx }</a></li>
                                </c:forEach>
                                <c:if test="${pageMaker.next }">
                                <li class="page-item"><a class="page-link" href="<c:url value="myproductlist.do?page=${pageMaker.endPage+1 }"/>"><i class="fa fa-chevron-right"></i></a></li>
                                </c:if> -->
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