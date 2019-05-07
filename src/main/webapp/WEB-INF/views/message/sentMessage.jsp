<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Title  -->
<title>Billy</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">
<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
<!-- Message List js -->
<script src="/billy/resources/js/messageList.js"></script>
<style type="text/css">
.amado_product_area .container-fluid .row .col-12 .view>.tablinks {
	border: none;
	outline: none;
	padding: 10px 16px;
	background-color: #f1f1f1;
	cursor: pointer;
}

.amado_product_area .container-fluid .row .col-12 .view>.tablinks.active
	{
	background-color: #fab336;
	color: white;
}


</style>

<body>
	<!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
    </div>
    <!-- Search Wrapper Area End -->
<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">
	<c:import url="../common/nav.jsp" />
        <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">하위 카테고리 추가 예정</h6>

            </div>

            <!-- ##### Single Widget ##### -->
            <div class="widget brands mb-50">
             
            </div>


            <!-- ##### Single Widget ##### -->
            <div class="widget price mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">마이페이지</h6>
            </div>
        </div>

        <div class="amado_product_area section-padding-100">
            <div class="container-fluid" style="padding-left: 40px;">
                <div class="row">
                    <div class="col-12">
                    <!-- 쪽지 보내기 팝업창 연습 -->
                    	<a href="#" onclick="javascript:insertPopup();">쪽지보내기</a>
                        <div class="view d-flex">
                                    <button class="tablinks active" onclick="openTab(event, 'tab1'); location.href='recvList.do'">받은 쪽지함</button>
                                    <button class="tablinks" onclick="openTab(event, 'tab2'); location.href='sentList.do'">보낸 쪽지함</button>
                                    <button class="tablinks" onclick="openTab(event, 'tab3')">삭제한 쪽지함</button>
                        </div>
                    </div>
                </div>
        <br>
        <br>
        <br>
                    
                    <div class="container-fluid" style="padding-left: 40px;">    <!-- amado_product_area에서 컨테이너검색 -->
                        <div class="cart-table clearfix" style="padding-left: 40px;">
                            <div id="tab1" class="tabcontent" style="display: block;">
                                <table class="table table-responsive">
                              
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>보낸 사람</th>
                                            <th>상품명</th>
                                            <th style="width: 200px">내용</th>
                                            <th>날짜</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${recvList }" var="mms">                                                                 
                                        <tr>
                                            <td class="cart_product_img">
                                                ${mms.sent_id }
                                            </td>
                                            <td class="cart_product_img">
                                            	    확인중
                                            </td>
                                            <td class="cart_product_desc">
                                                ${mms.mms_content }
                                            </td>
                                            <td class="price">
                                            <!-- 여기서는 날짜만 표시하고 상세보기에서 시간까지 표시 -->
                                            <fmt:formatDate value="${mms.sent_date }" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td class="cart_product_img">
                                                ${mms.recv_read }
                                            </td>
                                        </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>

                             <div id="tab2" class="tabcontent" style="display: none;">
                                <table class="table table-responsive">
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>받은 사람</th>
                                            <th>상품명</th>
                                            <th style="width: 200px">내용</th>
                                            <th>날짜</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${sentList }" var="sentmms">
                                        <tr>
                                            <td class="cart_product_img">
                                               ${sentmms.recv_id }
                                            </td>
                                            <td class="cart_product_img">
                                                	product_name
                                            </td>
                                            <td class="cart_product_desc">
                                                ${sentmms.mms_content }
                                            </td>
                                            <td class="price">
                                            	<fmt:formatDate value="${sentmms.sent_date }" pattern="yyyy-MM-dd"/>                                                
                                            </td>
                                            <td class="cart_product_img">
                                                ${sentmms.recv_read }
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div> 
                            <div id="tab3" class="tabcontent" style="display: none;">
                                <table class="table table-responsive">
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>받은 사람/보낸 사람</th>                                            
                                            <th style="width: 200px">내용</th>
                                            <th>날짜</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="cart_product_img">
                                                user01
                                            </td>
                                            <td class="cart_product_desc">
                                                네고 되나요?
                                            </td>
                                            <td class="price">
                                                2019-04-24
                                            </td>
                                            <td class="cart_product_img">
                                                읽음
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>                             
                        </div>                                 

                    </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <li class="page-item active"><a class="page-link" href="#">01.</a></li>
                                <li class="page-item"><a class="page-link" href="#">02.</a></li>
                                <li class="page-item"><a class="page-link" href="#">03.</a></li>
                                <li class="page-item"><a class="page-link" href="#">04.</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
   <c:import url="../common/footer.jsp" />
    

   

   <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
	<!-- Popper js -->
	<script src="/billy/resources/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="/billy/resources/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="/billy/resources/js/plugins.js"></script>
	<!-- Active js -->
	<script src="/billy/resources/js/active.js"></script>
    <!-- Product List js -->
    <script src="/billy/resources/js/productList.js"></script>

</body>

</html>