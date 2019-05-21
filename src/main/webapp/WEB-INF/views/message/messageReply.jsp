<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>쪽지 보내기</title>

<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script src="/billy/resources/js/messageList.js"></script>
<script type="text/javascript">

function checkContent(){
	var mms_content = $("#mms_content").val();
	if(!(mms_content.length >= 1)){
		alert("반드시 내용을 입력 해주세요.");
		$("#mms_content").select();
		return false;
	}
}

 function popupClose(form) {

    
    form.submit();

} 
</script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="mmsReply" style="height:500px;">
					<form action="insertReply.do" method="post" >
					<input type="hidden" id="product_no" name="product_no" value="${m.product_no }">
						<div class="form-group" >
							<label for="name">상품명 : </label> <input type="text"
								class="form-control" name="pname" value="${m.product_name} " readonly >
							<label for="recvid">받는 사람 : </label> <input type="text"
								class="form-control" name="recv_id" id="recv_id" value="${m.recv_id }" readonly style="width: 100px;">
							보내는 사람 : <input type="hidden" id="user_id" name="sent_id" value="${loginMember.user_id }">
							<input type="hidden" id="mms_no" name="mms_no" value="${m.mms_no }">
						</div>

						<div class="form-group">
							<label for="title">제목 : </label> <input type="text" 
								class="form-control" placeholder="반드시 작성해주세요." id="mms_title" value="Re: ${m.mms_title }"
								name="mms_title" required>
							<label for="content">내용 : </label> <textarea cols="70" rows="6"
								class="form-control" placeholder="반드시 작성해주세요." id="mms_content"
								name="mms_content" required></textarea>
						</div>
						
						<input type="submit" class="btn btn-warning btn-block"
							id="mmsReply" style="color: white" value="보내기" >
							<input type="button" class="btn btn-warning btn-block"
							id="mmsReply" style="color: white" onclick="window.close()" value="취소">
					</form>
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