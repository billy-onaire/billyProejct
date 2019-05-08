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
.button {
  background-color: #fab336; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  margin-left: 35px;
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


</style>
<script type="text/javascript">
/* update 클릭 */ 
 $('#update').on('click',function(){ }); 
 
 /* 삭제 클릭 */ 
 $('#delete').on('click',function(){ 
	 
	 
 });


</script>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="mmsWrite">
				<!-- 보낸 편지함 기준 -->  
					<table class="board_view"> 

					<colgroup> 
						<col width="20%"/> 
						<col width="20%"/> 
						<col width="20%"/> 
						<col width="40%"/> 
					</colgroup> 

				<br>
				<br>
						<tbody> 
						<c:if test="${sent_id eq testmk }">
				<tr> 
					<th scope="row">상품명</th> 
					<td>${list.product_name }</td> 
					<th scope="row">받는사람</th> 
					<td>${list.recv_id}</td> 
				</tr> 
				<tr></tr>
				<tr> 
				<th scope="row">작성일</th> 
				<td ><fmt:formatDate value="${list.sent_date }" pattern="yyyy-MM-dd"/></td> 
				<th scope="row">읽음 여부</th> 
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
				<td colspan="4" style="border: 1px solid #ccc; height : 100px; width : 350px;">${list.mms_content }</td> 
				</tr> 
				
					</c:if>
					<c:if test="${sent ne testmk }">
					<tr> 
					<th scope="row">상품명</th> 
					<td>${list.product_name }</td> 
					<th scope="row">보낸사람</th> 
					<td>${list.sent_id}</td> 
				</tr> 
				<tr></tr>
				<tr> 
				<th scope="row">작성일</th> 
				<td colspan=3"><fmt:formatDate value="${list.sent_date }" pattern="yyyy-MM-dd KK:mm:ss "/></td> 
				<td></td>
				</tr>  
				<tr>
				<td colspan="4" style="border: 1px solid #ccc; height : 100px; width : 350px;">${list.mms_content }</td> 
				</tr> 
				</c:if>
						</tbody> 
					</table>
					
					

						<br> <span id="message"></span>
						
							<input type="button" class="button" id="update" value="답장하기" > 
							<input type="button" class="button" id="delete" value="삭제하기">
						
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