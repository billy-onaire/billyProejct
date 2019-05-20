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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>회원정보 수정</title>

<script type="text/javascript" src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
<script type="text/javascript"></script>


<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">

<style>



#profile_img{
	width: 80px;
    height: 80px;
    border-radius: 80px;
    margin-top: 70px;
    margin-left: 140px;
}
#myname{
    margin-left: 120px;
    font-size: 20px;
}

#pe1{
	margin-top: 100px;
	margin-left: 10px;
}
#pe2{
	margin-left: 10px;
}
#myaddress{
	margin-top: 10px;
	margin-left: 10px;
}
#locationa{
	margin-top: 10px;
	margin-left: 10px;
}

</style>
</head>

<body>

	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">
	<c:import url="../common/nav.jsp" />
	<c:import url="../common/myPage.jsp" />
	
	<div class="container" style="margin-top:30px">
        <div class="row">
          <div class="col-sm-4">
            <h4>프로필</h4>
            <div class="card" style="width: 350px; height: 300px;">
            <c:if test="${!empty loginMember}">
       			<div class="cart-fav-search mb-100" id="socialLogin">
       			<c:if test="${loginMember.social_type eq 'naver' or loginMember.social_type eq 'kakao'}">
       			<img id="profile_img"  src="${loginMember.profile }">&nbsp;<br><br> <span id="myname">이름: ${fn:replace(loginMember.user_name, "+", " ") }</span>
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'google'}">
       			<img id="profile_img"  src="${loginMember.profile }">&nbsp; <span id="myname">이름: ${fn:replace(loginMember.sname, "+", " ") }</span>
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'facebook'}">
       			<img id="profile_img"  src="/billy/resources/img/social-img/fLogo.JPG">&nbsp; <span id="myname">이름: ${fn:replace(loginMember.user_name, "+", " ") }</span>
       			</c:if>		
       			<c:if test="${loginMember.social_type eq 'user' }">
       			<img id="profile_img"  src="/billy/resources/img/social-img/basic.JPG"><br> <span id="myname">이름: ${fn:replace(loginMember.user_name, "+", " ") }</span>
       			</c:if>
       		</div>
       		</c:if>
            
            </div>
            <br>

            <h4>내 주소</h4>
            <div class="card" style="width: 350px; height: 300px;">
            <c:if test="${!empty loginMember}">
       			<div id="myaddress" class="cart-fav-search mb-100" id="socialLogin">
       			<c:if test="${loginMember.social_type eq 'naver' or loginMember.social_type eq 'kakao'}">
       			<div id="myAddress" >${loginMember.address }</div>
       			<div id="map1" style="width:325px;height:250px; float:left;"></div>  			
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'google'}">
       			<div id="myAddress" >${loginMember.address }</div>
       			<div id="map1" style="width:325px;height:250px; float:left;"></div>
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'facebook'}">
       			<div id="myAddress" >${loginMember.address }</div>
       			<div id="map1" style="width:325px;height:250px; float:left;"></div>
       			</c:if>		
       			<c:if test="${loginMember.social_type eq 'user' }">
       			<div id="myAddress" >${loginMember.address }</div>
       			<div id="map1" style="width:325px;height:250px; float:left;"></div>
       			</c:if>
       			<script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>     
       			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e2688930bfd694b41af56058fd0928e&libraries=services"></script>
							<script>
							var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
							    mapOption = {
							        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };  
							
							// 지도를 생성합니다    
							var map = new daum.maps.Map(mapContainer, mapOption); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new daum.maps.services.Geocoder();
							
							
							var mapAddress = $("#myAddress").text();
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
       			
       		</div>
       		</c:if>      
            </div>
            <hr class="d-sm-none">
             </div>
        
            <div class="col-sm-8">
            <h4>내 연락처</h4>
            <div class="card" style="width: 350px; height: 300px;">
            <c:if test="${!empty loginMember}">
       			<div class="cart-fav-search mb-100" id="socialLogin">
       			<c:if test="${loginMember.social_type eq 'naver' or loginMember.social_type eq 'kakao'}">
       			<p id="pe1">연락가능 휴대전화 : <input type="text" value="${loginMember.user_mobile }" style="border:none" readonly></p>
       			<p id="pe2">연락가능 이메일 : <input type="text" value="${loginMember.email }" style="border:none" readonly></p> 
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'google'}">
       			<p id="pe1">연락가능 휴대전화 : <input type="text" value="${loginMember.user_mobile }" style="border:none" readonly></p>
       			<p id="pe2">연락가능 이메일 : <input type="text" value="${loginMember.email }" style="border:none" readonly></p> 
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'facebook'}">
       			<p id="pe1">연락가능 휴대전화 : <input type="text" value="${loginMember.user_mobile }" style="border:none" readonly></p>
       			<p id="pe2">연락가능 이메일 : <input type="text" value="${loginMember.email }" style="border:none" readonly></p> 
       			</c:if>		
       			<c:if test="${loginMember.social_type eq 'user' }">
       			<p id="pe1">연락가능 휴대전화 : <input type="text" value="${loginMember.user_mobile }" style="border:none" readonly></p>
       			<p id="pe2">연락가능 이메일 : <input type="text" value="${loginMember.email }" style="border:none" readonly></p> 
       			</c:if>
       		</div>
       		</c:if>
            
            </div>
           
            <br>
            <h4>거래가능 지역</h4>
            <div class="card"  style="width: 350px; height: 300px;">
            <c:if test="${!empty loginMember}">
       			<div id="locationa" class="cart-fav-search mb-100" id="socialLogin">
       			<c:if test="${loginMember.social_type eq 'naver' or loginMember.social_type eq 'kakao'}">
       			<div id="locationA" >${loginMember.location_area }</div>
       			<div id="map2" style="width:325px;height:250px; float:left;"></div>
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'google'}">
       			<div id="locationA" >${loginMember.location_area }</div>
       			<div id="map2" style="width:325px;height:250px; float:left;"></div>
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'facebook'}">
       			<div id="locationA" >${loginMember.location_area }</div>
       			<div id="map2" style="width:325px;height:250px; float:left;"></div>
       			</c:if>		
       			<c:if test="${loginMember.social_type eq 'user' }">
       			<div id="locationA" >${loginMember.location_area }</div>
       			<div id="map2" style="width:325px;height:250px; float:left;"></div>
       			</c:if>
       			<script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>     
       			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9e2688930bfd694b41af56058fd0928e&libraries=services"></script>
							<script>
							var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
							    mapOption = {
							        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							        level: 3 // 지도의 확대 레벨
							    };  
							
							// 지도를 생성합니다    
							var map = new daum.maps.Map(mapContainer, mapOption); 
							
							// 주소-좌표 변환 객체를 생성합니다
							var geocoder = new daum.maps.services.Geocoder();
							
							
							var mapAddress = $("#locationA").text();
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
       			
       		</div>
       		</c:if>
       		  
            </div>
          </div>
        </div>
      </div>
    </div>
	
	
	<c:import url="../common/footer.jsp" />
	
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

</body>

</html>