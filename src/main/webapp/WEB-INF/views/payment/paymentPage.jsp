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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css">
</head>
<body>
<div class="main-content-wrapper d-flex clearfix">
<c:import url='../common/nav.jsp'/>
<c:import url='../common/myPage.jsp'/>
<div class="amado_product_area section-padding-100">
	<div class="invoice-box">
        <table cellpadding="0" cellspacing="0">
            <tr class="top">
                <td colspan="2">
                    <table>
                        <tr>
                            <td class="title">
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
            
            <tr class="information">
                <td colspan="2">
                    <table>
                        <tr>
                            <td>
                                Sparksuite, Inc.<br>
                                12345 Sunny Road<br>
                                Sunnyville, CA 12345
                            </td>
                            
                            <td>
                                Acme Corp.<br>
                                John Doe<br>
                                john@example.com
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="heading">
                <td>
                    Payment Method
                </td>
                
                <td>
                    Check #
                </td>
            </tr>
            
            <tr class="details">
                <td>
                    Check
                </td>
                
                <td>
                    1000
                </td>
            </tr>
            
            <tr class="heading">
                <td>
                    Item
                </td>
                
                <td>
                    Price
                </td>
            </tr>
            
            <tr class="item">
                <td>
                    Website design
                </td>
                
                <td>
                    $300.00
                </td>
            </tr>
            
            <tr class="item">
                <td>
                    Hosting (3 months)
                </td>
                
                <td>
                    $75.00
                </td>
            </tr>
            
            <tr class="item last">
                <td>
                    Domain name (1 year)Domain name (1 year)Domain name (1 year)
                </td>
                
                <td>
                    $10.00
                </td>
            </tr>
            
            <tr class="total">
                <td></td>
                
                <td>
                   Total: $385.00
                </td>
            </tr>
        </table>
</div>
</div>
</div>
<!-- Product Catagories Area End -->
	
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

<c:import url="../common/footer.jsp" />
<input type='button' onclick='bb();' value='payment'/>
<!-- bootPay -->    
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.0.min.js" type="application/javascript"></script>
<script src='${ pageContext.request.contextPath }/resources/js/bootpaySource.js' type="application/javascript"></script>
<script type='text/javascript' src='${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.3.1.min.js'></script>

<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.3.1.min.js"></script>
	<!-- Popper js -->
	<script src="${ pageContext.request.contextPath }/resources/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="${ pageContext.request.contextPath }/resources/js/plugins.js"></script>
	<!-- Active js -->
	<script src="${ pageContext.request.contextPath }/resources/js/active.js"></script>
</body>
</html>