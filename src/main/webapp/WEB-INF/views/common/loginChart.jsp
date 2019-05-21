<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<title>차트적용</title>
</head>
<body>
<div id="login-chart" style="height:250px; width: 100%">로그인차트</div>

</body>
<script type="text/javascript">
new Morris.Bar({
	element: 'login-chart',
	data: [
		{x: '2011 Q1', y: 0},
	    {x: '2011 Q2', y: 1},
	    {x: '2011 Q3', y: 2},
	    {x: '2011 Q4', y: 3},
	    {x: '2012 Q1', y: 4},
	    {x: '2012 Q2', y: 5},
	    {x: '2012 Q3', y: 6},
	    {x: '2012 Q4', y: 7},
	    {x: '2013 Q1', y: 8}
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
</html>