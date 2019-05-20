<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap Order Details Table with Search Filter</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
<!-- CSS -->
<link href='${ pageContext.request.contextPath }/resources/css/paymentPaylist.css' rel='stylesheet'/>
<link href='${ pageContext.request.contextPath }/resources/css/core-style.css' rel='stylesheet'/>
<link href='${ pageContext.request.contextPath }/resources/css/style.css' rel='stylesheet'/>
<!-- the end of the CSS -->
<!-- bootPay -->    
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.0.min.js" type="application/javascript"></script>
<script src='${ pageContext.request.contextPath }/resources/js/bootpaySource.js' type="application/javascript"></script>
<script type='text/javascript' src='${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.3.1.min.js'></script>
<script type="text/javascript">
$(function(){
	setPageEntry();
	setSearchType();
	//prev btn
	var showPrev = '${ pageMaker.prev }';
	if(showPrev !== 'true')
		$('#page-prev').addClass('disabled');
	//next btn
	var showNext = '${ pageMaker.next }';
	if(showNext !== 'true')
		$('#page-next').addClass('disabled');
	
	var nowPage = '${ pageMaker.cri.page }';
	$('#page'+nowPage).addClass('active');
	
	var data = {"price": $('.goPriceJe').val(), "sellerId": $('.sellerId').val()};
	console.log('data : ' + data);
	$('.view i').click(function() {
		$.ajax({
			url: 'resultPay.do',
			type: 'post',
			cache: 'false',
			dataType: 'json',
			data: data,
			success: function() {
				alert("dk!");
			}//success
		});//ajax
	});
	console.log('${ payment.payment_price }');
});//ready
function setPageEntry(){
	var perPageNum = '${ pageMaker.cri.perPageNum }';
	var $entries = $("#entries");
	var nowPage = '${ pageMaker.cri.page }';
	console.log(nowPage);
	console.log(perPageNum);
	$entries.val(perPageNum).prop('selected', true);
	$entries.on('change', function(){
		location.href = 'paymentWaiting.do?page=' + nowPage + '&perPageNum=' + $entries.val();
	})//change
}// paging function
function setSearchType() {
	var $searchTypeBox = $('#searchType');
	var $keyword = $('#keywordInput');
	console.log($keyword.val());
	$searchTypeBox.val('${ pageMaker.cri.searchType }').prop('selected', true);
	
	$('#idSearch').click(function() {
		console.log($('#keywordInput').val());
		var url = 'paymentWaiting.do?page=1' + '&perPageNum=' + '${ pageMaker.cri.perPageNum }'
		+ '&searchType=' + $searchTypeBox.val()
		+ '&keyword=' + encodeURIComponent($keyword.val());
		location.href = url;
	})//click
}//search function
</script>
</head>
<body id='paylistbody'>
<div class="main-content-wrapper d-flex clearfix">
<c:import url='../common/nav.jsp'/>
<c:import url='../common/myPage.jsp'/>
<div class="amado_product_area section-padding-100">
    <div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-4">
						<h2><b>구매대기</b> 내역</h2><!-- bookingPage.do -->
					</div>
					<div class="col-sm-8">						
						<a id='sellList' class="btn btn-primary"><i class='material-icons'>payment</i><span>판매 내역</span></a>
						<button onclick='bb();' class="btn btn-primary"><i class='material-icons'></i><span>부트페이</span></button>
						<!-- <i class="material-icons">&#xE863;</i>  -->
						<!-- <a href="#" class="btn btn-info"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a> -->
					</div>
                </div>
            </div>
			<div class="table-filter">
				<div class="row">
                    <div class="col-sm-3">
						<div class="show-entries">
							<span>Show</span>
							<select class="form-control" name='entries' id='entries'>
								<option value='5'>5</option>
								<option value='10'>10</option>
								<option value='15'>15</option>
								<option value='20'>20</option>
							</select>
							<span>entries</span>
						</div>
					</div>
                    <div class="col-sm-9">
						<button type="button" class="btn btn-primary" id='idSearch'><i class="fa fa-search"></i></button>
						<div class="filter-group">
							<!-- <label>ID</label> -->
							<input type="text" class="form-control" name='keyword' value='${ pageMaker.cri.keyword }' id='keywordInput'>
						</div>
						
						<div class="filter-group">
							<label></label>
							<select class="form-control" name='searchType' id='searchType'>
								<option value='seller_id'>ID</option>
							</select>
						</div>
						<span class="filter-icon"><i class="fa fa-filter"></i></span>
                    </div>
                </div>
			</div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>no</th>
                        <th>판매자</th>
						<th>제목</th>				
                        <th>거래상태</th>
                        <th>가격</th>						
						<th>결제하기</th>
                    </tr>
                </thead>
                <tbody id='pList'>
                <c:forEach items='${ pmList }' var='payment' varStatus='status'>
                	<tr>
                		<td>${ payment.customer }</td>
                		<td>${ payment.payment_no }</td>
                		<td class='sellerId'>${ payment.seller_id }</td>
                		<td>${ payment.product_name }</td>
                		<c:if test='${ payment.status eq 3 }'>
                			<td><span class="status text-info">&bull;</span> 구매중</td>
                			<td class='goPriceJe'>${ payment.payment_price }₩</td>
                			<td><div class="view" title="View Details" data-toggle="tooltip"><i class="material-icons">&#xE5C8;</i></div></td>
                		</c:if>
                	</tr>
                </c:forEach>
                </tbody>
            </table>
             <div class="row">
                    <div class="col-12">
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                            		<li class='page-item' id='page-prev'>
                            			<a class='page-link' href='paymentWaiting.do${ pageMaker.makeSearchUri(pageMaker.startPage-1) }' ><i class="fa fa-chevron-left"></i></a>
                            		</li>
                            	<c:forEach begin='${ pageMaker.startPage }' end='${ pageMaker.endPage }' var='idx'>
                            		<li class='page-item' id='page${ idx }'>
                            			<a class='page-link' href='paymentWaiting.do${ pageMaker.makeSearchUri(idx) }'>${ idx }.</a>
                            		</li>
                            	</c:forEach>
                            	<c:if test='${ pageMaker.next && pageMaker.endPage > 0 }'>
                            		<li class='page-item' id='page-next'>
                            			<a class='page-link' href='paymentWaiting.do${ pageMaker.makeSearchUri(pageMaker.endPage+1) }'><i class="fa fa-chevron-right"></i></a>
                            		</li>
                            	</c:if>
                                <!-- <li class="page-item active"><a class="page-link" href="#">01.</a></li>
                                <li class="page-item"><a class="page-link" href="#">02.</a></li>
                                <li class="page-item"><a class="page-link" href="#">03.</a></li>
                                <li class="page-item"><a class="page-link" href="#">04.</a></li> -->
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>     
</div>
</div>
<c:import url="../common/footer.jsp" />
</body>                  		             
<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
<!-- Popper js -->
<script src="${ pageContext.request.contextPath }/resources/js/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
<!-- Plugins js -->
<script src="${ pageContext.request.contextPath }/resources/js/plugins.js"></script>
<!-- Active js -->
<script src="${ pageContext.request.contextPath }/resources/js/active.js"></script>               
</html>