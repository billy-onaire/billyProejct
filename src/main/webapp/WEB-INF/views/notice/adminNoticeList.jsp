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
	.btn-warning{
        color: white;
     }


* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: white;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #fbb710;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}

.nice-select{
	height: 47px;
}

.pagination  {
   justify-content: center;
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
    <c:import url="../common/adminNav.jsp" />

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
                    <form class="example" action="adminnoticelist.do" style="margin:auto;" onsubmit="return validate();">
		<div style=" ">
		  <select class="form-control" id="select" name="select" style="height:47px;">
    			<option value='title' >제목</option>
				<option value='content'>내용</option>
				<option value='title_content'>제목+내용</option>
		  </select>
  		</div>
  		<div style=" display:inline-block; ">
		  <input type="text" placeholder="Search.." name="keyword" id="keyword">
		  <button type="submit"><i class="fa fa-search"></i></button>
		</div>
		</form>

            <ul class="list-group">
                <c:forEach items="${list }" var="list">
                <li class="list-group-item list-group-item-action" style="height: 45px;  ">
                    <div class="notice-title" style="width: 70%; float: left;"><a href="adminnoticedetail.do?notice_no=${list.notice_no }&select=${select}&keyword=${keyword}" style="font-size: 20px;">${list.notice_title }</a></div>
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
        <ul class="pagination" style="width:100%;">
                                <c:if test="${pageMaker.prev }">
                                	<li class="page-item"><a class="page-link" href="<c:url value="adminnoticelist.do?page=${pageMaker.startPage-1 }&select=${select }&keyword=${keyword }"/>"><i class="fa fa-chevron-left"></i></a></li>
                                </c:if>
                                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                                <li class="page-item"><a class="page-link" href="<c:url value="adminnoticelist.do?page=${idx }&select=${select }&keyword=${keyword }"/>">${idx }</a></li>
                                </c:forEach>
                                <c:if test="${pageMaker.next }">
                                	<li class="page-item"><a class="page-link" href="<c:url value="adminnoticelist.do?page=${pageMaker.endPage+1 }&select=${select }&keyword=${keyword }"/>"><i class="fa fa-chevron-right"></i></a></li>
                            	</c:if>
                        </ul>
        				
        				
                    <div>
                    </div>
		  <button class="btn btn-warning" onclick="location.href='noticewriteview.do' ">작성</button>                    
                    
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
<script src="/billy/resources/js/active.js"></script>
</body>

</html>