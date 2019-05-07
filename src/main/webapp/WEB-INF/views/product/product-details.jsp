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
	<script type="text/javascript">
	//paging 객체
	var paging = {
	        // 기본값 셋팅
	        p: {
	            index : 0,
	            pageStartNum : 1
	        },
	        // 페이징 생성
	        create: function(){
	            var htmlTag = '';
	            for (var i = paging.p.pageStartNum; i <= paging.p.pageLastNum; i++) {
	                htmlTag += '<li class="pageIndex"><span>'+i+'</span></li>';
	            }
	            $('.index').html(htmlTag);
	            
	            // 현재 번호 ui
	            $('.pageIndex').each(function(){
	                if(paging.p.index == $(this).text()-1) {
	                    $(this).addClass('active');
	                }else {
	                    $(this).removeClass('active');
	                }
	            });
	            
	            // 이전 페이지 이동 버튼 생성여부
	            if(paging.p.pageStartNum != 1) {
	                $('.preBtn').html('<li id="pagePreFirst"><span>«</span></li><li id="pagePre"><span>‹</span></li>');
	                // 맨 첫 페이지 index
	                $('#pagePreFirst').click(function(){
	                    var index = paging.p.pageCnt+1;
	                    var pageCnt = paging.p.pageCnt;
	                    if (0 < index - pageCnt) {
	                        index -= pageCnt;
	                        paging.p.pageStartNum = index;
	                        paging.p.index = index-1;
	                        paging.ajax();
	                    }
	                });
	                
	                // 이전 페이지 index
	                $('#pagePre').click(function(){
	                    var index = paging.p.pageStartNum;
	                    var pageCnt = paging.p.pageCnt;
	                    if (0 < index - pageCnt) {
	                        index -= pageCnt;
	                        paging.p.pageStartNum = index;
	                        paging.p.index = index-1;
	                        paging.ajax();
	                    }
	                });
	            }else {
	                $('.preBtn').children('li').remove();
	            }
	            
	            // index 리스트 처리
	            $('.pageIndex').click(function(){
	                var index = Number($(this).find('span').text());
	                paging.p.index = index - 1;
	                paging.ajax();
	            });
	            
	            // 다음 페이지 이동 버튼 생성여부
	            if(paging.p.lastChk) {
	                $('.nextBtn').html('<li id="pageNext"><span>›</span></li><li id="pageLast"><span>»</span></li>');
	                // 다음 페이지 index
	                $('#pageNext').click(function(){
	                    var index = paging.p.pageStartNum;
	                    var total = paging.p.total;
	                    var listCnt = paging.p.listCnt;
	                    var pageCnt = paging.p.pageCnt;
	                    
	                    var totalPageCnt = Math.ceil(total / listCnt);
	                    var max = Math.ceil(totalPageCnt / pageCnt);
	                    if (max * pageCnt > index + pageCnt) {
	                        index += pageCnt;
	                        paging.p.pageStartNum = index;
	                        paging.p.index = index-1;
	                        paging.ajax();
	                    }
	                });
	                // 마지막 페이지 index
	                $('#pageLast').click(function(){
	                    var index = paging.p.pageStartNum;
	                    var total = paging.p.total;
	                    var listCnt = paging.p.listCnt;
	                    var pageCnt = paging.p.pageCnt;
	                    
	                    var totalPageCnt = Math.ceil(total / listCnt);
	                    var max = Math.ceil(totalPageCnt / pageCnt);
	                    while (max * pageCnt > index + pageCnt) {
	                        index += pageCnt;
	                    }
	                    var remainListCnt = total - listCnt * (index - 1);
	                    var remainPageCnt = Math.floor(remainListCnt / listCnt);
	                    if (remainListCnt % listCnt != 0) {
	                        remainPageCnt++;
	                    }
	                    var pageLastNum = 0;
	                    if (remainListCnt <= listCnt) {
	                        pageLastNum = index;
	                    } else if (remainPageCnt <= pageCnt) {
	                        pageLastNum = remainPageCnt + index - 1;
	                    } else {
	                        pageLastNum = pageCnt + index - 1;
	                    }
	                    paging.p.pageStartNum = index;
	                    paging.p.index = index-1;
	                    paging.ajax();
	                });
	            }else {
	                $('.nextBtn').children('li').remove();
	            }
	        },
	        remove : function() {
	            $('.preBtn').children('li').remove();
	            $('.index').html('1');
	            $('.nextBtn').children('li').remove();
	        }
	};

	</script>
	
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
	                    point = "★";
	                }else if(obj.list[i].point == "2"){
	                	point = "★★";
	                }else if(obj.list[i].point == "3"){
	                	point = "★★★";
	                }else if(obj.list[i].point == "4"){
	                	point = "★★★★";
	                }else if(obj.list[i].point == "5"){
	                	point = "★★★★★";
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

	</script>
	
	<style type="text/css">
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
		
		.pagination {
		  display: inline-block;
		  padding-left: 0px;
		  margin: auto;
		  border-radius: 4px;
		}
		.pagination > li {
		  display: inline;
		}
		.pagination > li > a,
		.pagination > li > span {
		  position: relative;
		  float: left;
		  padding: 6px 12px;
		  margin-left: -1px;
		  line-height: 1.42857143;
		  color: #337ab7;
		  text-decoration: none;
		  background-color: #fff;
		  border: 1px solid #ddd;
		}
		.pagination > li:first-child > a,
		.pagination > li:first-child > span {
		  margin-left: 0;
		  border-top-left-radius: 4px;
		  border-bottom-left-radius: 4px;
		}
		.pagination > li:last-child > a,
		.pagination > li:last-child > span {
		  border-top-right-radius: 4px;
		  border-bottom-right-radius: 4px;
		}
		.pagination > li > a:hover,
		.pagination > li > span:hover,
		.pagination > li > a:focus,
		.pagination > li > span:focus {
		  color: #23527c;
		  background-color: #eee;
		  border-color: #ddd;
		}
		.pagination > .active > a,
		.pagination > .active > span,
		.pagination > .active > a:hover,
		.pagination > .active > span:hover,
		.pagination > .active > a:focus,
		.pagination > .active > span:focus {
		  z-index: 2;
		  color: #fff;
		  cursor: default;
		  background-color: #337ab7;
		  border-color: #337ab7;
		}
		.pagination > .disabled > span,
		.pagination > .disabled > span:hover,
		.pagination > .disabled > span:focus,
		.pagination > .disabled > a,
		.pagination > .disabled > a:hover,
		.pagination > .disabled > a:focus {
		  color: #777;
		  cursor: not-allowed;
		  background-color: #fff;
		  border-color: #ddd;
		}
		.pagination-lg > li > a,
		.pagination-lg > li > span {
		  padding: 10px 16px;
		  font-size: 18px;
		}
		.pagination-lg > li:first-child > a,
		.pagination-lg > li:first-child > span {
		  border-top-left-radius: 6px;
		  border-bottom-left-radius: 6px;
		}
		.pagination-lg > li:last-child > a,
		.pagination-lg > li:last-child > span {
		  border-top-right-radius: 6px;
		  border-bottom-right-radius: 6px;
		}
		.pagination-sm > li > a,
		.pagination-sm > li > span {
		  padding: 5px 10px;
		  font-size: 12px;
		}
		.pagination-sm > li:first-child > a,
		.pagination-sm > li:first-child > span {
		  border-top-left-radius: 3px;
		  border-bottom-left-radius: 3px;
		}
		.pagination-sm > li:last-child > a,
		.pagination-sm > li:last-child > span {
		  border-top-right-radius: 3px;
		  border-bottom-right-radius: 3px;
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
                                <li class="breadcrumb-item"><a href="#">전자기기</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12 col-lg-7">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(/billy/resources/img/product-img/pro-big-1.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(/billy/resources/img/product-img/pro-big-2.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(/billy/resources/img/product-img/pro-big-3.jpg);">
                                    </li>
                                    <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(/billy/resources/img/product-img/pro-big-4.jpg);">
                                    </li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="gallery_img" href="/billy/resources/img/product-img/pro-big-1.jpg">
                                            <img class="d-block w-100" src="/billy/resources/img/product-img/pro-big-1.jpg" alt="First slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="/billy/resources/img/product-img/pro-big-2.jpg">
                                            <img class="d-block w-100" src="/billy/resources/img/product-img/pro-big-2.jpg" alt="Second slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="/billy/resources/img/product-img/pro-big-3.jpg">
                                            <img class="d-block w-100" src="/billy/resources/img/product-img/pro-big-3.jpg" alt="Third slide">
                                        </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="gallery_img" href="/billy/resources/img/product-img/pro-big-4.jpg">
                                            <img class="d-block w-100" src="/billy/resources/img/product-img/pro-big-4.jpg" alt="Fourth slide">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-5">
                        <div class="single_product_desc">
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">18000 원</p>
                                <a href="product-details.html">
                                    <h6>더러운 신발</h6>
                                </a>
                                <!-- Ratings & Review -->
                                <div class="ratings-review mb-15 d-flex align-items-center justify-content-between">
                                    <div class="ratings">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                    <div class="review">
                                        <a href="#" style="color:red">신고하기</a>
                                    </div>
                                </div>
                                <!-- Avaiable -->
                                
                            </div>

                            <div class="short_overview my-5">
                                <p>나의 더러운 신발을 빌려줍니다. 물론 공짜는 아닙니다............ㅇㄹㅇㄹㅇㄹㅇㄹㅇㄹㅇㄹㅇㄹㅇㄹㅇㄹ</p>
                            </div>
							<div id="map" style="width:300px;height:300px; float:left;"></div>
							<br><br><br><br><h3>거래지역주소</h3>
							<div id="mapAddress">서울특별시 강남구 테헤란로14길 6</div>
							
						
                            <!-- Add to Cart Form -->
                            <form class="cart clearfix" method="post" style="clear:both;">
                            	<br><br>
                                <div class="cart-btn d-flex mb-50">
                                    <p>갯수</p>
                                    <div class="quantity">
                                        <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                        <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
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
			    <!-- <tr>
			        <td>user01</td>
			        <td id="point1">
			        	<div class="ratings">
                        	<i class="fa fa-star" aria-hidden="true"></i>
                        	<i class="fa fa-star" aria-hidden="true"></i>
                        	<i class="fa fa-star" aria-hidden="true"></i>
                        	<i class="fa fa-star" aria-hidden="true"></i>
                        	<i class="fa fa-star" aria-hidden="true"></i>
                    	</div>
			        </td>
			        <td id="content1"></td>
			        <td id="date1"></td>
			        <td id="img1"></td>
			    </tr> -->
			    </tbody>
			</table>
			<!--맨 첫페이지 이동 -->
			<!--이전 페이지 이동 -->
			<ul class="pagination preBtn"></ul>
			<!--페이지번호 -->
			<ul class="pagination index"></ul>
			<!--다음 페이지 이동 -->
			<!--마지막 페이지 이동 -->
			<ul class="pagination nextBtn"></ul>
			
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
			dateFormat: "Y-m-d H:i"
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