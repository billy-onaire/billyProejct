<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
/* update 클릭 */ 
 $('#update').on('click',function(){ }); 
 
 /* 삭제 클릭 */ 
 $('#delete').on('click',function(){ });


</script>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="mmsWrite" style="height:500px;">
				<c:forEach items="${list }" var="mms">
				<!-- 보낸 편지함 기준 -->  
						<div class="form-group" >
							<label for="name">상품명 : </label> <input type="text"
								class="form-control" name="pname" value="${list.product_name }" readonly >
							<label for="sentid">보낸 사람 : </label> <input type="text"
								class="form-control" name="recv_id" value="${list.sent_id }" readonly style="width: 100px;">
							<label for="sentid">보낸 시간 : </label> <input type="text"
								class="form-control" name="recv_id" value="${list.sent_date }" readonly style="width: 100px;">
									
								<input type="hidden" value="${list.mms_no }">
						</div>

						<div class="form-group">
							<label for="content">내용 : </label> <textarea cols="70" rows="6"
								class="form-control" id="mms_content"
								name="mms_content" value="${list.mms_content }"></textarea>
						</div>
				</c:forEach>
						<br> <br> <span id="message"></span>
						<input type="button" class="btn btn-warning btn-block"
							id="update" style="color: white"  value="답장하기" >
							<input type="button" class="btn btn-warning btn-block"
							id="delete" style="color: white"  value="삭제하기">
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