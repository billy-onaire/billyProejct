<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
dontent="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Billy - main</title>
<style type="text/css">
#logoimg{
}
</style>
<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
});//ready 
</script>
<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
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
							<input type="search" name="search" id="search"
								placeholder="Type your keyword...">
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
		<c:import url="common/adminNav.jsp" />
		<div class="container text-center">
			<div><img src="${ pageContext.request.contextPath }/resources/img/core-img/admin.PNG" id="logoimg" width="300" height="200"></div>
			<div id="login-chart" style="height:300px; width: 550px; float:left;"><i class="fas fa-chart-bar" style="font-size:30px;"></i>방문자수</div>
			<div id="signup-chart" style="height:300px; width: 550px; float:left;"><i class="fas fa-chart-bar" style="font-size:30px;"></i>회원가입수</div>
		</div>
	</div>
	<c:import url="common/footer.jsp" />
	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	$(function(){
		var morrisData = [];
		var morrisData2 = []; 
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth()+1;
		var yyyy = today.getFullYear();
		if(dd<10){
			dd='0'+dd
		}
		if(mm<10){
			mm='0'+mm
		}
		today = yyyy+'/'+mm+'/'+dd;
		console.log(today);
		$.ajax({
			url: "loginVisit.do",
			data: {today : today},
			type: "post",
			dataType: "json",
			success: function(obj){
				console.log("obj값 : " + obj);
				var objStr = JSON.stringify(obj);
				var jsonObj = JSON.parse(objStr);
				console.log("jsonObj : " + jsonObj);
				
				for(var i in jsonObj.list){
					morrisData.push({'날짜':jsonObj.list[i].date,'방문자':jsonObj.list[i].count,'회원가입수':jsonObj.list[i].scount});					
					morrisData2.push({'날짜':jsonObj.list[i].date,'회원가입수':jsonObj.list[i].scount});					
				}
				new Morris.Bar({
					element: 'login-chart',
					data: 	morrisData,
					  xkey: '날짜',
					  ykeys: ['방문자'],
					  labels: ['방문자'],
					  barColors: function(row, series, type){
						  if(type === 'bar'){
							  return  'rgb(39, 231, 198)';
						  }else{
							  return '#000';
						  }
					  }
				});
				
				new Morris.Bar({
				 	element: 'signup-chart',
					data: morrisData2,
					  xkey: '날짜',
					  ykeys: ['회원가입수'],
					  labels: ['회원가입수'],
					  barColors: function(row, series, type){
						  if(type === 'bar'){
							  return  'rgb(154, 231, 198)';
						  }else{
							  return '#000';
						  }
					  }
				});
			},error: function(request, status, errorData){
				console.log("error code : " + request.status
						+ "\nmessage : " + request.responseText
						+ "\nerror : " + errorData);
			}
		});//ajax
	});//ready
	</script>
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