<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>쪽지 보내기</title>

<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div id="mmsWrite" style="height:500px;">
					<form>
						<div class="form-group" >
							<label for="name">상품명 : </label> <input type="text"
								class="form-control" name="pname" value="product_name" readonly >
							<label for="recvid">받는 사람 : </label> <input type="text"
								class="form-control" name="recv_id" value="seller_id" readonly style="width: 100px;">
						</div>

						<div class="form-group">
							<label for="content">내용 : </label> <textarea cols="70" rows="6"
								class="form-control" placeholder="반드시 작성해주세요."
								name="mms_content" required></textarea>
						</div>
						<br> <br> <span id="message"></span>
						<button type="submit" class="btn btn-warning btn-block"
							id="mmsWrite" style="color: white">보내기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
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