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
    <link rel="icon" href="img/core-img/favicon.ico">
	
    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <!-- include summernote css/js-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <!-- <link href="/billy/resources/css/summernote-bs4.css" rel="stylesheet"> -->
    <style>
    /*.line{
        width: 80px;
    height: 3px;
    background-color: #fbb710;
    margin-bottom: 15px;
    display: block;
    }
    .product-price{
    font-size: 24px;
    font-weight: 400;
    color: #fbb710;
    line-height: 1;
    margin-bottom: 10px;
    }
    
    .center {
      margin: auto;
      width: 90%;
      
      padding: 10px;
    }
    .centertwo {
      margin: auto;
      width: 60%;
      
      padding: 10px;
    }*/
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
    <c:import url="../common/nav.jsp" />

        <!-- Product Details Area Start -->
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
                                <!-- <div class="row">
                                    <div class="col-sm-10">
                                      One of three columns
                                    </div>
                                    <div class="col-sm-2">
                                      One of three columns
                                    </div>
                                    <div class="col-sm">
                                      One of three columns
                                    </div>
                                </div> -->

                                <h2>공지사항 글 쓰기</h2>
                                <form method="post" action="insertnotice.do" id="noticefrm" enctype="multipart/form-data"  >
                                <div class="form-group">
                                    <input type="text" name="notice_title" id="notice_title" class="form-control" placeholder="제목을 입력하세요." required>
                                </div>
                                <div class="custom-file mb-3">
                                  <input type="file" class="custom-file-input" id="file" name="file">
                                  <label class="custom-file-label" for="customFile">Choose file</label>
                                </div>
                                  <textarea name="notice_content" id="notice_content" rows="10" cols="100"></textarea>
                                  <button class="btn btn-warning" onclick="return confirm('정말로 취소하시겠습니까?')">취소</button>
                                  <!-- <button type="submit" class="btn btn-primary pull-right" onclick="return confirm('정말로 등록하시겠습니까?')">등록</button> -->
                                  <button  class="btn btn-warning pull-right" onclick="submitContents();">등록</button>
                                  <!-- onclick="submitContents();" -->
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



    <c:import url="../common/footer.jsp" />

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
        <script type="text/javascript" src="/billy/resources/SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

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
        </script>
        
        <!-- 네이버 스마트 에디터 -->
        <script type="text/javascript">
            
            var oEditors = [];
            nhn.husky.EZCreator.createInIFrame({
             oAppRef: oEditors,
             elPlaceHolder: "notice_content",
             sSkinURI: "/billy/resources/SE2/SmartEditor2Skin.html",
             fCreator: "createSEditor2"
            });
            
            function submitContents() {
                oEditors.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD", []);
                alert(document.getElementById("notice_content").value);   

                try {
                    $('#noticefrm').submit();
                } catch(e) {}
            }

        </script>
        <script type="text/javascript">
                        
        </script>
        </body>

</html>