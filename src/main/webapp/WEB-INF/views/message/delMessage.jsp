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
<script>
$(document).ready(function(){ 
	/* 게시글 제목 클릭 상세보기 */ 
	$('.cart_product_desc').on('click',function(){ 
		var popUrl = "messageDetail.do?mms_no="+$(this).attr('id');	
		//팝업창에 출력될 페이지 URL 
		var popOption = "width=450, height=500, resizable=no, scrollbars=no, status=no;"; 
		//팝업창 옵션(optoin) 
		window.open(popUrl,"",popOption); 
		
	});
});
</script>
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
.centertwo {
      margin: auto;
      width: 60%;     
      padding: 10px;
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
	<c:import url='../common/myPage.jsp'/>       
        <div class="amado_product_area section-padding-100">
            <div class="container-fluid" style="padding-left: 40px;">
                <div class="row">
                    <div class="col-12">
                    <!-- 쪽지 보내기 팝업창 연습 -->
                    	<a href="#" onclick="javascript:insertPopup();">쪽지보내기</a>
                        <div class="view d-flex">
                             <button class="tablinks" onclick="location.href='recvList.do'">받은쪽지함</button>
                             <button class="tablinks" onclick="location.href='sentList.do'">보낸쪽지함</button>
                             <button class="tablinks active" onclick="location.href='delList.do'">삭제쪽지함</button>
                        </div>
                    </div>
                </div>
        <br>
        <br>
        <br>
                    
                    <div class="container-fluid" style="padding-left: 40px;">    <!-- amado_product_area에서 컨테이너검색 -->
                        <div class="cart-table clearfix" >                         
                            <div id="tab3" class="tabcontent" >
                                <table class="table table-responsive">
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>받은 사람/<br>보낸 사람</th>
                                            <th>상품명</th>                                            
                                            <th style="width: 200px">제목</th>
                                            <th>받은날짜</th>
                                            <th>복구/<br>삭제</th>         
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${delList }" var="delmms">
                                        <tr>
                                            <td class="cart_product_img">
                                            <c:if test="${loginMember.user_id eq delmms.sent_id }" >
                                            ${delmms.recv_id }
                                            </c:if>
                                            <c:if test="${loginMember.user_id eq delmms.recv_id }" >
                                            ${delmms.sent_id }
                                            </c:if>
                                            </td>
                                             <td class="cart_product_img">
                                            	${delmms.product_name }
                                            </td>
                                            <td class="cart_product_desc" id="${delmms.mms_no }" >
                                                ${delmms.mms_title}
                                            </td>
                                            <td class="price">
                                                <fmt:formatDate value="${delmms.sent_date }" pattern="yyyy-MM-dd"/> 
                                            </td>
                                            <td class="cart_product_img">
                                              	<button type="button" class="btn btn-warning btn-sm" onclick="location.href='messageToOrigin.do?mms_no=${delmms.mms_no}'">복구</button>
                                              	&nbsp;
                                              	<button type="button" class="btn btn-warning btn-sm" onclick="location.href='deleteMessage.do?mms_no=${delmms.mms_no}'">삭제</button>

                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>                             
                        </div>                                 

                    </div>

           			<div class="centertwo">
                          <ul class="pagination">
                                <c:if test="${pageMakerMms.prev }">
                                <li class="page-item"><a class="page-link" href="<c:url value="delList.do?page=${pageMakerMms.startPage-1 }"/>"><i class="fa fa-chevron-left"></i></a></li>
                                </c:if>
                                <c:forEach begin="${pageMakerMms.startPage }" end="${pageMakerMms.endPage }" var="idx">
                                <li class="page-item"><a class="page-link" href="<c:url value="delList.do?page=${idx }"/>">${idx }</a></li>
                                </c:forEach>
                                <c:if test="${pageMakerMms.next }">
                                <li class="page-item"><a class="page-link" href="<c:url value="delList.do?page=${pageMakerMms.endPage+1 }"/>"><i class="fa fa-chevron-right"></i></a></li>
                            	</c:if>
                            </ul>
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