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
<script type="text/javascript">
$(function() {

        $.ajax({
           url : "pCount.do",
            type : "post",
            dataType: "json",
            data : {userId : $("#user_id").val()},
            success : function(jsonData) {
               console.log("ajax procnt success 확인 : " + jsonData.procnt);
               console.log("ajax paycnt success 확인 : " + jsonData.paycnt);
               console.log("ajax paycnt success 확인 : " + jsonData.paywcnt);
               
                 
                   $(".result").text(jsonData.procnt + ' 개');
                   
                   if(jsonData.paycnt > 0){
                   $(".result1").text(jsonData.paycnt + '건');
                   }else{
                   $(".result1").text('0 건');	   
                   }
                   
                   if(jsonData.paywcnt > 0){
                   $(".result2").text(jsonData.paywcnt + '건');
                   }else{
                   $(".result2").text('0 건');   
                   }
               
            },
            error : function(error) {
                
                alert("error : " + error);
            }
        });               
          
});

$(function() {

	$("#idck").click(function() {
		
		
	});
	
});

</script>


<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">


<style>



#profile_img{
	width: 80px;
    height: 80px;
    border-radius: 80px;
    margin-top: 0px;
    margin-left: 138px;
}
#myname{
    margin-left: 130px;
    font-size: 17px;
}

#pe1{
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

#comment{
	width: 730px;
}


</style>
</head>

<body>

	<!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">
	<c:import url="../common/nav.jsp" />
	<c:import url="../common/myPage.jsp" />
	
	<div class="amado_product_area section-padding-100">
	<div class="container" style="margin-top:30px">
			<div class="row">
				<div class="col-sm-8 flex-column d-flex stretch-card">
					<div class="row">
						<div class="col-lg-4 grid-margin stretch-card">
							<div class="card sale-diffrence-border">
								<div class="card-body">
									<h5 class="text-dark mb-2">거래완료/취소</h5>
									<p class="result1" onclick="location.href='paymentSearch.do'"></p>
									<div class="progress mb-3">
									<div class="progress-bar  bg-warning" role="progressbar"
											style="width: 100%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="100"></div>									
								    </div>
								     
								</div>
							</div>
						</div>
						<div class="col-lg-4 grid-margin stretch-card">
							<div class="card sale-diffrence-border">
								<div class="card-body">
									<h5 class="text-dark mb-2">거래대기</h5>
									<p class="result2" onclick="location.href='paymentWaiting.do'"></p>
									<div class="progress mb-3">
									<div class="progress-bar  bg-primary" role="progressbar"
											style="width: 100%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="120"></div>
								    </div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 grid-margin stretch-card">
							<div class="card sale-diffrence-border">
								<div class="card-body">
									<h5 class="text-dark mb-2">등록물품수</h5>
									<p class="result" onclick="location.href='myproductlist.do'"></p>
									<div class="progress mb-3">
									<div class="progress-bar  bg-success" role="progressbar"
											style="width: 100%" aria-valuenow="0" aria-valuemin="0"
											aria-valuemax="120"></div>
								    </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
        <div class="row">
        <input type="hidden" id="user_id" name="user_id" value="${loginMember.user_id }">
          <div class="col-sm-4">
            <label for="comment">Profile:</label>
            <div class="card" style="width: 350px; height: 300px;">
            <c:if test="${!empty loginMember}">
							<div class="d-flex justify-content-md">
								<div class="pr-1 mb-3 mb-xl-0">
										<button type="button" id="edit" name="edit" class="btn btn-outline-inverse-info btn-icon-text btn-sm text-white bg-info" onclick="location.href='mupage.do'">
											수정하기
											<i class="fas fa-edit"></i>                           
										</button>
								</div>
							</div>
       			<div class="cart-fav-search mb-100" id="socialLogin">
       			<c:if test="${loginMember.social_type eq 'naver' or loginMember.social_type eq 'kakao'}">
       			<img id="profile_img"  src="${loginMember.profile }">&nbsp;<br> <span id="myname">이름: ${fn:replace(loginMember.user_name, "+", " ") }</span>
       			<br><br>
       			<p id="pe1">연락가능 휴대전화 : <input type="text" value="${loginMember.user_mobile }" style="border:none" readonly></p>
       			<p id="pe2">연락가능 이메일 : <input type="text" value="${loginMember.email }" style="border:none" readonly></p> 
       			<p id="pe2">내 주소 : <input type="text" value="${loginMember.address }" style="border:none" readonly></p> 
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'google'}">
       			<img id="profile_img"  src="${loginMember.profile }">&nbsp;<br> <span id="myname">이름: ${fn:replace(loginMember.sname, "+", " ") }</span>
       			<br><br>
       			<p id="pe1">연락가능 휴대전화 : <input type="text" value="${loginMember.user_mobile }" style="border:none" readonly></p>
       			<p id="pe2">연락가능 이메일 : <input type="text" value="${loginMember.email }" style="border:none" readonly></p> 	
       			<p id="pe2">내 주소 : <input type="text" value="${loginMember.address }" style="border:none" readonly></p> 
       			</c:if>
       			<c:if test="${loginMember.social_type eq 'facebook'}">
       			<img id="profile_img"  src="/billy/resources/img/social-img/fLogo.JPG">&nbsp; <span id="myname">이름: ${fn:replace(loginMember.user_name, "+", " ") }</span>
				<br><br>
       			<p id="pe1">연락가능 휴대전화 : <input type="text" value="${loginMember.user_mobile }" style="border:none" readonly></p>
       			<p id="pe2">연락가능 이메일 : <input type="text" value="${loginMember.email }" style="border:none" readonly></p>
       			<p id="pe2">내 주소 : <input type="text" value="${loginMember.address }" style="border:none" readonly></p> 
       			</c:if>		
       			<c:if test="${loginMember.social_type eq 'user' }">
       			<img id="profile_img"  src="/billy/resources/img/social-img/basic.JPG"><br><span id="myname">이름: ${fn:replace(loginMember.user_name, "+", " ") }</span>
       			<br><br>
       			<p id="pe1">연락가능 휴대전화 : <input type="text" value="${loginMember.user_mobile }" style="border:none" readonly></p>
       			<p id="pe2">연락가능 이메일 : <input type="text" value="${loginMember.email }" style="border:none" readonly></p> 
       			<p id="pe2">내 주소 : <input type="text" value="${loginMember.address }" style="border:none" readonly></p> 
       			</c:if>
       		</div>
       		</c:if>
            
            </div>
            <br>
			
			<!-- 자기소개 -->
            <div class="form-group">
 				 <label for="comment">My Comment:</label>
 				 <div class="card" style="width: 730px; height: 250px;">
 				<p>${loginMember.my_introduce }</p>
 				</div>
 				 
			</div>

             </div>
        	
            <div class="col-sm-8">
            <label for="comment">Possible transaction area:</label>
            <div class="card" style="width: 350px; height: 300px;">
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
           
            <br>
            
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