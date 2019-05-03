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
	                        
	                        <br><br><br>
	                        <div class="container"> 
  <div class="table-responsive">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>#</th>
          <th>FirstnameFirstnameFirstnameFirstnameFirstname</th>
          <th>Lastname</th>
          <th>Age</th>
          <th>City</th>
          
         
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>Anna</td>
          <td>Pitt</td>
          <td>35</td>
          <td>New York</td>
          <td>USA</td>
          
        </tr>
      </tbody>
    </table>
  </div>
</div>
<br>
                            <div class="container"> 
  <div class="table-responsive">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>d</th>
          <th>FirstnameFirstnameFirstnameFirstnameFirstname</th>
          <th>Lastname</th>
          <th>Age</th>
          <th>City</th>
          
         
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>Anna</td>
          <td>Pitt</td>
          <td>19-04-05</td>
          <td>New York</td>
          <td>USA</td>
          
        </tr>
      </tbody>
    </table>
  </div>
</div>
                       		
                            <div style="overflow-x:auto;">
  <table>
    <tr>
      <tr>
                                                <th width="50%">productname</th>
                                                <th width="10%">quantity</th>
                                                <th width="10%">price</th>
                                                <th width="15%">enroll</th>
                                                <th width="15%">update/delete</th>
                                            </tr>
    </tr>
    <tr>
      <tr><td>1번상품</td><td>1</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>2상품</td><td>2</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>3상품</td><td>3</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>4상품</td><td>4</td><td>19-04-17</td><td>2</td></tr>
    </tr>
    <tr>
      <tr><td>1번상품</td><td>1</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>2상품</td><td>2</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>3상품</td><td>3</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>4상품</td><td>4</td><td>19-04-17</td><td>2</td></tr>
    </tr>
    <tr>
     <tr><td>1번상품</td><td>1</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>2상품</td><td>2</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>3상품</td><td>3</td><td>19-04-17</td><td>2</td></tr>
                                            <tr><td>4상품</td><td>4</td><td>19-04-17</td><td>2</td></tr>
    </tr>
  </table>
</div>
<div class="container">

 

  <div class="board">

    <div class="board-heading row">

      <div class="col-sm-1 hidden-xs text-center">번호</div>

      <div class="col-sm-5 col-sx-12 text-center">제목</div>

      <div class="col-sm-2 hidden-xs text-center">이름</div>

      <div class="col-sm-2 hidden-xs text-center">날짜</div>

      <div class="col-sm-2 hidden-xs text-center">조회</div>

    </div>

 

    <ul class="list-unstyled">

 

      <li class="row board-row">

        <div class="col-sm-1 hidden-xs text-center">0001</div>

        <div class="col-sm-5 col-xs-12">부트스트랩 테마</div>

        <span class="visible-xs">

          <span>아무개</span><span>2017.09.27</span><span class="pull-right">300</span>

        </span>

        <div class="col-sm-2 hidden-xs text-center">아무개</div>

        <div class="col-sm-2 hidden-xs text-center">2017.09.20</div>

        <div class="col-sm-2 hidden-xs text-center">300</div>

      </li>

  <hr class="half-rule">

      <li class="row board-row">

        <div class="col-sm-1 hidden-xs text-center">0002</div>

        <div class="col-sm-5">부트스트랩 테마</div>

        <span class="visible-xs">

          <span>아무개</span><span>2017.09.27</span><span class="pull-right">300</span>

        </span>

        <div class="col-sm-2 hidden-xs text-center">아무개</div>

        <div class="col-sm-2 hidden-xs text-center">2017.09.20</div>

        <div class="col-sm-2 hidden-xs text-center">500</div>

      </li>

  <hr class="half-rule">

    </ul>

  </div>

</div>
				            <div class="container">
				                <!-- <div class="row">
				                    <div class="col-12 col-lg-20"> -->
                                    <!-- 영어나 숫자만 있을 땐 반응형이 잘 적용되는데  -->
                                    <div class="table-responsive">
                                    <table class="table">
				                        <thead>
				                            <!-- <tr>
				                                <th width="300px">상품명</th>
				                                <th width="100px">수량</th>
				                                <th width="100px">가격</th>
				                                <th width="100px">상품등록일</th>
				                                <th width="150px">수정/삭제</th>
				                            </tr> -->
                                            <!-- <tr>
                                                <th width="50%">productname</th>
                                                <th width="10%">quantity</th>
                                                <th width="10%">price</th>
                                                <th width="15%">enroll</th>
                                                <th width="15%">update/delete</th>
                                            </tr> -->
                                            <!-- <tr>
                                                <th>상품명상품명상품명</th>
                                                <th>수량</th>
                                                <th>가격</th>
                                                <th>상품등록일</th>
                                                <th>수정/삭제</th>
                                            </tr> -->
				                        </thead>
				                        <tbody>
				                            <tr><td>1번상품</td><td>1</td><td>19-04-17</td><td>2</td></tr>
				                            <tr><td>2상품</td><td>2</td><td>19-04-17</td><td>2</td></tr>
				                            <tr><td>3상품</td><td>3</td><td>19-04-17</td><td>2</td></tr>
				                            <tr><td>4상품</td><td>4</td><td>19-04-17</td><td>2</td></tr>
				                        </tbody>
				                    </table>
				                    </div>     
                                    <!-- </div>                           
				                 </div> -->
				            </div>
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