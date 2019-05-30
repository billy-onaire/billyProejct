<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>상품상세보기</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <link rel="stylesheet" href="/billy/resources/css/style.css">

	<!-- datepicker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	
	<!-- 페이징 관련 -->
	<link rel="stylesheet" href="/billy/resources/css/reviewdetailpaging.css">
	<script type="text/javascript" src="/billy/resources/js/pdetail-review-paging.js"></script>
	
	<!-- 쪽지 보내기용 -->
	<script src="/billy/resources/js/messageList.js"></script>
	
	<script type="text/javascript" src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
	//쪽지 보낼 때, sent_id & recv_id & pno & product_name 넘긴다
	$('#sent_mms').click(function(){
			var pNo = "${p.product_no }";
			alert(pNo);

		
		$.ajax({
			url : 'mmsWrite.do',
			type: 'GET',
			traditional : true,
		    data        : pNo,
		    success     : function(data) {
		    	alert("완료!");
		        alert(data);  
		        window.opener.location.reload();
	            self.close();
		    },
		    error       : function(request, status, error) {
		    	alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	            self.close();
		    }


		});//ajax 닫기

	});
	
	function insertPopup() {
	    // window.name = "부모창 이름";            
	    window.name = "pdetail.do";
	    
	    // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
	    window.open("mmsWrite.do?pno=${p.product_no}", "insert",
	    		"width=450, height=500, menubar=no, status=no, toolbar=no, left=700, top=200");
	}
	
	
	$(function(){
	    // 3.페이징 처리할 ajax셋팅
	    paging.ajax = ajaxList;
	    ajaxList();
	    
	    //물품수량 검사
	    var s = '${ p.product_quantity }';
	    if(s == '0') {
	    	alert('현재 물품의 재고가 없습니다!');
	    	$('#goBooking').prop('disabled', true).css('background-color', 'gray');
	    } else {
	    	$('#goBoogking').prop('disabled', false).css('background-color', '');
	    }
	});
	 
	var ajaxList = function(){    
	    var submitData = {};
	    // 1.페이징시 필요 데이터 셋팅
	    submitData.index = paging.p.index;
	    submitData.pageStartNum = paging.p.pageStartNum;
	    submitData.productNo = ${p.product_no}; 
	    
	    $.ajax({
	        url: 'printReview.do',
	        type: 'post',
	        data: submitData,
	        dataType: "json",
	        success : function(data){
	        	var jsonStr = JSON.stringify(data);
				var obj = JSON.parse(jsonStr);
				
	            // 2.페이징정보와 화면 ui셋팅
	            var list = "";
	            var point = "";

	            for(var i in obj.list){
	            	if(obj.list[i].point == "1"){
	            		point = '<span class="starR on">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR"></span>';
	                }else if(obj.list[i].point == "2"){
	                	point = '<span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR"></span>';
	                }else if(obj.list[i].point == "3"){
	                	point = '<span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR"></span>';
	                }else if(obj.list[i].point == "4"){
	                	point = '<span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR"></span>';
	                }else if(obj.list[i].point == "5"){
	                	point = '<span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on"></span>';
	                }
	
	            	 list +="<tr>";	            	 
	            	 list +="<td>"+obj.list[i].customer+"</td>";
	            	 list +="<td>"+point+"</td>";
	            	 list +="<td>"+decodeURIComponent(obj.list[i].review_content).replace(/\+/gi, " ") + "</td>";
	            	 list +="<td>"+obj.list[i].review_date+"</td>";
	            	 if(obj.list[i].review_image != null){
	            	 	list +="<td><img src='/billy/resources/reviewImg/"+obj.list[i].review_image+"'></td>";	            	
	            	 }else{
	            		list +="<td></td>";
	            	 }
	            	 "<c:if test='${!empty sessionScope.admin}'>"
		            	 list +="<td><a href='delReview.do?rno="+obj.list[i].review_no+"&pno=${p.product_no}'><button>삭제</button></a></td>";		               
		             "</c:if>"
		             list += "</tr>"
	                 
				} 
	            $("#list").html(list);
	            $("#reviewCount").text("리뷰 " + obj.p.total + "건");
	            
	            paging.p = obj.p;
	            paging.create();
	        },
	        error: function(request, status, errorData){
				console.log("error code : " + request.status + "\nmessage : " + request.responseText + "\nerror : " + errorData);
	        }
	    });    

	}
	</script>
	
	<style type="text/css">
		/* 대여자 정보 CSS*/
		.dropbtn:hover, .dropbtn:focus {
		  cursor:pointer;
		}
		
		.dropdown {
		  position: relative;
		  display: inline-block;
		}
		
		.dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: #f1f1f1;
		  min-width: 160px;
		  overflow: auto;
		  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		  z-index: 1;
		}
		
		.dropdown-content a {
		  color: black;
		  padding: 12px 16px;
		  text-decoration: none;
		  display: block;
		}
		
		.dropdown a:hover {background-color: #ddd;}
		
		.show {display: block;}
		
		/* 리뷰 테이블 */
		table.type09 {
		    border-collapse: collapse;
		    text-align: left;
		    line-height: 1.5;
		
		}
		table.type09 thead th {
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;	
		    color: orange;
		    border-bottom: 3px solid orange;
		}
		table.type09 tbody th {
		    width: 150px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    border-bottom: 1px solid #ccc;
		    background: #f3f6f7;
		}
		table.type09 td {
		    /* width: 350px; */
		    padding: 10px;
		    vertical-align: center;
		    border-bottom: 1px solid #ccc;
		}
		
		/* 별점 CSS */
		.starR{
		  background: url('/billy/resources/img/review-point/point_star.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 20px;
		  height: 20px;
		  display: inline-block;
		  text-indent: -9999px;
		}
		.starR.on{background-position:0 0;}
		
		/* 제품정보 CSS */
		table.type03 {
		    border-collapse: collapse;
		    text-align: left;
		    line-height: 1.5;		    
		    border-left: 3px solid #FF9F00;
		    border-right: 3px solid #FF9F00;
		  margin : 20px 10px;
		}
		table.type03 th {
		    width: 147px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: #153d73;		    
		}
		table.type03 td {
		    width: 349px;
		    padding: 10px;
		    vertical-align: top;		   
		}
		
		/* form table css */
		table.type05 {
		    border-collapse: collapse;
		    text-align: left;
		    line-height: 1.5;		    
		    border-top: 3px solid #FF9F00;
		    border-bottom: 3px solid #FF9F00;
		  margin : 20px 10px;
		}
		table.type05 th {
		    width: 147px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: top;
		    color: #153d73;		    
		}
		table.type05 td {
		    width: 349px;
		    padding: 10px;
		    vertical-align: top;		   
		}
	</style>
</head>

<body>

    <div class="main-content-wrapper d-flex clearfix">
	<c:import url="../common/nav.jsp" />

        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">${p.pcategory_name }</a></li>
                                <li class="breadcrumb-item"><a href="#">${p.sub_pcategory_name }</a></li>     
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(/billy/resources/files/product/${p.first_img });">
                                    </li>
                                    <c:if test="${not empty p.second_img }">
	                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(/billy/resources/files/product/${p.second_img });">
	                                    </li>
                                    </c:if>
                                    <c:if test="${not empty p.third_img }">
                                    	<li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(/billy/resources/files/product/${p.third_img });">
                                    	</li>
                                    </c:if>
                                    <c:if test="${not empty p.fourth_img }">
	                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(/billy/resources/files/product/${p.fourth_img });">
	                                    </li>
                                    </c:if>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="/billy/resources/files/product/${p.first_img }">
                                            <img class="d-block w-100" src="/billy/resources/files/product/${p.first_img }" alt="First slide">
                                        </a>
                                    </div>
                                    <c:if test="${not empty p.second_img }">
	                                    <div class="carousel-item">
	                                        <a class="gallery_img" href="/billy/resources/files/product/${p.second_img }">
	                                            <img class="d-block w-100" src="/billy/resources/files/product/${p.second_img }" alt="Second slide">
	                                        </a>
	                                    </div>
                                    </c:if>
                                    <c:if test="${not empty p.third_img }">
	                                    <div class="carousel-item">
	                                        <a class="gallery_img" href="/billy/resources/files/product/${p.third_img }">
	                                            <img class="d-block w-100" src="/billy/resources/files/product/${p.third_img }" alt="Third slide">
	                                        </a>
	                                    </div>
	                                </c:if>
	                                <c:if test="${not empty p.fourth_img }">
	                                    <div class="carousel-item">
	                                        <a class="gallery_img" href="/billy/resources/files/product/${p.fourth_img }">
	                                            <img class="d-block w-100" src="/billy/resources/files/product/${p.fourth_img }" alt="Fourth slide">
	                                        </a>
	                                    </div>
	                                </c:if>
                                </div>
                            </div>
                        </div><hr><br>
                        <h2>상품설명</h2><hr>
                        <div class="short_overview my-5">
                        	<div style="word-break:break-all;">${p.product_content }</div>
                        </div><br><hr><br> 
                        <h2>거래지역</h2>
                        <hr>
                        <div id="mapAddress">${p.location_area }</div>
                        <div id="map" style="width:800px;height:300px; float:left;"></div>				
												
                    </div>
                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">${ p.price} 원</p>
                                <a href="#">
                                    <h6>${p.product_name }</h6>
                                </a>
                                <!-- Ratings & Review -->
                                <br><div class="ratings-review mb-15 d-flex align-items-center justify-content-between">                          
                                    <%-- <p class="avaibility"><i class="fa fa-circle"></i> 대여자 : ${p.seller_id }</p> --%>                               
                                    <div class="dropdown">
										  <p onclick="myFunction()" class="dropbtn">대여자 : ${p.seller_id }</p>
										  <div id="myDropdown" class="dropdown-content">
										  	<!-- <a href="#" id="sentmms">쪽지쓰기</a>	 -->	
										  	<c:if test="${p.seller_id ne loginMember.user_id }">								    
										    <a href="#" id="sent_mms" onclick="insertPopup();">쪽지쓰기</a>
										    </c:if>
										    <input type="hidden" id="mms_pno" value="${p.product_no }">									    
										    <a href="#">${p.user_mobile }</a>										    	 
										    <a href="#">${p.email }</a>
										  </div>
									</div>
										
                                    <div class="review">
                                    	<c:if test="${!empty loginMember }">
	                                        <a href="goReport.do?pno=${p.product_no }" style="color:red">신고하기</a>
                                    	</c:if>
                                    </div>
                                </div><br><br>
                                
                                <!-- Avaiable -->
                                <table class="type03">
							    <tr>
							        <th scope="row">평점</th>
							        <td>
							        <c:if test="${point > 0 and point < 1.5}">
							        	<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
							        	<div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>                                        
                                    	</div>	${point }
                                    	</div>	
									</c:if>
									<c:if test="${point >= 1.5 and point < 2.0}">
										<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
							        	<div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>                                            
                                        <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                    	</div>	${point }
                                    	</div>
									</c:if>
									<c:if test="${point >= 2.0 and point < 2.5}">
										<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
							        	<div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>                                            
                                    	</div>	${point }
                                    	</div>
									</c:if>
									<c:if test="${point >= 2.5 and point < 3.0}">	
										<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">	
								        <div class="ratings">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>    
	                                        <i class="fa fa-star-half-o" aria-hidden="true"></i>
	                                    </div>	${point }
	                                    </div> 
									</c:if>
									<c:if test="${point >= 3.0 and point < 3.5}">
							        	<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">	
								        <div class="ratings">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>    
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                    </div>	${point }
	                                    </div> 
									</c:if>
									<c:if test="${point >= 3.5 and point < 4.0}">
							        	<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">	
								        <div class="ratings">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>    
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star-half-o" aria-hidden="true"></i>	                                        
	                                    </div>	${point }
	                                    </div>	
									</c:if>
									<c:if test="${point >= 4.0 and point < 4.5}">
							        	<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">	
								        <div class="ratings">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>    
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>	                                     	                                       
	                                    </div>	${point }
	                                    </div>	
									</c:if>
									<c:if test="${point >= 4.5 and point < 5.0}">
							        	<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">	
								        <div class="ratings">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>    
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star-half-o" aria-hidden="true"></i>	                                     	                                       
	                                    </div>	${point }
	                                    </div>	
									</c:if>
									<c:if test="${point eq 5.0}">
							        	<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">	
								        <div class="ratings">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>    
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>	                                     	                                       
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                    </div>	${point }
	                                    </div>
									</c:if>
									<c:if test="${empty point }">
										평가없음
									</c:if>
									</td>
							    </tr>
							    <tr>
							        <th scope="row">대여기간</th>
							        <td>
							        	<c:set var="startdate" value="${fn:replace(p.product_startdate, '-', '.')}"/>
							        	<c:set var="enddate" value="${fn:replace(p.product_enddate, '-', '.')}"/>
							        	${startdate } ~ ${enddate }
							        </td>
							    </tr>
							    <tr>
							        <th scope="row">주말대여여부</th>
							        <td>
							        	<c:if test="${p.weekend_yn eq 'Y' }">
							        		가능
							        	</c:if>
							        	<c:if test="${p.weekend_yn eq 'N' }">
							        		불가능
							        	</c:if>			      
							        </td>
							    </tr>
							    <tr>
							        <th scope="row">평일대여요일</th>
							        <td>
							        	${p.weekday_yn }
							        </td>
							    </tr>
							    <tr id='paymentQ'>
							        <th scope="row">남은수량</th>
							        <td>${p.product_quantity }</td>
							    </tr>
							</table>
                            </div>
							
                            <%-- <div class="short_overview my-5">
                                <p>${p.product_content }</p>
                            </div> --%>
							
                            <!-- Add to Cart Form -->
                            <br><br><br>                          

                            <form id="form" class="cart clearfix" method="post" style="clear:both;" action='bookingPage.do'>

                            <table class="type05">
                            <tr>
                            	<th>갯수</th>
                            	<td>
                            		<input type="number" class="qty-text" id="qty" step="1" min="1" max="${ p.product_quantity }" name="payment_quantity" value="1">
                            	</td>
                            </tr>
                            
                            <tr>
                            	<th>희망대여시작일</th>
                            	<td><input type="text" class="datepicker" name="payment_begindate" id="beginDate" placeholder="Select Date.." required></td>
                            </tr>
                            <tr>
                            	<th>희망대여반납일</th>
                            	<td><input type="text" class="datepicker" name="payment_enddate" id="endDate" placeholder="Select Date.." required></td>
                            </tr>
                            <tr>
                            	<th>가격</th>
                            	<td><p id="price"></td>
                            </tr>
                            <tr>
                            	<td colspan="2" style="padding:30px">
                            		<button id='goBooking' type='button' name="addtocart" value="5" class="btn amado-btn" onclick="formSubmit();">대여신청</button>
                            	</td>
                            </tr>
                            </table>
                            <input type='hidden' name='product_name' value='${ p.product_name }'/>
                            <input type='hidden' name='customer' value='${ loginMember.user_id }'/>
                            <input type='hidden' name='seller_id' value='${ p.seller_id }'/>
                            <input type='hidden' name='product_no' value='${ p.product_no }'/>
                            <input type="hidden" name="payment_price" id="hiddenPrice">
                            </form>
							
                        </div>                  
                    </div>
                </div>
                
            </div><br><br>         
            <hr>

            <h3 id="reviewCount"></h3> <br>
            <table class="type09">
			    <thead>
			    <tr>			    	
			        <th width="150">ID</th>
			        <th>별점</th>
			        <th width="350">내용</th>
			        <th>작성일</th>
			        <th width="350">이미지</th>
			    </tr>
			    </thead>
			    <tbody id="list">
 
			    </tbody>
			</table>
			<center>
			<!--맨 첫페이지 이동 -->
			<!--이전 페이지 이동 -->
			<ul class="pagination preBtn"></ul>
			<!--페이지번호 -->
			<ul class="pagination index"></ul>
			<!--다음 페이지 이동 -->
			<!--마지막 페이지 이동 -->
			<ul class="pagination nextBtn"></ul>
			</center>
        </div>
        <!-- Product Details Area End -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
	<c:import url="../common/footer.jsp" />
    
    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e2688930bfd694b41af56058fd0928e&libraries=services"></script>
							<script>
							var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
							    mapOption = {
							        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };  
							
							// 지도를 생성합니다    
							var map = new daum.maps.Map(mapContainer, mapOption); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new daum.maps.services.Geocoder();
							
							
							var mapAddress = $("#mapAddress").text();
							// 주소로 좌표를 검색합니다
							geocoder.addressSearch(mapAddress, function(result, status) {
							
							    // 정상적으로 검색이 완료됐으면 
							     if (status === daum.maps.services.Status.OK) {
							
							        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
							
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        var marker = new daum.maps.Marker({
							            map: map,
							            position: coords
							        });
							
							        // 인포윈도우로 장소에 대한 설명을 표시합니다
							        var infowindow = new daum.maps.InfoWindow({
							            content: '<div style="width:150px;text-align:center;padding:6px 0;">거래지역</div>'
							        });
							        infowindow.open(map, marker);
							
							        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							        map.setCenter(coords);
							    } 
							});    
							</script>
	
	<!-- datepicker -->
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
		flatpickr(".datepicker", {
			dateFormat: "Y-m-d",
			
			minDate: "${p.product_startdate}",
			maxDate: "${p.product_enddate}",
			
			"disable": [
		        function(date) {
		            // return true to disable
		            if("${p.weekend_yn}" != "Y"){
		            	return (date.getDay() === 0 || date.getDay() === 6);
		            }else{
		            	return
		            }
		            
		        }
		    ],
		    "locale": {
		        "firstDayOfWeek": 1 // start week on Monday
		    }

			
		});
	</script>
	
	<script type="text/javascript">

	/* 대여자 ID 눌렀을때 나오는 정보 스크립트 */	
	/* When the user clicks on the button, 
	toggle between hiding and showing the dropdown content */
	function myFunction() {
	  document.getElementById("myDropdown").classList.toggle("show");
	}

	// Close the dropdown if the user clicks outside of it
	window.onclick = function(event) {
	  if (!event.target.matches('.dropbtn')) {
	    var dropdowns = document.getElementsByClassName("dropdown-content");
	    var i;
	    for (i = 0; i < dropdowns.length; i++) {
	      var openDropdown = dropdowns[i];
	      if (openDropdown.classList.contains('show')) {
	        openDropdown.classList.remove('show');
	      }
	    }
	  }
	}
	
	/* 대여신청 가격 계산 자바스크립트 */
    $(".datepicker, #qty").on("change", function(){
    	var begin = $("#beginDate").val();
    	var end = $("#endDate").val();
    	var beginArray = begin.split("-");
		var endArray = end.split("-");
		
    	var beginDate = new Date(beginArray[0], beginArray[1], beginArray[2]);
    	var endDate = new Date(endArray[0], endArray[1], endArray[2]);
    	var result = (endDate - beginDate)/1000/60/60/24 + 1;
    	if(result < 1){
    		alert("반납일이 시작일 보다 빠릅니다. 다시 선택해주세요.");
    		$("#endDate").val("");
    		return;
    	}
    	
		var price = ${p.price} * result * $("#qty").val();
		$("#price").text(price);
		$("#hiddenPrice").val(price);
    });
	
	/* form 전송 스크립트 */
	function formSubmit(){
		if($("#beginDate").val() == ""){
			alert("대여 시작일을 선택해주세요");
			return;
		}
		if($("#endDate").val() == ""){
			alert("대여 반납일을 선택해주세요");
			return;
		}
    	
    	$("#form").submit();
    }
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