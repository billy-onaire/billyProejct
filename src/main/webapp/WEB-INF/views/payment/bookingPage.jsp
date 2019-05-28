<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title>Material Bootstrap Wizard by Creative Tim</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

	<link rel="apple-touch-icon" sizes="76x76" href="${ pageContext.request.contextPath }/resources/js/bookf/img/apple-icon.png" />
	<link rel="icon" type="image/png" href="${ pageContext.request.contextPath }/resources/js/bookf/img/favicon.png" />

	<!--     Fonts and icons     -->
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
	<link href="${ pageContext.request.contextPath }/resources/js/bookf/bootstrap.min.css" rel="stylesheet" />
	<link href="${ pageContext.request.contextPath }/resources/js/bookf/material-bootstrap-wizard.css" rel="stylesheet" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="${ pageContext.request.contextPath }/resources/js/bookf/demo.css" rel="stylesheet" />
	<style type="text/css">
		.modal {
			display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
	</style>
</head>
<script src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	 $('#myModal').show();
	//날짜 계산
	var endDate = $('#ed').val() instanceof Date ? $('#ed').val() : new Date($('#ed').val());
	var beginDate = $('#bd').val() instanceof Date ? $('#bd').val() : new Date($('#bd').val());
	
	endDate = new Date(endDate.getFullYear(), endDate.getMonth()+1, endDate.getDate());
	beginDate = new Date(beginDate.getFullYear(), beginDate.getMonth()+1, beginDate.getDate());
	
	var result = Math.abs(endDate.getTime() - beginDate.getTime());
	result = Math.ceil(result / (1000*3600*24));
	
	var str =  $('#won').val() + '₩' + '(' + (result+1) + '일)';
	$('#resultDate').val(str);
	
	var $check = $('input[name=optionsCheckboxes]');
	var no = '${ payment.payment_no }';
	console.log(no);
	$check.click(function() {
		var re = confirm('예약을 취소하시겠습니까?');
		if(re) {
			alert('메인으로 돌아갑니다');
			location.replace('main.do');
		}
	});
	
	$('#sendMsgbtn').click(function(){
		var seller = '${ payment.seller_id }';
		var customer = '${ payment.customer }';
		var pname = '${ payment.product_name }';
		var content = $('#msgcontent-je').val();
		var pno = '${ payment.product_no }';
		
		var job = new Object();
		job.seller = seller;
		job.customer = customer;
		job.pname = pname;
		job.content = content;
		job.pno = pno;
		console.log('jbo : ' + JSON.stringify(job));
		
		$.ajax({
			url: 'bookingMsg.do',
			type: 'post',
			data: JSON.stringify(job),
			cache: false,
			contentType: 'application/json; charset=utf-8',
			success: function(result) {
				alert('쪽지를 보냈습니다.');
				$('#msgcontent-je').val('');
			}
		})//ajax
	});//쪽지보내기
	
	//예약하기
	$('.pull-right input:nth-child(2)').click(function() {
		var quantity = '${ payment.payment_quantity}';
		var price = $('#won').val();
		var customer = '${ payment.customer }';
		var productNo = '${ payment.product_no }';

		var job = new Object();
		job.price = price;
		job.quantity = quantity;
		job.edate = endDate;
		job.bdate = beginDate;
		job.customer = customer;
		job.proNo = productNo;

			$.ajax({
				url: 'upquan.do',
				type: 'post',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(job),
				cache: false,
				success: function(result) {
					alert('예약에 성공하였습니다!');
					location.href='main.do';
				}//success
			})
	})//click
	//모달창 각각 오픈
	$('#business-je').click(function() {
		$('#myModal-c').show();
	});//click
	$('#home-je').click(function() {
		$('#myModal-b').show();
	});//click
	$('#weekend-je').click(function() {
		$('#myModal-a').show();
	});//click
	
	//모달창 각각 동의
	$('#button-a-je').click(function(){
		$('#weekend-a-je').prop('checked', true).change();
	});
	$('#button-b-je').click(function(){
		$('#home-b-je').prop('checked', true).change();
	});
	$('#button-c-je').click(function(){
		$('#business-c-je').prop('checked', true).change();;
	});
	
	var weekendbox = $('#weekend-a-je').is(':checked');
	var homebox = $('#home-a-je').is(':checked');
	var businessbox = $('#business-a-je').is(':checked');
	
	
		$('#weekend-a-je').change(function() {
			if($(this).is(':checked')){
				alert('됨!');
				$('input[name=next]').prop('disabled', false).css('background-color', ' ');
				return;
			} else {
				alert('안됨!');
				
			}	
		});
		
		$('#gotonext').click(function() {
			if(weekendbox && homebox && businessbox)
				alert('모두 체크!');
		})
	
	
	/* if(weekendbox)
		alert('아');
	else
		alert('아아'); */
	
	
	/* $(test1).prop("checked"); */
	
	/* $('input[name=next]').click(function(){
		if(!$('#weekend-a-je').is(':checked')) {
			alert('모든 항목에 동의하셔야 예약이 완료됩니다.');
			$('input[name=next]').prop('disabled', true).css('background-color', 'gray');
			$('input[name=next]').prop('disabled', false).css('background-color', ' ');
		} else if(!$('#home-b-je').is(':checked')) {
			alert('모든 항목에 동의하셔야 예약이 완료됩니다.');
			$('input[name=next]').prop('disabled', true).css('background-color', 'gray');
			$('input[name=next]').prop('disabled', false).css('background-color', ' ');
		} else if(!$('business-c-je').is(':checked')) {
			alert('모든 항목에 동의하셔야 예약이 완료됩니다.');
			$('input[name=next]').prop('disabled', true).css('background-color', 'gray');
			$('input[name=next]').prop('disabled', false).css('background-color', ' ');
		} else {
			alert('절차를 계속 진행하십시오');
			$('input[name=next]').prop('disabled', false).css('background-color', ' ');
		} */
	//});//
});
function close_pop(flag) {
	//모달창 닫기
    $('#myModal-a').hide();
    $('#myModal-b').hide();
    $('#myModal-c').hide();
};
</script>
<body id='bookingBody'>
	<div class="image-container set-full-height">
	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">
		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="orange" id="wizard">
		                    <form action="" method="">
		                <!--        You can switch " data-color="blue" "  with one of the next bright colors: "green", "orange", "red", "purple"             -->
		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title" style='position: relative; float: left;'>
		                        	<img src='${ pageContext.request.contextPath }/resources/img/core-img/billylogo7.jpg' style='width: 50px; height: 50px;'/>
		                        		예약 확인
		                        	</h3>
									<h5></h5>
		                    	</div>
		                    	<div class="checkbox" style='position: relative; left: 70%;'>
									<label>
										<input type="checkbox" name="optionsCheckboxes" />
									</label>
									 예약취소
								</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#captain" data-toggle="tab">이용 약관(terms)</a></li>
			                            <li><a href="#details" data-toggle="tab">예약 정보(Booking)</a></li>
			                            <li><a href="#description" data-toggle="tab">예약 완료(finished)</a></li>
			                        </ul>
								</div>

		                        <div class="tab-content">
		                        <div class="tab-pane" id="captain">
		                                <h4 class="info-text">모든 항목을 읽어주세요.</h4>
		                                <div class="checkbox" style='position: relative; left: 70%;'>
		                                <label><input type='checkbox' name='weekend-a-je' id='weekend-a-je' onclick='return false;'/></label><i class="material-icons" style='font-size: 16px;'>weekend</i>
		                             	<label><input type='checkbox' id='home-b-je' onclick='return false;'/></label><i class="material-icons" style='font-size: 16px;'>home</i>
		                               	<label><input type='checkbox' id='business-c-je' onclick='return false;'/></label><i class="material-icons" style='font-size: 16px;'>business</i>
		                                </div>
		                                <div class="row">
		                                    <div class="col-sm-10 col-sm-offset-1">
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="This is good if you travel alone.">
		                                                <input type="radio" name="job" value="Design">
		                                                <div class="icon" id='weekend-je'>
		                                                    <i class="material-icons">weekend</i>
		                                                </div>
		                                                <h6>거래시 주의사항</h6>
		                                            </div>
		                                        </div>
		                                        <!-- 모달 -->
		                                        <div id="myModal-a" class="modal">
		                                        	<div class="modal-content">
                										<p style="text-align: center;">
                											<span style="font-size: 14pt;"><b><span style="font-size: 24pt;">거래시 주의사항</span></b></span>
                										</p>
                										<p style="text-align: center; line-height: 1.5;"><br />
                											1. 직거래로 거래를 하셔야합니다.<br>
                											2. 꼭 물품을 꼼꼼히 확인 후 거래해주세요.<br>
                											3. 사기의심이 되면 더치트를 통해 확인해주세요.<br>
                											4. 사이트에 명시된 절차에 따르지 않고 임의대로 거래를 하여 발생한 불이익에 책임을 지지 않습니다.<br>
                										</p>
                										<p><br /></p>
            											<div id='button-a-je' style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                											<span class="pop_bt" style="font-size: 13pt;" >
                     											동의 및 닫기
                											</span>
            											</div>
     		 										</div>
     		 									</div>
     		 									<!-- ============ -->
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="Select this room if you're traveling with your family.">
		                                                <input type="radio" name="job" value="Code">
		                                                <div class="icon" id='home-je'>
		                                                    <i class="material-icons">home</i>
		                                                </div>
		                                                <h6>결제정책</h6>
		                                            </div>
		                                        </div>
		                                         <!-- 모달 -->
		                                        <div id="myModal-b" class="modal">
		                                        	<div class="modal-content">
                										<p style="text-align: center;">
                											<span style="font-size: 14pt;"><b><span style="font-size: 24pt;">결제정책</span></b></span>
                										</p>
                										<p style="text-align: center; line-height: 1.5;"><br />
                											1. 반드시 사이트를 통해 거래해주세요.<br>
                											2. 사이트를 통해 거래하지 않을 시 사이트 이용에 불편이 발생할 수 있습니다.<br>
                											3. 이용약관을 무시한 거래로 발생한 불이익은 전부 당사자에게 책임이 있습니다.<br>
                											4. 임의로 현금거래를 하여 발생한 불이익에 빌리는 일절 책임지지 않습니다.<br>
                										</p>
                										<p><br /></p>
            											<div id='button-b-je' style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                											<span class="pop_bt" style="font-size: 13pt;" >
                     											동의 및 닫기
                											</span>
            											</div>
     		 										</div>
     		 									</div>
     		 									<!-- ============ -->
												<div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="Select this option if you are coming with your team.">
		                                                <input type="radio" name="job" value="Code">
		                                                <div class="icon" id='business-je'>
		                                                    <i class="material-icons">business</i>
		                                                </div>
		                                                <h6>사이트 이용약관</h6>
		                                            </div>
		                                        </div>
		                                         <!-- 모달 -->
		                                        <div id="myModal-c" class="modal">
		                                        	<div class="modal-content">
                										<p style="text-align: center;">
                											<span style="font-size: 14pt;"><b><span style="font-size: 24pt;">사이트 이용약관</span></b></span>
                										</p>
                										<p style="text-align: center; line-height: 1.5;"><br />
                											- 빌리는 모든 물품을 빌리는 것을 추구하는 사이트입니다.<br>
                											   항상 최선의 서비스를 제공하기 위해 노력하겠습니다. -<br>
                											1. 사이트 이용 중 문의사항이 있다면 좌측의 채팅을 이용하여 관리자에게 문의하실 수 있습니다.<br>
                												혹은 billy@billy.com으로 문의 메일을 보내주십시오.<br>
                											2. 빌리에 등록된 모든 물픔은 전부 직거래로 거래됩니다.<br>
                											3. 물품등록시 보이는 거래 가능 지역을 잘 참고하시면 알찬 대여가 가능합니다.<br>
                											4. 약관을 잘 숙지하지 않아 발생한 불이익은 당사자에게 모든 책임이 있습니다. <br>
                											   빌리는 일절 책임지지 않습니다.
                										</p>
                										<p><br /></p>
            											<div id='button-c-je'style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                											<span class="pop_bt" style="font-size: 13pt;" >
                     											동의 및 닫기
                											</span>
            											</div>
     		 										</div>
     		 									</div>
     		 									<!-- ============ -->
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="tab-pane" id="details">
		                            	<div class="row">
			                            	<div class="col-sm-12">
			                                	<h4 class="info-text"> ${ payment.customer }님께서 예약신청하신 내용입니다.</h4>
			                            	</div>
		                                	<div class="col-sm-6">
												<div class="input-group">
													<span class="input-group-addon">
														<i class="material-icons">face</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">판매자</label>
			                                          	<input name="name" type="text" class="form-control" value='${ payment.seller_id }'>
			                                        </div>
												</div>

												<div class="input-group">
													<span class="input-group-addon">
														<!-- <i class="material-icons">lock_outline</i> -->
														<i class="material-icons">email</i>
													</span>
													<div class="form-group label-floating">
			                                          	<label class="control-label">Your Email</label>
			                                          	<input name="name2" type="text" class="form-control" value='${ loginMember.email }'>
			                                        </div>
												</div>

		                                	</div>
		                                	<div class="col-sm-6">
		                                    	<div class="form-group label-floating">
		                                        	<label class="control-label">Product</label>
	                                        		<input type='text' class='form-control' value='${ payment.product_name }'/>
		                                    	</div>
												<div class="form-group label-floating">
		                                        	<label class="control-label">Charge</label>
		                                        	<input type='hidden' id='ed' value='${ payment.payment_enddate }'/> 
		                                        	<input type='hidden' id='bd' value='${ payment.payment_begindate }'/> 
		                                        	<input type='hidden' id='won' value='${ payment.payment_price }'/> 
	                                        		<input type='text' id='resultDate' class='form-control' value=' '/>
		                                    	</div>
		                                	</div>
		                            	</div>
		                            </div>
		                            <div class="tab-pane" id="description">
		                                <div class="row">
		                                    <h4 class="info-text"> 예약이 완료되었습니다.</h4>
		                                    <div class="col-sm-6 col-sm-offset-1">
	                                    		<div class="form-group">
		                                            <label>더  궁금한 내용을 쪽지로 보내보세요!</label>
		                                            <textarea class="form-control" placeholder="" rows="6" id='msgcontent-je'></textarea>
		                                            <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd' id='sendMsgbtn' name='finish' value='쪽지 보내기' />
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-4">
		                                    	<div class="form-group">
		                                            <label class="control-label">MESSAGE</label>
		                                            <p class="description">보다 자세한 궁금점은 쪽지를 통해 판매자에게 직접 물어보세요!<br>저희 Billy를 이용해주셔서 감사합니다. 더 나은 서비스를 위해 항상 노력하겠습니다.
		                                            	<br><br>Thank you for your support!
		                                            </p>
		                                            <p class='description' style='position: relative; float: right;'>- Billy™</p>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
	                        	<div class="wizard-footer">
	                            	<div class="pull-right">
	                                    <input type='button' class='btn btn-next btn-fill btn-warning btn-wd' name='next' value='Next' id='gotonext' />
	                                    <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd' name='finish' id='bookingfinish' value='확인' />
	                                </div>
	                                <div class="pull-left">
	                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />

										<div class="footer-checkbox">
											<div class="col-sm-12">
											  <!-- <div class="checkbox">
												  <label>
													  <input type="checkbox" name="optionsCheckboxes">
												  </label>
												  예약취소
											  </div> -->
										  </div>
										</div>
	                                </div>
	                                <div class="clearfix"></div>
	                        	</div>
		                    </form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	    	</div> <!-- row -->
		</div> <!--  big container -->
	</div>

</body>
	<!--   Core JS Files   -->
	<script src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-2.2.4.min.js" type="text/javascript"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery/bootstrap.min.js" type="text/javascript"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.bootstrap.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="${ pageContext.request.contextPath }/resources/js/material-bootstrap-wizard.js"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
</html>