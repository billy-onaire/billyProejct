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
</head>
<script src="${ pageContext.request.contextPath }/resources/js/jquery/jquery-3.3.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	//날짜 계산
	var endDate = $('#ed').val() instanceof Date ? $('#ed').val() : new Date($('#ed').val());
	var beginDate = $('#bd').val() instanceof Date ? $('#bd').val() : new Date($('#bd').val());
	
	endDate = new Date(endDate.getFullYear(), endDate.getMonth()+1, endDate.getDate());
	beginDate = new Date(beginDate.getFullYear(), beginDate.getMonth()+1, beginDate.getDate());
	
	var result = Math.abs(endDate.getTime() - beginDate.getTime());
	result = Math.ceil(result / (1000*3600*24));
	
	var str =  $('#won').val() + '₩' + '(' + (result+1) + '일)';
	$('#resultDate').val(str);
	
	$('#sendMsgbtn').click(function(){
		$ajax({
			/* url: 'bookingMsg.do',
			type: 'post' */
			/* data */
			/* url: 'printReview.do',
	        type: 'post',
	        data: submitData,
	        dataType: "json", */
		})//ajax
	})//쪽지보내기
	
	$('#bookingfinish').click(function(){
		location.href='main.do';
	})//click
});
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
		                        	</h3><br><br>
									<h5></h5>
		                    	</div>
								<div class="wizard-navigation">
									<ul>
			                            <li><a href="#details" data-toggle="tab">예약 정보(Booking)</a></li>
			                            <li><a href="#captain" data-toggle="tab">이용 약관(terms)</a></li>
			                            <li><a href="#description" data-toggle="tab">예약 완료(finished)</a></li>
			                        </ul>
								</div>

		                        <div class="tab-content">
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
			                                          	<input name="name2" type="text" class="form-control" value='이메일!'>
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
		                            <div class="tab-pane" id="captain">
		                                <h4 class="info-text">What type of room would you want? </h4>
		                                <div class="row">
		                                    <div class="col-sm-10 col-sm-offset-1">
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="This is good if you travel alone.">
		                                                <input type="radio" name="job" value="Design">
		                                                <div class="icon">
		                                                    <i class="material-icons">weekend</i>
		                                                </div>
		                                                <h6>Single</h6>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="Select this room if you're traveling with your family.">
		                                                <input type="radio" name="job" value="Code">
		                                                <div class="icon">
		                                                    <i class="material-icons">home</i>
		                                                </div>
		                                                <h6>Family</h6>
		                                            </div>
		                                        </div>
												<div class="col-sm-4">
		                                            <div class="choice" data-toggle="wizard-radio" rel="tooltip" title="Select this option if you are coming with your team.">
		                                                <input type="radio" name="job" value="Code">
		                                                <div class="icon">
		                                                    <i class="material-icons">business</i>
		                                                </div>
		                                                <h6>Business</h6>
		                                            </div>
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
		                                            <textarea class="form-control" placeholder="" rows="6"></textarea>
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
	                                    <input type='button' class='btn btn-next btn-fill btn-warning btn-wd' name='next' value='Next' />
	                                    <input type='button' class='btn btn-finish btn-fill btn-warning btn-wd' name='finish' id='bookingfinish' value='확인' />
	                                </div>
	                                <div class="pull-left">
	                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd' name='previous' value='Previous' />

										<div class="footer-checkbox">
											<div class="col-sm-12">
											  <div class="checkbox">
												  <label>
													  <input type="checkbox" name="optionsCheckboxes">
												  </label>
												  Subscribe to our newsletter
											  </div>
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