<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<!-- Title  -->
	<title>Billy 빌리</title>

	<!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">

	<!-- Core Style CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
	<link rel="stylesheet" href="/billy/resources/css/core-style.css">
	<link rel="stylesheet" href="/billy/resources/css/product-list.css">
	<link rel="stylesheet" href="/billy/resources/css/table.css">
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
		<c:import url="../common/nav.jsp" />
		<c:import url="../common/myPage.jsp" />

		<div class="amado_product_area section-padding-100">
			<div class="container-fluid">

				<div class="row">
					<div class="col-12">
						<div class="product-topbar d-xl-flex align-items-end justify-content-between">
							<div class="product-sorting d-flex">
								<div class="sort-by-date d-flex align-items-center mr-15">
									<p>조회 선택</p>
									<form id="sortForm" method="get">
										<select name="select">
											<option value="1">내가 신고한 내역</option>
											<option value="2">누군가 나를 신고한 내역</option>
										</select>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Single Products-->
				<div>
					<div class="table-users">
						<div class="header">신고 내역</div>

						<table cellspacing="0" id="table_report1">
							<tr>
								<th>상품</th>
								<th>상품 명</th>
								<th>카테고리</th>
								<th>아이디</th>
								<th>관리자 승인여부</th>
								<th width="230">내용</th>
							</tr>

							
							<c:forEach var="r" items="${mylist}">
								<tr>
									<td><a href="pdetail.do?pno=${r.product_no }"><img src="/billy/resources/files/product/${r.first_img}" alt="img" class="t-img" /></a></td>
									<td><a href="pdetail.do?pno=${r.product_no }">${r.product_name}</a></td>
									<td>
										<c:choose>
											<c:when test="${r.rcategory_no == 1}"> <a href="pdetail.do?pno=${r.product_no }">부적절한 이미지인 경우</a> </c:when>
											<c:when test="${r.rcategory_no == 2}"> <a href="pdetail.do?pno=${r.product_no }">욕설 및 스팸 게시물인 경우 </a></c:when>
											<c:when test="${r.rcategory_no == 3}"> <a href="pdetail.do?pno=${r.product_no }">거래 시간 미준수한 경우 </a></c:when>
											<c:when test="${r.rcategory_no == 4}"> <a href="pdetail.do?pno=${r.product_no }">사진과 상이한 물품의 품질인 경우 </a></c:when>
											<c:when test="${r.rcategory_no == 5}"> <a href="pdetail.do?pno=${r.product_no }">거래 시 욕설 또는 협박을 한 경우 </a></c:when>
											<c:when test="${r.rcategory_no == 6}"> <a href="pdetail.do?pno=${r.product_no }">기타</a> </c:when>
										</c:choose>
									</td>
									<td>${r.report_id }</td>
									<td>
										<c:choose>
											<c:when test="${r.report_progress eq 'Y'}">승인 완료</c:when>
											<c:when test="${r.report_progress eq 'N'}">승인 거부</c:when>
											<c:when test="${r.report_progress eq 'M'}">승인 대기중</c:when>
										</c:choose>
									</td>
									<td>${r.report_content}</td>
								</tr>
							</c:forEach>
						</table>

						<table cellspacing="0" id="table_report2">
							<tr>
								<th>상품</th>
								<th>상품 명</th>
								<th>카테고리</th>
								<th>아이디</th>
								<th>관리자 승인여부</th>
								<th width="230">내용</th>
							</tr>
	
								
								<c:forEach var="s" items="${slist}">
									<tr>
										<td><a href="pdetail.do?pno=${s.product_no }"><img src="/billy/resources/files/product/${s.first_img}" alt="img" class="t-img" /></a></td>
										<td><a href="pdetail.do?pno=${s.product_no }">${s.product_name}</a></td>
										<td>
											<c:choose>
												<c:when test="${s.rcategory_no == 1}"> <a href="pdetail.do?pno=${s.product_no }">부적절한 이미지인 경우</a> </c:when>
												<c:when test="${s.rcategory_no == 2}"> <a href="pdetail.do?pno=${s.product_no }">욕설 및 스팸 게시물인 경우 </a></c:when>
												<c:when test="${s.rcategory_no == 3}"> <a href="pdetail.do?pno=${s.product_no }">거래 시간 미준수한 경우 </a></c:when>
												<c:when test="${s.rcategory_no == 4}"> <a href="pdetail.do?pno=${s.product_no }">사진과 상이한 물품의 품질인 경우 </a></c:when>
												<c:when test="${s.rcategory_no == 5}"> <a href="pdetail.do?pno=${s.product_no }">거래 시 욕설 또는 협박을 한 경우 </a></c:when>
												<c:when test="${s.rcategory_no == 6}"> <a href="pdetail.do?pno=${s.product_no }">기타</a> </c:when>
											</c:choose>
										</td>
										<td>${s.report_id }</td>
										<td>
											<c:choose>
												<c:when test="${r.report_progress eq 'Y'}">승인 완료</c:when>
												<c:when test="${r.report_progress eq 'N'}">승인 거부</c:when>
												<c:when test="${r.report_progress eq 'M'}">승인 대기중</c:when>
											</c:choose>
										</td>
										<td>${s.report_content}</td>
									</tr>
								</c:forEach>
							</table>
					</div>

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
		</div>
	</div>
	<!-- ##### Main Content Wrapper End ##### -->
	<!-- 신고 기능 테스트 용-->
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
	<!-- myReport js -->
	<script src="/billy/resources/js/myReport.js"></script>
</body>

</html>

