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
<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
});
</script>
<!-- CSS -->
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/pForm/util.css">
	<link rel="stylesheet" type="text/css" href="${ pageContext.request.contextPath }/resources/css/pForm/main.css">
<!--===============================================================================================-->

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
	var sss = '${check}';
	console.log('check : ' + sss);
	//prev btn
	var showPrev = '${ pageMaker.prev }';
	console.log(showPrev);
	if(showPrev)
		$('#page-prev').addClass('disabled');
	//next btn
	var showNext = '${ pageMaker.next }';
	if(showNext)
		$('#page-next').addClass('disabled');
	
	var nowPage = '${ pageMaker.cri.page }';
	$('#page'+nowPage).addClass('active');
	
	//판매중내역 이동
	$('#sellList').click(function() {
		location.href = 'chargeWating.do';
	});//click
		
	// 결제정보 전역변수로 뽑기
	var tr = $('#pList');
	var td = tr.children();
	
	var payNno = tr.find('td:nth-child(2)').html();
	var seller = tr.find('td:nth-child(3)').html();
	var goods = tr.find('td:nth-child(4)').html();
	var cost = tr.find('td:nth-child(6)').html();
	
	//결제확인창 띄우는 js
	$('.view').click(function() {
		console.log('.view cilck function is started');
		console.log('payno : ' + payNno + ', seller : ' + seller + ', goods : ' + goods + ', cost : ' + cost);
		
		console.log('text : ' + tr.text());
		$('input[name=payment_no]').val(payNno);
		$('input[name=seller_id]').val(seller);
		$('input[name=product_name]').val(goods);
		$('input[name=payment_price]').val(cost);
		$('.limiter').show();
	});
	//부트페이 실행
	$('#doPayment').click(function() {
		console.log('#doPayment cilck function is started');
		console.log('payno : ' + payNno + ', seller : ' + seller + ', goods : ' + goods + ', cost : ' + cost);
		
		var payNoArr = {
			price: $('input[name=payment_price]').val(),
			name: $('input[name=product_name]').val(),
			item_name: $('input[name=product_name]').val(),
			no: $('input[name=payment_no]').val()
		}
		var jsonPayInfo = JSON.stringify(payNoArr);
		var payPrice = payNoArr.price.split('₩'); //₩ 제거
		console.log(payPrice[0]);
		$.ajax({
			url: 'doPayment.do',
			data: jsonPayInfo,
			contentType: 'application/json; charset=utf-8',
			cache: 'false',
			type: 'post',
			success: function() {
				console.log('성공!');
					console.log('그냥 되는거야?');
					BootPay.request({
						price: payPrice[0], //실제 결제되는 가격
						application_id: "5cc01b9c396fa67735bd0665",
						name: payNoArr.name, //결제창에서 보여질 이름
						/*pg: 'inicis',*/
						//method: 'phone', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
						show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
						items: [
							{
								item_name: '나는 아이템', //상품명
								qty: 1, //수량
								unique: '123', //해당 상품을 구분짓는 primary key
								price: 1000, //상품 단가
								cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
								cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
								cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
							}
						],
						user_info: {
							username: '사용자 이름',
							email: '2u3u123@naver.com',
							addr: '사용자 주소',
							phone: '010-1234-4567'
						},
						order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
						params: {callback1: BootPay.method, callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
						account_expire_at: '2019-05-04', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
						extra: {
						    start_at: '2018-10-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
							end_at: '2021-10-10', // 정기결제 만료일 -  기간 없음 - 무제한
					        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
					        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
						}
					}).error(function (data) {
						//결제 진행시 에러가 발생하면 수행됩니다.
						console.log(data);
					}).cancel(function (data) {
						//결제가 취소되면 수행됩니다.
						var no = $('input[name=payment_no]').val();
						var job = new Object();
						job.no = no;
						$.ajax({
							url: 'dontwantpay.do',
							data: JSON.stringify(job),
							contentType: 'application/json; charset=utf-8',
							type: 'post',
							cache: false,
							success: function(result) {
								alert('결제가 취소되었습니다');
							}
						});//ajax
						$('.limiter').hide();
						console.log(data);
					}).ready(function (data) {
						// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
						console.log(data);
					}).confirm(function (data) {
						//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
						//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
						console.log(data);
						var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
						if (enable) {
							this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
						} else {
							this.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
						}
					}).close(function (data) {
					    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
					    $('.limiter').hide();
					    console.log(data);
					}).done(function (data) {
						//결제가 정상적으로 완료되면 수행됩니다
						//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
						console.log('done 함수');
						var email = '${ loginMember.email }';
						var pname = $('input[name=product_name]').val();
						var price = $('input[name=payment_price]').val();
						var job = new Object();
						job.email = email;
						job.pname = pname;
						job.price = price;
						$.ajax({
							url: 'sendInvoiceEmail.do',
							data: JSON.stringify(job),
							contentType: 'application/json; charset=utf-8',
							type: 'post',
							cache: false,
							success: function(result) {
								alert('결제가 완료되었습니다');
							}
						});//ajax
						$('.limiter').hide();
						console.log(data);
					});
				/* } */
			}
		});
		
	});
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
function closeWindow() {
	$('.limiter').hide();
}
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
						<a id='sellList' class="btn btn-primary"><i class='material-icons'>payment</i><span>판매중 내역</span></a>
						<!-- <i class="material-icons">&#xE863;</i>  -->
						<!-- <a href="#" class="btn btn-info"><i class="material-icons">&#xE24D;</i> <span>Export to Excel</span></a> -->
					</div>
                </div>
            </div>

			<div class="table-filter">
				<div class="row">
                    <div class="col-sm-3">
						<div class="view-product d-flex align-items-center">
							<span class="filter-icon"><i class="fa fa-filter"></i></span>&nbsp;&nbsp;
							<select class="form-control" name='entries' id='entries'>
								<option value='5'>5</option>
								<option value='10'>10</option>
								<option value='15'>15</option>
								<option value='20'>20</option>
							</select>
							<span></span>
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
                    </div>
                </div>
			</div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                    	<th></th>
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
                		<td>${ (status.index + 1) }</td>
                		<td>${ payment.payment_no }</td>
                		<td class='sellerId'>${ payment.seller_id }</td>
                		<td class='productName-Je'>${ payment.product_name }</td>
                		<c:if test='${ payment.status eq 3 }'>
                			<td><span class="status text-warning">&bull;</span> 구매중</td>
                			<td class='goPriceJe'>${ payment.payment_price }₩</td>
                			<td>&nbsp;</td>
                		</c:if>
                		<c:if test='${ payment.status eq 4 }'>
                			<td><span class="status text-warning">&bull;</span> 구매중</td>
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
                            			<a class='page-link' href='paymentWaiting.do${ pageMaker.makeSearchUri(pageMaker.startPage-1) }' ><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a>
                            		</li>
                            	<c:forEach begin='${ pageMaker.startPage }' end='${ pageMaker.endPage }' var='idx'>
                            		<li class='page-item' id='page${ idx }'>
                            			<a class='page-link' href='paymentWaiting.do${ pageMaker.makeSearchUri(idx) }'>${ idx }.</a>
                            		</li>
                            	</c:forEach>
                            	<c:if test='${ pageMaker.next && pageMaker.endPage > 0 }'>
                            		<li class='page-item' id='page-next'>
                            			<a class='page-link' href='paymentWaiting.do${ pageMaker.makeSearchUri(pageMaker.endPage+1) }'><i class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a>
                            		</li>
                            	</c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>     
</div>
<!-- 결제확인 div -->
<div id='paymentConfirm-Je'>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-160 p-t-50">
				<div class="login100-form validate-form">
					<span class="login100-form-title p-b-43">
						CHECKOUT
					</span>
					
					<div class="wrap-input100 rs1 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" name="payment_no" readonly>
						<span class="label-input100">No.</span>
					</div>
					
					
					<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
						<input class="input100" type="text" name="seller_id" readonly>
						<span class="label-input100">판매자</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="text" name="product_name" readonly>
						<span class="label-input100">물품</span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="text" name="payment_price" readonly>
						<span class="label-input100">가격</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id='doPayment'>
							결제
						</button>
					</div>
					
					<div class="text-center w-full p-t-23">
						<a href='javascript:void(0)' onclick='closeWindow();'class="txt1">
							창 닫기
						</a>
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


<!--===============================================================================================-->
	<script src="${ pageContext.request.contextPath }/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${ pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${ pageContext.request.contextPath }/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${ pageContext.request.contextPath }/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${ pageContext.request.contextPath }/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->    
</html>