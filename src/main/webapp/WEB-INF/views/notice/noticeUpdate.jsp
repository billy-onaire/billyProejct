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
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    <style type="text/css">
        .material-icons {
         font-family: 'Material Icons';
         font-weight: normal;
         font-style: normal;
         font-size: 17px;  /* Preferred icon size 기본 사이즈 24px*/ 
         display: inline-block;
         line-height: 0;
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
    <c:import url="../common/adminNav.jsp" />

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
                                <h2>공지사항 수정</h2>
                                <form method="post" action="noticeupdate.do" id="noticefrm" enctype="multipart/form-data"  >
                                <input type="hidden" name="notice_no" id="notice_no" value="${notice.notice_no }">
                                <input type="hidden" name="notice_originalfile" id="notice_originalfile" value="${notice.notice_originalfile }">
                                
                                <div id="firstform">
                                <div class="form-group">
                                    <input type="text" name="notice_title" id="notice_title" class="form-control" placeholder="제목을 입력하세요."  value="${notice.notice_title }" required>
                                </div>
                                </div>
                                <c:if test="${!empty notice.notice_originalfile  }">
                                <div class="form-group" id="originfile">
                                    <span>${notice.notice_originalfile } 
                                    </span>
									<button type="button" onclick="filedelete();">삭제</button>
                                </div>
                                </c:if>
                                
                                
                                <c:if test="${empty notice.notice_originalfile  }">
                                <div class="custom-file mb-3" id="newfile">
                                
                                  <input type="file" class="custom-file-input" id="file" name="file">
                                  <label class="custom-file-label" for="customFile">Choose file</label>
                                </div>
                                </c:if>                                  
                                  <textarea name="notice_content" id="notice_content" rows="10" cols="100">${notice.notice_content }</textarea>
                                  <button class="btn btn-warning" onclick="return confirm('정말로 취소하시겠습니까?')">취소</button>
                                  <!-- <button type="submit" class="btn btn-primary pull-right" onclick="return confirm('정말로 등록하시겠습니까?')">등록</button> -->
                                  <button  class="btn btn-warning pull-right" onclick="submitContents();">수정</button>
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
                //alert(document.getElementById("notice_content").value);   

                try {
                    $('#noticefrm').submit();
                } catch(e) {}
            }

        </script>
        <script type="text/javascript">
             function filedelete(){
            	 $('#originfile').remove();
            	 //$('#notice_originalfile').remove();
            	 $('file').remove();
            	 $('#firstform').append('<div class="custom-file mb-3" id="newfile">'+
            			 '<input type="file" class="custom-file-input" id="file" name="file">'+
            			 '<label class="custom-file-label" for="customFile">Choose file</label></div>');
             }
               //아래와 같은 형식으로 해야 동적으로 자바스크립트 적용 됨.
               //파일 첨부 시 파일 이름 보여주기
             $(document).on("change",".custom-file-input",function(){
            	 var fileName = $(this).val().split("\\").pop();
                 $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
             });           
        </script>
        </body>

</html>