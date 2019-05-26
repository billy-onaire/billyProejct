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
    <title>공지사항</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
    <!-- Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <!-- Material Icons CSS-->
    <style type="text/css">
        .material-icons {
         font-family: 'Material Icons';
         font-weight: normal;
         font-style: normal;
         font-size: 17px;  /* Preferred icon size 기본 사이즈 24px*/ 
         display: inline-block;
         line-height: 1;
         text-transform: none;
         letter-spacing: normal;
         word-wrap: normal;
         white-space: nowrap;
         direction: ltr;                                                      

         /* Support for all WebKit browsers. */
         -webkit-font-smoothing: antialiased;
         /* Support for Safari and Chrome. */
         text-rendering: optimizeLegibility;

         /* Support for Firefox. */
         -moz-osx-font-smoothing: grayscale;

         /* Support for IE. */
         font-feature-settings: 'liga';
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

                       <!-- <h2>내용이 span</h2>
                       <ul class="list-group">
                        <c:forEach items="${list }" var="list">
                        <li class="list-group-item list-group-item-light">
                            <span class="notice-title" style="width: 50%; height: 35px; display: inline-block;">${list.notice_content }</span>
                            <span class="notice-eye" style="width: 10%; display: inline-block;">
                                <i class="material-icons">
                                   remove_red_eye
                               </i>
                           </span>
                           <span class="notice-file" style="width: 10%; display: inline-block;">
                               <i class="material-icons">
                                   attach_file
                               </i>
                           </span>

                           <span class="notice-date" style="width: 10%;  display: inline-block;">
                            2019.01.02
                        </span>
                        <span class="notice-date" style="width: 10%;  display: inline-block;">
                            관리자
                        </span>
                    </li>
                </c:forEach>
                <li class="list-summary-wrapper">aaa</li>
            </ul> -->


            <!-- <h2>내용이 div</h2> -->
            <ul class="list-group">
                <c:forEach items="${list }" var="list">
                <li class="list-group-item list-group-item-action" style="height: 45px;  ">
                    <div class="notice-title" style="width: 70%; float: left;"><a href="noticedetail.do?notice_no=${list.notice_no }" style="font-size: 20px;">${list.notice_title }</a></div>
                    <div class="notice-eye" style="width: 15%; float: left;">
                        <div>

                            <i class="material-icons" >
                                remove_red_eye                                    
                            </i>
                            <span style="font-size: 15px;">${list.notice_readcount }</span>
                        </div>
                    </div>
                    <div class="notice-file" style="width: 5%; float: left;">
                       	<c:if test="${!empty list.notice_renamefile }">
                        <i class="material-icons">
                            attach_file
                        </i>
                        </c:if>
                    </div>

                    <div class="notice-date clearfix" style="width: 10%;  float: right;">

                        <div style="display: inline-block; line-height: 13px;">
                            <div>
                            <span style="font-size: 12px;">관리자</span>
                            </div>

                            <span style="font-size: 10px;">${list.notice_date }</span>

                        </div>

                    </div>                                    
                </li>
            </c:forEach>            
        </ul>
                        <ul class="pagination" style="margin-left: auto;  margin-right: auto; width:100%;">
                                <c:if test="${pageMaker.prev }">
                                <li class="page-item"><a class="page-link" href="<c:url value="noticelist.do?page=${pageMaker.startPage-1 }"/>"><i class="fa fa-chevron-left"></i></a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                <li class="page-item"><a class="page-link" href="<c:url value="noticelist.do?page=${idx }"/>">${idx }</a></li>
                                </c:forEach>
                                <c:if test="${pageMaker.next }">
                                <li class="page-item"><a class="page-link" href="<c:url value="noticelist.do?page=${pageMaker.endPage+1 }"/>"><i class="fa fa-chevron-right"></i></a></li>
                            </c:if>
                        </ul>
        

                    <div>
                    </div>
                </div>



                <!-- <div class="centertwo">
                  <ul class="pagination">
                                <c:if test="${pageMaker.prev }">
                                <li class="page-item"><a class="page-link" href="<c:url value="noticelist.do?page=${pageMaker.startPage-1 }"/>"><i class="fa fa-chevron-left"></i></a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                <li class="page-item"><a class="page-link" href="<c:url value="noticelist.do?page=${idx }"/>">${idx }</a></li>
                                </c:forEach>
                                <c:if test="${pageMaker.next }">
                                <li class="page-item"><a class="page-link" href="<c:url value="noticelist.do?page=${pageMaker.endPage+1 }"/>"><i class="fa fa-chevron-right"></i></a></li>
                            </c:if>
                        </ul>
                    </div>  -->
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