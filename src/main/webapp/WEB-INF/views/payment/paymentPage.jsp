<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYMENT PAGE</title>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.0.min.js" type="application/javascript"></script>
<script type='text/javascript' src='${ pageContext.request.contextPath }/resources/js/jquery/jquery-2.2.4.min.js'></script>
<script src='${ pageContext.request.contextPath }/resources/js/bootpaySource.js' type="application/javascript"></script>
</head>
<body>
<h1>결제페이지</h1>
<input type='button' onclick='bb();' value='payment' class="btn amado-btn mb-15"/>
<form action='resultPay.do' method='post'>

</form>
</body>
</html>