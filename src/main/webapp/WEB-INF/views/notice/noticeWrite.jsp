<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" >
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>공지사항 글 쓰기</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
	
    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <style>
   
    .main-content-wrapper{
        z-index: 1050;
    }
    .btn-warning{
        color: white;
     }
    </style>
</head>

<body>
     <!-- Search Wrapper Area Start -->
    <div class="search-wrapper section-padding-100">
        <div class="search-close">
            <i class="fa fa-close" aria-hidden="true"></i>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="search-content">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type your keyword...">
                            <button type="submit"><img src="/billy/resources/img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Product Details Area Start -->
        <c:import url="../common/adminNav.jsp" />
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">
            
                <div class="row">
                
                   <div class="col-12">
                   
                        <div class="single_product_desc">
                        
                            <!-- Product Meta Data -->
                            <div class="product-meta-data">
                                <div class="line"></div>
                                <p class="product-price">공지사항</p>
            
                            </div>
                            
                            <br><br><br><br>
                                                     
                           <div class="container">
                                <h2>공지사항 글 쓰기</h2>
                                <form method="post" action="insertnotice.do" id="noticefrm" enctype="multipart/form-data"  >
                                <div class="form-group">
                                    <input type="text" name="notice_title" id="notice_title" class="form-control" placeholder="제목을 입력하세요." maxlength="25" required>
                                </div>
                                <div class="custom-file mb-3">
                                  <input type="file" class="custom-file-input" id="file" name="file"  onchange="checkFile(this)">
                                  <label class="custom-file-label" for="customFile">Choose file</label>
                                </div>
                                  <textarea name="notice_content" id="notice_content" rows="10" cols="100" ></textarea>
                                  <button class="btn btn-warning" onclick="return confirm('정말로 취소하시겠습니까?')">취소</button>
                                  <!-- <button type="submit" class="btn btn-primary pull-right" onclick="return confirm('정말로 등록하시겠습니까?')">등록</button> -->
                                  <button  class="btn btn-warning pull-right" onclick="return submitContents();">등록</button>
                                </form>
                           </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>      
    <!-- Product Details Area End -->      
</div>
<!-- ##### Main Content Wrapper End ##### -->



    <c:import url="../common/adminFooter.jsp" />

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->

        <script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>

        <script src="/billy/resources/js/jquery-ui.js"></script>
        <!-- Popper js -->
        <script src="/billy/resources/js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="/billy/resources/js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="/billy/resources/js/plugins.js"></script>
        <script src="/billy/resources/js/active2.js"></script>
        <!-- naver smart editor js-->
        <script type="text/javascript" src="/billy/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

        <!-- 파일 첨부 시 이름 미리 보여지기 -->
        <script type="text/javascript">           
        	$(".custom-file-input").on("load", function() {
            var fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
          	});   
            // Add the following code if you want the name of the file appear on select
            $(".custom-file-input").on("change", function() {
              var fileName = $(this).val().split("\\").pop();
              $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
            });                
            
            function checkFile(f){
            	var file = f.files;
	            if(file[0].size > 1024 * 1024 * 8){
	                // 용량 초과시 경고후 해당 파일의 용량도 보여줌
	                alert('8MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
	                
	                $('#file').val('');
	            }	
            }
        </script>
        
        <!-- 네이버 스마트 에디터 -->
        <script type="text/javascript">
            
            var oEditors = [];
            nhn.husky.EZCreator.createInIFrame({
             oAppRef: oEditors,
             elPlaceHolder: "notice_content",
             sSkinURI: "/billy/resources/se2/SmartEditor2Skin.html",
             fCreator: "createSEditor2"
            });
            
            function submitContents() {
                oEditors.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD", []);
                try {
                	if($('#notice_title').val().length < 4){
                		alert('공지 제목은 4글자 이상 입력해주세요.');
                		return false;
                	}else if(document.getElementById("notice_content").value.length < 15){
                		alert('최소한의 내용을 입력해주세요.');
                		return false;
                	}else{
                    $('#noticefrm').submit();
                	}
                } catch(e) {}
                
            }
        </script>
        <script type="text/javascript">
                        
        </script>
        </body>

</html>