<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAYMENT PAGE</title>
<!-- CSS -->
<link rel='stylesheet' href='${ pageContext.request.contextPath }/resources/css/paymentInvoice.css'>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/paymentConfirm.css">
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
<!-- jquery -->
<script src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
</script>
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
                                Invoice #: ${ payment.payment_no }<br>
                                <!-- Created: 2019. 05월 10일<br> -->
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
                                	Billy™<br>
                                	서울시 강남구 역삼로 3030<br>
                                	Billy빌딩 12345호
                            </td>
                            
                            <td>
                                	Billy Corp.<br>
                                	안 정 은<br>
                                	billy@billy.com
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr class="heading">
                <td>
                    	결제 방법 
                </td>
                
                <td>
                    	카드결제
                </td>
            </tr>
            
            <tr class="details">
                <td>
                    	카드
                </td>
                
                <td>
                    	${ payment.payment_price }₩
                </td>
            </tr>
            
            <tr class="heading">
                <td>
                    Item
                </td>
                
                <td>
                    Info.
                </td>
            </tr>
            
            <tr class="item">
                <td>
                    ${ payment.product_name }
                </td>
                
                <td id='costperday'>
                    ${ payment.payment_price }₩
                </td>
            </tr>
            
            <tr class="item">
                <td>
                   판매자
                </td>
                
                <td>
                    ${ payment.seller_id }님
                </td>
            </tr>
            
            <tr class="item last">
                <td>
                    구매자
                </td>
                
                <td>
                    ${ payment.customer }님
                </td>
            </tr>
            
            <tr class="total">
                <td></td>
                
                <td>
                   Total: ${ payment.payment_price }원
                </td>
            </tr>
        </table>
</div>
</div>
</div>

<c:import url="../common/footer.jsp" />
<input type='button' onclick='bb();' value='payment'/>
<input type='button' onclick='bbb();' value='reservation'/>
</body>

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

<script type="text/javascript">
/**
 *  bootpay 연동 소스
 */
function bb() {
	
	
BootPay.request({
	price: '${payment.payment_price}', //실제 결제되는 가격
	application_id: "5cc01b9c396fa67735bd0665",
	name: '블링블링 마스카라', //결제창에서 보여질 이름
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
    console.log(data);
}).done(function (data) {
	//결제가 정상적으로 완료되면 수행됩니다
	//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
	console.log(data);
});
}
</script>
</html>