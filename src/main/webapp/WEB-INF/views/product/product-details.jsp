<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Billy Product Details</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <link rel="stylesheet" href="/billy/resources/css/style.css">

	<!-- datepicker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	
	<!-- 페이징 관련 -->
	<link rel="stylesheet" href="/billy/resources/css/reviewdetailpaging.css">
	<script type="text/javascript" src="/billy/resources/js/pdetail-review-paging.js"></script>
	
	<script type="text/javascript" src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript">
	$(function(){
	    // 3.페이징 처리할 ajax셋팅
	    paging.ajax = ajaxList;
	    ajaxList();
	});
	 
	var ajaxList = function(){    
	    var submitData = {};
	    // 1.페이징시 필요 데이터 셋팅
	    submitData.index = paging.p.index;
	    submitData.pageStartNum = paging.p.pageStartNum;
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
	            	 list +="<td>user01</td>";
	            	 list +="<td>"+point+"</td>";
	            	 list +="<td>"+obj.list[i].review_content+"</td>";
	            	 list +="<td>"+obj.list[i].review_date+"</td>";
	            	 list +="<td><img src='/billy/resources/reviewImg/"+obj.list[i].review_image+"' width='150px' height='150px'></td>";
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
	
	
	//리뷰 이미지 크게보기
	//레이어 팝업 열기
	var cnt = 0;
	function openLayer(IdName, tpos, lpos){
	  if(cnt==0){
		cnt++;
		var pop = document.getElementById(IdName);
		pop.style.display = "block";
		pop.style.top = tpos + "px";
		pop.style.left = lpos + "px";
	  }
	}
	//레이어 팝업 닫기
	function closeLayer(IdName){
		var pop = document.getElementById(IdName);
		pop.style.display = "none";
		cnt=0;
	}	
	
	</script>
	
	<style type="text/css">
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
		    width: 350px;
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
		    /* border-top: 1px solid #ccc; */
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
		    /* border-right: 1px solid #ccc; */
		    /* border-bottom: 1px solid #ccc; */
		
		}
		table.type03 td {
		    width: 349px;
		    padding: 10px;
		    vertical-align: top;
		    /* border-right: 1px solid #ccc; */
		    /* border-bottom: 1px solid #ccc; */
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
                        </div>
                        <h2>거래지역</h2>
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
                                    <p class="avaibility"><i class="fa fa-circle"></i> 대여자 : ${p.seller_id }</p>                                
                                    <div class="review">
                                        <a href="#" style="color:red">신고하기</a>
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
                                    	</div>
                                    	</div>	
									</c:if>
									<c:if test="${point >= 1.5 and point < 2.0}">
										<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
							        	<div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>                                            
                                        <i class="fa fa-star-half-o" aria-hidden="true"></i>
                                    	</div>	
                                    	</div>
									</c:if>
									<c:if test="${point >= 2.0 and point < 2.5}">
										<div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
							        	<div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>                                            
                                    	</div>	
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
									</td>
							    </tr>
							    <tr>
							        <th scope="row">대여기간</th>
							        <td>${p.product_startdate } ~ ${p.product_enddate }</td>
							    </tr>
							    <tr>
							        <th scope="row">주말대여여부</th>
							        <td>${p.weekend_yn }</td>
							    </tr>
							    <tr>
							        <th scope="row">평일대여요일</th>
							        <td>${p.weekday_yn }</td>
							    </tr>
							    <tr>
							        <th scope="row">남은수량</th>
							        <td>${p.product_quantity }</td>
							    </tr>
							</table>
                            </div>
							
                            <div class="short_overview my-5">
                                <p>${p.product_content }</p>
                            </div>
							
                            <!-- Add to Cart Form -->
                            <form class="cart clearfix" method="post" style="clear:both;">
                            	<br><br>
                                <div class="cart-btn d-flex mb-50">
                                    <p>갯수</p>
                                    <div class="quantity">
                                        <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="${p.product_quantity }" name="quantity" value="1">
                                        <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                    </div>
                                </div>
                                <br>
                                <div style="float:left;">
                                	희망대여시작일 <br>
                                    <input type="text" class="datepicker"> &nbsp;&nbsp;&nbsp;
                                </div>
                                <div>
                                   	 희망대여반납일 <br>
                                    <input type="text" class="datepicker">
                                </div><br><br>
                                <button type="submit" name="addtocart" value="5" class="btn amado-btn">대여신청</button>
                            </form>

                        </div>                  
                    </div>
                </div>
                
            </div><br><br>
            
            <hr>
     <!-- <span>
<a href="#" onclick="openLayer('layerPop',1000,300)"> openLayer('확대이미가 있는 레이어 id명', x축의위치 , y축의위치)
    	<img style="border:none;" src="/billy/resources/reviewImg/billy.png" width="100px" height="100px" /> 기본작은 썸네일 이미지
</a>
<div id="layerPop" style="position:absolute; display:none; border:3px solid #ccc; z-index:10;">오픈레이어 테두리
      <a href="#" onclick="closeLayer('layerPop')" class="close">
    	 <p><img style="border:none;" src="/billy/resources/reviewImg/billy.png" width="500px" height="500px"/>큰 이미지 오픈</p>
      </a>
  </div>
</span> -->
     
            <h3 id="reviewCount"></h3> <br>
            <table class="type09">
			    <thead>
			    <tr>
			        <th>ID</th>
			        <th>별점</th>
			        <th>내용</th>
			        <th>작성일</th>
			        <th>이미지</th>
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
			enableTime: true,
			dateFormat: "Y-m-d H:i",
			
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