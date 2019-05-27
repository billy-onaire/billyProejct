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
    <title>Amado - Furniture Ecommerce Template | Checkout</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <link rel="stylesheet" href="/billy/resources/css/style.css">

	<style type="text/css">
		table.type04 {
		    border-collapse: separate;
		    border-spacing: 1px;
		    text-align: center;
		    line-height: 1.5;
		    border-top: 1px solid #ccc;
		  margin : 20px 10px;
		}
		table.type04 th {
		    width: 350px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: center;
		    border-bottom: 1px solid #ccc;
		}
		table.type04 td {
		    width: 650px;
		    padding: 10px;
		    vertical-align: center;
		    border-bottom: 1px solid #ccc;
		}
		.starR{
		  background: url('/billy/resources/img/review-point/point_star.png') no-repeat right 0;
		  background-size: auto 100%;
		  width: 30px;
		  height: 30px;
		  display: inline-block;
		  text-indent: -9999px;
		  cursor: pointer;
		}
		.starR.on{background-position:0 0;}
	</style>
</head>

<body>
   
    <!-- Search Wrapper Area End -->
    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">
	<c:import url="../common/nav.jsp" />
	<c:import url="../common/myPage.jsp" />
	<div class="amado_product_area section-padding-100">
	<h1>Review</h1>
		<form id="form" class="cart clearfix" method="post" enctype="multipart/form-data" action="insertReview.do">
                   <br><br>       	
            <table class="type04">
			    <tr>
			        <th rowspan="2"><img src="/billy/resources/files/product/${img}" width="300px" height="300px"></th>
			        <td>${name }</td>
			    </tr>
			    <tr>
			        <td>${begin }  ~  ${end }</td>
			    </tr>
			    <tr>
			        <th>사진첨부</th>
			        <td><input type="file" name="img"></td>
			    </tr>
			    <tr>
			        <th>별점</th>
			        <td><div class="starRev">
					  <span class="starR on">1</span>
					  <span class="starR">2</span>
					  <span class="starR">3</span>
					  <span class="starR">4</span>
					  <span class="starR">5</span>
					</div></td>
			    </tr>
			    <tr>
			        <th>대여후기</th>
			        <td><div class="col-12 mb-3">
                        <textarea name="review_content" class="form-control w-100" id="comment" cols="30" rows="5" 
                        placeholder="대여한 제품에 대한 간단한 평가를 해주세요 (30자 이내)"></textarea>
                        </div>
                    </td>
			    </tr>
			</table>
        	<center><button type="button" name="addtocart" value="5" class="btn amado-btn" onclick="formSubmit();">작성완료</button></center>
        	<input type="hidden" name="point" id="point" value="1">
        	<input type="hidden" name="product_no" value="${pNo }">
        	<input type="hidden" name="payment_no" value="${payNo }">
        </form>
    </div>
 	</div>
    <!-- ##### Main Content Wrapper End ##### -->
	<c:import url="../common/footer.jsp" />
   


    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript">
    $('.starRev span').click(function(){
    	  $(this).parent().children('span').removeClass('on');
    	  $(this).addClass('on').prevAll('span').addClass('on');
    	  var point = $(this).text();
    	  $("#point").val(point);
    	  return false;
    	});
    
    function fnChkByte(obj) {
        var maxByte = 100; //최대 입력 바이트 수
        var str = obj.value;
        var str_len = str.length;
     
        var rbyte = 0;
        var rlen = 0;
        var one_char = "";
        var str2 = "";
     
        for (var i = 0; i < str_len; i++) {
            one_char = str.charAt(i);
     
            if (escape(one_char).length > 4) {
                rbyte += 3; //한글3Byte
            } else {
                rbyte++; //영문 등 나머지 1Byte
            }
     
            if (rbyte <= maxByte) {
                rlen = i + 1; //return할 문자열 갯수
            }
        }
     
        if (rbyte > maxByte) {
            alert("한글  30자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
            str2 = str.substr(0, rlen); //문자열 자르기
            obj.value = str2;
            fnChkByte(obj, maxByte);
        } else {
            document.getElementById('byteInfo').innerText = rbyte;
        }
    }
    </script>
    
    <!-- 폼 전송 스크립트 -->
    <script type="text/javascript">
    function formSubmit(){
    	if($("#comment").val() == ""){
    		alert("대여후기를 작성해주세요!!");
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