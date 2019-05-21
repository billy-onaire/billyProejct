<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Billy - main</title>
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
		<div id="login-chart" style="height:250px; width: 800px">로그인차트</div>
	</div>
	<c:import url="common/footer.jsp" />
	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	new Morris.Bar({
		element: 'login-chart',
		data: [
			{x: '2011', y: 2},
		    {x: '2011', y: 4},
		    {x: '2011', y: 3},
		    {x: '2011', y: 2},
		    {x: '2012', y: 1},
		    {x: '2012', y: 7},
		    {x: '2012 ', y: 8},
		    {x: '2012 ', y: 6},
		    {x: '2013 ', y: 5}
		],
		xkey: 'x',
		  ykeys: ['y'],
		  labels: ['Y'],
		  barColors: function (row, series, type) {
		    if (type === 'bar') {
		      var red = Math.ceil(255 * row.y / this.ymax);
		      return 'rgb(' + red + ',0,0)';
		    }
		    else {
		      return '#000';
		    }
		  }
	});
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