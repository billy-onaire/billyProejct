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
    <title>공지사항</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
	<!-- Material Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">    
    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <!-- include summernote css/js-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <!-- <link href="/billy/resources/css/summernote-bs4.css" rel="stylesheet"> -->
    <style>
    .material-icons {
         font-family: 'Material Icons';
         font-weight: normal;
         font-style: normal;
         font-size: 17px;  /* Preferred icon size 기본 사이즈 24px*/ 
         display: inline-block;
         line-height: 1;
         text-transform: none;
         letter-spacing: normal;
         word-wrap: normal;
         white-space: nowrap;
         direction: ltr;                                                      

         /* Support for all WebKit browsers. */
         -webkit-font-smoothing: antialiased;
         /* Support for Safari and Chrome. */
         text-rendering: optimizeLegibility;

         /* Support for Firefox. */
         -moz-osx-font-smoothing: grayscale;

         /* Support for IE. */
         font-feature-settings: 'liga';
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
        
            <div class="container-fluid" style="border: 1px;">
            
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
                                <div style="width:100%; ">
                                   <ul class="list-group">               
                                        <li class="list-group-item list-group-item" style="">
                                            <div class="notice-file" style="width: 70%; float: left; line-height: 0px;"><h2>${notice.notice_title }</h2>
                                                 <div><span  style="font-size: 13px; color: #ccc;"></span>
                                                </div> 
                                            </div>
                                            <div class="notice-eye" style="width: 30%; float: left;">
                                                 <i class="material-icons" >
                                                    remove_red_eye                                    
                                                </i>
                                                <span style="font-size: 15px;">${notice.notice_readcount }</span>
                                                 <div><span  style="font-size: 13px; color: #ccc;">${notice.notice_date}</span>
                                                </div>                                               
                                            </div>
                                        </li>
                                         <c:if test="${!empty notice.notice_renamefile }">
                                        <li class="list-group-item list-group-item" style="">
                                             <div class="notice-filedown" style="">
                                            <i class="material-icons">
                                                attach_file
                                            </i>
                                            <a href="noticefiledown.do?of=${notice.notice_originalfile }&rf=${notice.notice_renamefile}">${notice.notice_originalfile}</a>
                                            
                                        </div>
                                        </li>
                                        </c:if>
                                        <li class="list-group-item list-group-item" style="">
                                            <div class="notice-content" style="width: 100%; float: left;"><p>${notice.notice_content }</p></div>
                                        </li>
                                    </ul>
                                    <button class="btn btn-warning" onclick="gonoticelist()">목록</button>
                                </div>
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
        <!-- summernote js-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
        <script type="text/javascript" src="/billy/resources/js/summernote-ko-KR.js"></script>
        <!-- naver smart editor js-->
        <script type="text/javascript" src="/billy/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

        <!-- 파일 첨부 시 이름 미리 보여지기 -->
        <script type="text/javascript">           
            // Add the following code if you want the name of the file appear on select
            $(".custom-file-input").on("change", function() {
              var fileName = $(this).val().split("\\").pop();
              $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
            });                
        </script>
        <script type="text/javascript">
           $('#summernote').summernote({
            placeholder: 'Hello bootstrap 4',
            tabsize: 2,
            height: 100,
            placeholder: '내용을 작성하세요.',
            lang: 'ko-KR',
            
          });
           //$('#summernote').summernote('focus');
        </script>
        <!-- 네이버 스마트 에디터 -->
       
        <script type="text/javascript">
        alert('${curpage}');
            function gonoticelist(){
                location.href="noticelist.do?select=${select}&keyword=${keyword}&curpage=${curpage}";
            }
        </script>
        </body>

</html>