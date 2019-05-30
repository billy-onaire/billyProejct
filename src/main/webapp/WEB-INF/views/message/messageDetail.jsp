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
<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
<!-- Message List js -->
<script src="/billy/resources/js/messageList.js"></script>
<style type="text/css">
.button {
  background-color: #fab336; /* Green */
  border: none;
  color: white;
  padding: 13px 28px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
}

.button:hover {
  background-color: #f9a406;
}

#mmswrite{
	margin-left: 10px;
}


</style>

<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="mmsWrite">
				<form action="mmsReply.do" method="post">
						<input type="hidden" id="mms_no" name="mms_no" value="${list.mms_no }">
						<input type="hidden" id="product_no" name="product_no" value="${list.product_no }">
						<input type="hidden" id="product_name" name="product_name" value="${list.product_name }">
						<input type="hidden" id="recv_id" name="recv_id" value="${list.recv_id }">
						<input type="hidden" id="sent_id" name="sent_id" value="${list.sent_id }">
						<input type="hidden" id="mms_title" name="mms_title" value="${list.mms_title }">
					<!-- <form role="form" method="get" autocomplete="off">
					</form> -->
				<!-- 보낸 편지함 기준 -->  
					<table class="board_view"> 

				 	<colgroup> 
						<col width="20%"/> 
						<col width="20%"/> 
						<col width="20%"/> 
						<col width="50%"/> 
					</colgroup> 
				<br>
				<br>
				
						<tbody> 
						<c:if test="${list.recv_id eq  loginMember.user_id   }">
				<tr> 
					<th scope="row">보낸사람</th> 
					<td>${list.recv_id}</td> 
					<th scope="row">상품명</th> 
					<td>${list.product_name }</td> 					
				</tr> 
				<tr></tr>
				<tr> 
				<th scope="row">작성일</th> 
				<td><fmt:formatDate value="${list.sent_date }" pattern="yyyy-MM-dd"/></td> 
				<th scope="row">읽음여부</th> 
				<td>
				<c:if test="${list.recv_read eq 'Y'}">
                       	<fmt:formatDate value="${list.read_date }" pattern="yyyy-MM-dd KK:mm:ss"/>
                 </c:if> 
                <c:if test="${list.recv_read eq 'N'}">
                 	읽지 않음
                 </c:if>
				</td>
				<td></td>
				</tr>
				<tr>
				<th>제&nbsp;&nbsp;&nbsp;목</th>
				<td colspan="4"> ${list.mms_title }</td>
				</tr>  
				<tr>
				<td colspan="4" style="border: 1px solid #ccc; height : 100px; width : 350px;">${list.mms_content }</td> 
				</tr>
					
					</c:if>
					
					<c:if test="${list.sent_id eq  loginMember.user_id  }">
				<tr> 
					<th scope="row">받는사람</th> 
					<td>${list.recv_id}</td> 
					<th scope="row">상품명</th> 
					<td>${list.product_name }</td> 
				</tr> 
				<tr></tr>
				<tr> 
				<th scope="row">작성일</th> 
				<td><fmt:formatDate value="${list.sent_date }" pattern="yy-MM-dd KK:mm:ss "/>&nbsp;&nbsp;</td> 
				<th scope="row">읽음여부</th> 
				<td>
				<c:if test="${list.recv_read eq 'Y'}">
                       	<fmt:formatDate value="${list.read_date }" pattern="yy-MM-dd KK:mm:ss"/>
                 </c:if> 
                <c:if test="${list.recv_read eq 'N'}">
                 	읽지 않음
                 </c:if>
				</td>
				<td></td>
				</tr>
				<tr>
				<th>제&nbsp;&nbsp;&nbsp;목</th>
				<td colspan="4"> ${list.mms_title }</td>
				</tr> 
				<tr>
				<td colspan="4" style="border: 1px solid #ccc; height : 100px; width : 350px;">${list.mms_content }</td> 
				</tr> 
				
					
				
				</c:if>					
						</tbody> 
					</table>
					
					<br> 
					<c:if test="${list.sent_id eq  loginMember.user_id  }">		
					<div style="width: 100%; text-align:center;">
					<div style="display: inline-block; width:65%">
						<input type="submit" class="button" id="back" value="뒤로가기" onclick="self.close();" style="margin-right: 15px;"> 	
						<input type="button" class="button" id="delete" value="삭제하기">
					</div>
					</div>
					</c:if>
					
					<c:if test="${list.recv_id eq  loginMember.user_id  }">
					<div style="width: 100%; text-align:center;">
					<div style="display: inline-block; width:65%">
						<input type="submit" class="button" id="reply" value="답장하기" style="margin-right: 15px;"> 
						<input type="button" class="button" id="delete" value="삭제하기" >
					</div>
					</div>
					</c:if>					
						</form>
					
	
					<br>
<script>
$(function(){
	 $('#delete').on('click',function(){ 
		var session = "${loginMember.user_id}" //로그인한 사람
		var sid = "${list.sent_id}";
		var rid = "${list.recv_id}";
		console.log(session + ", " + sid + ", " + rid);
		 var num = "${list.mms_no}"
		 if(confirm("삭제하시겠습니까?")){
			 if(sid == session){
				 location.href="messageToDelSent.do?mms_no=" + num; 
					
				 window.opener.document.location.href = window.opener.document.URL;
			 }
			 else if(rid == session){
				 location.href="messageToDelRecv.do?mms_no=" + num; 
					
				 window.opener.document.location.href = window.opener.document.URL;
			 }

		 }
		 
	 });
});

$(function(){ 
	console.log("${list.sent_id}");
	console.log($("#mms_no").val());
	console.log("${list.product_name}");
	/* 메세지 답변 */ 
	$('#reply').on('click',function(){ 
		/* var sendData = {
				mms_no : $("#mms_no").val(),
				product_name : $("#product_name").val(),
				recv_id : $("#id").val()	
		}; */
		var recv_id = "${list.sent_id}";
		console.log($("#mms_no").val());
		//location.href="mmsReply.do?mms_no=${list.mms_no}&product_name=${list.product_name}&recv_id=${list.sent_id}";
		location.href="mmsReply.do?message=${list}";
		
	 /* $.ajax({
		url: "mmsReply.do",
		type: "GET",
		data: recv_id,
		dataType: "json",
		success: function(data){
			var jsondata = JSON.stringify(data);

			alert(jsondata);
			
		},
		error: function(){
			alert("에러납니다");
		}
	}); */	//ajax 닫기 

	}); //클릭 펑션 닫기
});
											
</script>
				</div>
			</div>
		</div>
	</div>
	
	
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