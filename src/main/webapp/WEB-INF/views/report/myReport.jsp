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
	<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

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
											<option value="1 DESC NULLS LAST">Newest</option>
											<option value="3 NULLS LAST">Price (Low to High)</option>
											<option value="3 DESC NULLS LAST">Price (High to Low)</option>
											<option value="6 DESC NULLS LAST">Popular</option>
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
						<div class="header">REPORT</div>

						<table cellspacing="0">
							<tr>
								<th>Picture</th>
								<th>Name</th>
								<th>Category</th>
								<th>ID</th>
								<th width="230">Contents</th>
							</tr>

							<tr>
								<td><img src="http://lorempixel.com/100/100/people/1" alt="" class="t-img" /></td>
								<td>Jane Doe</td>
								<td>jane.doe@foo.com</td>
								<td>01 800 2000</td>
								<td>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit.</td>
							</tr>
							<c:forEach var="r" items="${mylist}">
								<tr>
									<td><img src="/billy/resources/files/product/${r.first_img}" alt="img" class="t-img" /></td>
									<td>${r.report_no }</td>
									<td><a href="pdetail.do?pno=${r.product_no }">${r.product_no}</a></td>
									<td>${r.report_date }</td>
									<td>${r.report_content}</td>
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
	<!-- Product List js -->

</body>

</html>














<%-- <div class="main-content-wrapper d-flex clearfix">
		<c:import url="../common/nav.jsp" />
		<c:import url="../common/myPage.jsp" />

		<div>
			<table class="type06">
				<tr>
					<th class="even">신고 번호</th>
					<th class="even">물품 번호</th>
					<th class="even">카테고리</th>
					<th class="even">아이디</th>
					<th class="even">신고날짜</th>
				</tr>
				<c:forEach var="r" items="${mylist}">
				<tr>
					<td>${r.report_no }</td>
					<td><a href="pdetail.do?pno=${r.product_no }">${r.product_no}</a></td>
					<td>${r.report_date }</td>
					<td></td>
				</tr>						
			</c:forEach>
			</table>
			
		</div>

	</div> --%>