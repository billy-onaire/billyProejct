<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<!-- Title  -->
	<title>Billy - main</title>
	<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function () {
			'<c:if test="${loginMember.social_type eq 'google' or loginMember.social_type eq 'kakao' or loginMember.social_type eq 'naver' or loginMember.social_type eq 'facebook'}">'
			var sid = "${loginMember.social_code}";

			$.ajax({
				url: "socialCheck.do",
				data: {
					sid: sid
				},
				type: "post",
				dataType: "json",
				success: function (result) {
					if (result.hashMap.fail == "fail") {
						location.href = "socialEnroll.do";
					}
				}, error: function (request, status, errorData) {
					console.log("error code : " + request.status
						+ "\nmessage : " + request.responseText
						+ "\nerror : " + errorData);
				}
			});//ajax
			'</c:if>'
		});//ready 
	</script>
	<!-- Favicon  -->
	<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="/billy/resources/css/core-style.css">
	<link rel="stylesheet" href="/billy/resources/css/table.css">
	<link rel="stylesheet" href="/billy/resources/css/adminReport.css">
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
							<button type="submit">
								<img src="/billy/resources/img/core-img/search.png" alt="">
							</button>
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
		<!-- Product Catagories Area Start -->
		<div class="amado_product_area section-padding-100">
			<div class="container-fluid">
				<div class="table-users">
					<div class="header">REPORT</div>

					<table cellspacing="0" id="adminTable">
						<tr>
							<th>신고 번호</th>
							<th>카테고리</th>
							<th>내용</th>
							<th>신고 계정</th>
							<th>신고일</th>
							<th>물품 번호</th>
							<th>요청 아이디</th>
							<th width="230">승인</th>
						</tr>
					</table>
				</div>
				<div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                            </ul>
                        </nav>
                    </div>
                </div>
			</div>
			<!-- Product Catagories Area End -->
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
		<!-- adminReport js-->
		<script src="/billy/resources/js/adminReport.js"></script>
</body>

</html>