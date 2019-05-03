<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYMENT PAGE</title>
<!-- CSS -->
<link rel='stylesheet' href='${ pageContext.request.contextPath }/resources/css/paymentInvoice.css'>
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
</head>
<body>
<h1>결제페이지</h1>
<div class="main-content-wrapper d-flex clearfix">
	<c:import url="../common/nav.jsp" />
 <div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="titleInvoice">
                                <img src='${ pageContext.request.contextPath }/resources/img/core-img/billylogo7.jpg' style="width:100%; max-width:200px;">
                            </td>
                            
                            <td>
                                Invoice #: 123<br>
                                Created: January 1, 2015<br>
                                Due: February 1, 2015
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="informationInvoice">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                Billy, TM.<br>
                                12345 Sunny Road<br>
                                Sunnyville, CA 12345
                            </td>
                            
                            <td>
                                Billy-onaire™.<br>
                                	안 정 은<br>
                                billy_onaire@or.kr
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="headingInvoice">
                <td>
                    Payment Method
                </td>
                
                <td>
                    Check #
                </td>
            </tr>
            
            <tr class="detailsInvoice">
                <td>
                    Check
                </td>
                
                <td>
                    1000
                </td>
            </tr>
            
            <tr class="headingInvoice">
                <td>
                    Item
                </td>
                
                <td>
                    Price
                </td>
            </tr>
            
            <tr class="itemInvoice">
                <td>
                   t org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:806)
	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1498)
	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)at org.apache.tomcat.util.threads.TaskThread$Wrappi
                </td>
                
                <td>
                    30.000₩
                </td>
            </tr>
            
            <tr class="itemInvoice">
                <td>
                    대여 (3일)
                </td>
                
                <td>
                    7.000₩
                </td>
            </tr>
            
            <tr class="itemInvoice last">
                <td>
                    Domain name (1 year)
                </td>
                
                <td>
                    $10.00
                </td>
            </tr>
            
            <tr class="totalInvoice">
                <td></td>
                
                <td>
                   Total: $385.00
                   
                </td>
            </tr>
        </table>
</div>
<%-- <c:url var='pri' value='resultPay.do'>
	<c:param name='payment' value='${ payment }' />
</c:url> --%>
<%-- <table>
<h6>
<tr>
	<td>순번</td>
	<td>결제번호</td>
	<td>가격</td>
	<td>수량</td>
	<td>물품</td>
	<td>아이디</td>
</tr>
<c:forEach items='${ pmList }' var='payment' varStatus='status'>
<tr>
	<td>${ status.count }</td>
	<td>${ payment.payment_no } </td>
	<td>${ payment.payment_price }</td>
	<td>${ payment.payment_quantity }</td>
	<td>${ payment.product_no }</td>
	<td>${ payment.customer }</td>
</tr>
</c:forEach>
</h6>
</table> --%>
</div>
      <c:import url="../common/footer.jsp" />
      <input type='button' onclick='bb();' value='payment'"/>

   

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
    <!-- Product List js -->
    <script src="/billy/resources/js/productList.js"></script>

<!-- bootPay -->    
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.0.min.js" type="application/javascript"></script>
<script src='${ pageContext.request.contextPath }/resources/js/bootpaySource.js' type="application/javascript"></script>

<script type='text/javascript' src='${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.3.1.min.js'></script>
</body>
</html>