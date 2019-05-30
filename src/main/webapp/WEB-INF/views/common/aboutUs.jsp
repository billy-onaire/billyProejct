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
	<title>Billy - About us</title>
	<!-- Favicon  -->
	<link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
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
	<link rel="stylesheet" href="/billy/resources/css/aboutUs.css">
</head>

<body>

	<!-- Search Wrapper Area End -->

	<!-- ##### Main Content Wrapper Start ##### -->
	<div class="main-content-wrapper d-flex clearfix">
		<c:import url="../common/nav.jsp" />
		<!-- Product Catagories Area Start -->
		<div id="about-us-main">
			<div class="topcard">
				<div class="about-us-grid1">
					<div class="about-img-box aspect_1_1">
						<img src="/billy/resources/img/aboutUs-img/jungeun.jpg" alt="profile" class="team__profile">
					</div>
						<div class="about_info">
						<p>NAME</p>
						<input type="text" value="안정은" readonly>
						<p>EMAIL</p>
						<input type="text" value="2u3u123@naver.com" readonly>
						<p>PHONE</p>
						<input type="text" value="010-4814-1439" readonly>
						<p>ROLE</p>
						<input type="text" value="예약 관리 페이지 및 결제 기능" readonly>
					</div>
				</div>
				<div class="about-us-grid1">
					<div class="about-img-box aspect_1_1">
						<img src="/billy/resources/img/aboutUs-img/mk.jpg" alt="profile" class="team__profile">
					</div>
						<div class="about_info">
						<p>NAME</p>
						<input type="text" value="정민경" readonly>
						<p>EMAIL</p>
						<input type="text" value="iaminkyung2@gmail.com" readonly>
						<p>PHONE</p>
						<input type="text" value="010-2775-0649" readonly>
						<p>ROLE</p>
						<input type="text" value="메시지 및 채팅 / 챗봇 기능 구현" readonly>
					</div>
				</div>
				<div class="about-us-grid1">
					<div class="about-img-box aspect_1_1">
						<img src="/billy/resources/img/aboutUs-img/sungsu2.jpg" alt="profile" class="team__profile">
					</div>
						<div class="about_info">
								<p>NAME</p>
								<input type="text" value="김성수" readonly>
								<p>EMAIL</p>
								<input type="text" value="fereverv@naver.com" readonly>
								<p>PHONE</p>
								<input type="text" value="010-5550-7623" readonly>
								<p>ROLE</p>
								<input type="text" value="로그인 / 회원가입 / 회원정보수정" readonly>
						</div>
				</div>
			</div>
			<div class="botcard">
				<div class="about-us-grid2">
					<div class="about-img-box aspect_1_1">
						<img src="/billy/resources/img/aboutUs-img/donguk2.jpg" alt="profile" class="team__profile">
					</div>
						<div class="about_info">
								<p>NAME</p>
								<input type="text" value="김동욱" readonly>
								<p>EMAIL</p>
								<input type="text" value="kdw912001@naver.com" readonly>
								<p>PHONE</p>
								<input type="text" value="010-3311-7157" readonly>
								<p>ROLE</p>
								<input type="text" value="상품 관리 / 공지사항 / 프로젝트 총괄" readonly>
						</div>
				</div>
				<div class="about-us-grid2">
					<div class="about-img-box aspect_1_1">
						<img src="/billy/resources/img/aboutUs-img/seokho2.jpg" alt="profile" class="team__profile">
					</div>
						<div class="about_info">
								<p>NAME</p>
								<input type="text" value="윤석호" readonly>
								<p>EMAIL</p>
								<input type="text" value="axlover@hotmail.com" readonly>
								<p>PHONE</p>
								<input type="text" value="010-6227-8508" readonly>
								<p>ROLE</p>
								<input type="text" value="물품 리스트 출력 / 신고 기능" readonly>
						</div>
				</div>
				<div class="about-us-grid2">
					<div class="about-img-box aspect_1_1">
						<img src="/billy/resources/img/aboutUs-img/sunyong.jpg" alt="profile" class="team__profile ">
					</div>
						<div class="about_info">
							<p>NAME</p>
							<input type="text" value="윤선용" readonly>
							<p>EMAIL</p>
							<input type="text" value="ysy9568@naver.com " readonly>
							<p>PHONE</p>
							<input type="text" value="010-2530-6563" readonly>
							<p>ROLE</p>
							<input type="text" value="소셜로그인, 회원관리, 관리자메인" readonly>
						</div>
				</div>
				<div class="about-us-grid2">
					<div class="about-img-box aspect_1_1">
						<img src="/billy/resources/img/aboutUs-img/haneul.jpg" alt="profile" class="team__profile">
					</div>
						<div class="about_info">
							<p>NAME</p>
							<input type="text" value="이하늘" readonly>
							<p>EMAIL</p>
							<input type="text" value="22haneul@naver.com" readonly>
							<p>PHONE</p>
							<input type="text" value="010-9959-0214" readonly>
							<p>ROLE</p>
							<input type="text" value="상품 상세, 리뷰, 상품 관리자페이지 " readonly>
						</div>
				</div>
			</div>
		</div>
		<!-- Product Catagories Area End -->
	</div>
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
	<!--about us img fix js-->
	<script src="/billy/resources/js/aboutUs.js"></script>
</body>

</html>