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
<link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script>
$(document).ready(function(){ 
	/* 게시글 제목 클릭 상세보기 */ 
	$('.cart_product_desc').on('click',function(){ 
		var popUrl = "messageDetail.do?mms_no="+$(this).attr('id');	
		//팝업창에 출력될 페이지 URL 
		var popOption = "width=500, height=500, resizable=no, scrollbars=no, status=no;"; 
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

		<!-- <a href="mmsSocket.do">웹소켓</a> -->
        <div class="amado_product_area section-padding-100">
            <div class="container-fluid" style="padding-left: 40px;">
                <div class="row">
                    <div class="col-12">
                        <div class="view d-flex">
                                    <button class="tablinks active" onclick="location.href='recvList.do'" id="recv">받은쪽지함</button>
                                    <button class="tablinks" onclick="location.href='sentList.do'" id="sent">보낸쪽지함</button>
                                    <button class="tablinks" onclick="location.href='delList.do'" id="del">삭제쪽지함</button>
                        </div>
                    </div>
                </div>
        <br>
        <br>
        <br>
                    
                    <div class="container-fluid" style="padding-left: 40px;">    <!-- amado_product_area에서 컨테이너검색 -->
                        <div class="cart-table clearfix" >
                            <div id="tab1" class="tabcontent" style="display: block;">
                                <table class="table table-striped table-hover">
                              
                                    <thead>
                                        <tr>
                                            <th>보낸 사람</th>
                                            <th>상품명</th>
                                            <th style="width: 300px">제목</th>
                                            <th>발송일</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${recvList }" var="mms">                                                                 
                                        <tr>
                                    
                                            <td class="cart_product_img">
                                               ${mms.sent_id }
                                            </td>
                                            <td class="cart_product_img" >
                                            	${mms.product_name }
                                            </td>
                                            <td class="cart_product_desc" id="${mms.mms_no }" style="cursor:pointer;">
                                                ${mms.mms_title }
                                            </td>
                                            <td class="price">
                                            <!-- 여기서는 날짜만 표시하고 상세보기에서 시간까지 표시 -->
                                            <fmt:formatDate value="${mms.sent_date }" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td class="cart_product_img">
                                            <c:if test="${mms.recv_read eq 'N'}">
                                            	<span style="color: red;">읽지 않음 </span>
                                            </c:if>
                                            <c:if test="${mms.recv_read eq 'Y'}">
                                            	읽음
                                            </c:if>
                                            </td>
                                        </tr>
										</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            </div>                             
                        </div>                                 

                    </div>

                
   				<div class="row">
                    <div class="col-12">
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                            		<li class='page-item' id='page-prev'>
                            			<a class="page-link" href="<c:url value="recvList.do?page=${pageMakerMms.startPage-1 }"/>"><i class="fa fa-chevron-left"></i></a>
                            		</li>
                            	<c:forEach begin="${pageMakerMms.startPage }" end="${pageMakerMms.endPage }" var="idx">
                            		<li class='page-item' id='page${ idx }'>
                            			<a class="page-link" href="<c:url value="recvList.do?page=${idx }"/>">${idx }</a>
                            		</li>
                            	</c:forEach>
                            	<c:if test="${pageMakerMms.next }">
                            		<li class='page-item' id='page-next'>
                            			<a class='page-link' href="<c:url value="recvList.do?page=${pageMakerMms.endPage+1 }"/>"><i class="fa fa-chevron-right"></i></a>
                            		</li>
                            	</c:if>
                                <!-- <li class="page-item active"><a class="page-link" href="#">01.</a></li>
                                <li class="page-item"><a class="page-link" href="#">02.</a></li>
                                <li class="page-item"><a class="page-link" href="#">03.</a></li>
                                <li class="page-item"><a class="page-link" href="#">04.</a></li> -->
                            </ul>
                        </nav>
                    </div>
                </div> 
                          <br> 
            </div>
        </div>
<!-- <script>
/* var socket = null;
/* $(document).ready(function(){
	connectWS();
}); */
/*
function connectWS(){
	//var wsUri = "ws://localhost:8888/billy/mmsSocket.do";
	var ws = new WebSocket("ws://localhost:8888/billy/mmsSocket.do");
	//socket = ws;
	
	ws.onopen = function () {
	    console.log('Info: connection opened.');
	    
	    ws.onmessage = function (event) {
		    console.log("ReceiveMessage : ", evt.data+'\n');
		};
	    
	};
	
	ws.onclose = function (event) { 
		console.log('Info: connection closed.'); 
		/* setTimeout( function(){ connect(); }, 1000); // retry connection!! */
	};
	ws.onerror = function (err) { console.log('Error :', err); };
	
	ws.onopen = function () {
	    console.log('Info: connection opened.');
	    
	};
	
} */

</script> -->

<script>
/* $('#btnSend').on('click', function(event) {
	alert("확인");
	event.preventDefault();
	if (socket.readyState !== 1) return;
		  let msg = $('input#msg').val();
		  socket.send(msg);
	});
	
	 connectWS();  */
	 
/* (function poll() {
		    $.ajax({
		        url: '/api/',
		        type: 'GET',
		        dataType: 'json',
		        success: function() {
		            alert('확인!');
		        },
		        timeout: 3000,
		        complete: setTimeout(function() { poll(); }, 6000)
		    })
		})(); */

</script>
  
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

</body>

</html>