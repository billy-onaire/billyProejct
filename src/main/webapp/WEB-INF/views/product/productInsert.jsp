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
    <title>상품등록</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <!-- <link rel="stylesheet" href="/billy/resources/css/style.css"> -->
    <link  href="/billy/resources/css/datepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <style type="text/css">
      /*datepicker에서 사용한 이미지 버튼 style적용*/
      img.ui-datepicker-trigger {
        margin-left:5px; 
        vertical-align:middle; 
        cursor:pointer;
        width: 8%;
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
                    <div class="col-12 col-lg-7">
                     <div class="single_product_desc">
                        <!-- Product Meta Data -->
                        <div class="product-meta-data">
                            <div class="line"></div>
                            <p class="product-price">상품등록</p>

                        </div>
                        
                        <br><br><br>
                       
                        <form action="productinsert.do" method="post"  enctype="multipart/form-data" onsubmit="return validate();">
                          <div class="form-group">                              
                              <div class="row">
                                  <div class="col-sm-6">
                                    <label for="sel1">대 카테고리 : </label>
                                    <BR>
                                    <select class="form-control" id="sel1" name="sel1" onchange="categoryChange(this)">
                                        <option>카테고리를 선택해주세요.</option>
                                        <option value="LIVING">LIVING</option>
                                        <option value="SPORTS">SPORTS</option>
                                        <option value="ELECTRONICS">ELECTRONICS</option>
                                        <option value="CLOTHES">CLOTHES</option>
                                        <option value="KIDS">KIDS</option>
                                        <option value="ETC">ETC</option>
                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <label for="sel2">세부 카테고리 : </label><BR>
                                    <select multiple class="form-control" id="sel2" name="sel2">
                                        
                                    </select>
                                </div>
                              </div> 
                          </div>
                        <div class="row">
                          <div class="col-sm-8"">
                            <div class="form-group">
                              <label for="usr">상품명(최대 20글자):</label>
                              <input type="text" class="form-control" id="product_name" name="product_name" maxlength="20" required>
                          	</div>
                     	 </div>
                      	<div class="col-sm-4"">
                       		<div class="form-group">
                          		<label for="usr">상품수량:</label>
                          		<input type="text" class="form-control" id="product_quantity" name="product_quantity" style="width: 50%;" maxlength="2" required>
                      		</div>
                  		</div>
              			</div>
             			 <br>
                               
                              <div class="form-group">
                                  <label for="usr">상품설명:</label><br>
                                  <textarea class="form-control" id="product_content" name="product_content" rows="10" style="resize: none; width:100%;" placeholder="최대 500글자 작성 가능합니다." required></textarea>          
                              </div>
                              <div class="form-group">
                                  <label for="usr">대여가(원):</label>
                                  <input type="text" class="form-control" id="price" name="price" maxlength="6" placeholder="100만원 이하 입력" required style="width: 50%">
                              </div>
                              
                            <!-- <div class="container">
                                <br>
                                <br>
                                <div class="form-horizontal"> -->
                                  <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label">상품사진(최대 4장 가능)</label>
                                        <div class="col-md-20">
                                            <div class="row">
                                                <div id="coba"></div>
                                            </div>
                                        </div>
                                    </div>                     
                                    </div>              
                                <!-- </div>  
                            </div> -->

                          <h3>직거래주말여부</h3>
                          <div class="form-check">
                              <label class="form-check-label" for="radio1">
                                <input type="radio" class="form-check-input" id="radio1" name="weekend_yn" value="Y" checked>가능
                            </label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label" for="radio2">
                            <input type="radio" class="form-check-input" id="radio2" name="weekend_yn" value="N">불가능
                        </label>
                    </div>
					          <br>
                    <div class="form-group">
                        <label for="pwd">직거래가능요일(월,화,수,목,금):</label><br>
                        <div class="form-check-inline">
                          <label class="form-check-label" for="check1">
                            <input type="checkbox" class="form-check-input" id="check1" name="weekday_yn" value="monday" checked>월
                         </label>
                         </div>
                        <div class="form-check-inline">
                            <label class="form-check-label" for="check2">
                            <input type="checkbox" class="form-check-input" id="check2" name="weekday_yn" value="tuesday" checked>화
                            </label>
                        </div>
	                	    <div class="form-check-inline">
	                  		  <label class="form-check-label" for="check3">
	                   		    <input type="checkbox" class="form-check-input" id="check3" name="weekday_yn" value="wendsday" checked>수
	                		    </label>
	            		      </div>
	            		      <div class="form-check-inline">
                          <label class="form-check-label" for="check4">
                           <input type="checkbox" class="form-check-input" id="check4" name="weekday_yn" value="thursday" checked>목
                          </label>
                        </div>
                        <div class="form-check-inline">
                          <label class="form-check-label" for="check5">
                            <input type="checkbox" class="form-check-input" id="check5" name="weekday_yn" value="friday" checked>금
                          </label>
                        </div>
                     </div>
                     
                     <div class="row">
                                  <div class="col-sm-6">
                                    <label for="sel1">대여가능시작일 </label>
                                    <BR>
                                    <input data-toggle="datepicker" id="product_startdate" name="product_startdate" type="text" readonly>
                                </div>
                                <div class="col-sm-6">
                                    <label for="sel2">대여가능종료일</label><BR>
                                    <input data-toggle="datepicker" id="product_enddate" name="product_enddate" type="text" readonly>
                                </div>
                     </div>
                    
                              <!-- <input data-toggle="datepicker" type="text"> -->
                              <br><br>
                              <button type="submit" name="addtocart" value="5" class="btn amado-btn">상품등록하기</button>

                      </form>
                      
                      
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

        <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" type="text/javascript" language="javascript"></script> -->
        <!-- datepicker css,js -->
        <!-- <script src="//github.com/fyneworks/multifile/blob/master/jquery.MultiFile.min.js" type="text/javascript" language="javascript"></script> -->
        <!-- <script src="/billy/resources/js/datepicker.js"></script> -->
        <script src="/billy/resources/js/jquery-ui.js"></script>
        <!-- <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
        <!-- Popper js -->
        <script src="/billy/resources/js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="/billy/resources/js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="/billy/resources/js/plugins.js"></script>
        <!-- Active js -->
        <!-- <script src="js/active.js"></script>
        <!-- multi image picker.js https://www.jqueryscript.net/form/Multiple-Image-Picker-jQuery-Spartan.html-->
        <script type="text/javascript" src="/billy/resources/js/spartan-multi-image-picker.js"></script>
        
        <script type="text/javascript">
        function categoryChange(e) {
          var good_a = ["생활 용품", "주방 용품", "가구/인테리어", "키덜트/취미"];
          var good_b = ["야구 용품", "농구 용품", "축구 용품", "트레이닝/기타 용품"];
          var good_c = ["핸드폰", "컴퓨터", "스피커", "모니터/영상기기", "카메라/주변기기", "계절가전"];
          var good_d = ["여성 의류", "남성 의류", "여성 신발", "남성 신발", "여성 가방/잡화", "남성 가방/잡화"];
          var good_e = ["출산/돌 기념품", "장난감", "아동의류", "임부복/소품", "유아안전/실내용품", "수유용품"];
          var good_f = ["기타"];
          var target = document.getElementById("sel2");
            if(e.value == "LIVING") var d = good_a;
            else if(e.value == "SPORTS") var d = good_b;
            else if(e.value == "ELECTRONICS") var d = good_c;
            else if(e.value == "CLOTHES") var d = good_d;
            else if(e.value == "KIDS") var d = good_e;
            else if(e.value == "ETC") var d = good_f;
         
          target.options.length = 0;
         
          for (x in d) {
            var opt = document.createElement("option");
            opt.value = d[x];
            opt.innerHTML = d[x];
            target.appendChild(opt);
          } 
          
        }

        </script>
        
        <script type="text/javascript">
           $(function() {  
            
              
              // 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
              // 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가

              //시작일.
              $('#product_startdate').datepicker({
                showOn: "both",           // 달력을 표시할 타이밍 (both: focus or button)
                buttonImage: "/billy/resources/img/productinput/calendar.png", // 버튼 이미지
                buttonImageOnly : true,       // 버튼 이미지만 표시할지 여부
                buttonText: "날짜선택",       // 버튼의 대체 텍스트
                dateFormat: "yy-mm-dd",       // 날짜의 형식
                format: 'yyyy-mm-dd',
                changeMonth: true,          // 월을 이동하기 위한 선택상자 표시여부
                //minDate: 0,           // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                onClose: function( selectedDate ) { 
                  // 시작일(fromDate) datepicker가 닫힐때
                  // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                  $("#product_enddate").datepicker( "option", "minDate", selectedDate );
                }       
              });

              //종료일
              $('#product_enddate').datepicker({
                showOn: "both", 
                buttonImage: "/billy/resources/img/productinput/calendar.png", 
                buttonImageOnly : true,
                buttonText: "날짜선택",
                dateFormat: "yy-mm-dd",
                format: 'yyyy-mm-dd',
                changeMonth: true,
                //minDate: 0, // 오늘 이전 날짜 선택 불가
                onClose: function( selectedDate ) {
                  // 종료일(toDate) datepicker가 닫힐때
                  // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                  $("#product_startdate").datepicker( "option", "maxDate", selectedDate );
                }       
              });
            });

        /*$(function(){
        	$('#product_startdate').datepicker({ 
        		format: 'yyyy-mm-dd',
        		dateFormat: 'yyyy-mm-dd',
            onClose: function( selectedDate ) {    
                        // 시작일(fromDate) datepicker가 닫힐때
                        // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                        $("#product_enddate").datepicker( "option", "minDate", selectedDate );
            }  
            
        	});
            $('#product_enddate').datepicker({ 
            	format: 'yyyy-mm-dd',
            	dateFormat: 'yyyy-mm-dd',
              onClose: function( selectedDate ) {
                        // 종료일(toDate) datepicker가 닫힐때
                        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                        $("#product_startdate").datepicker( "option", "maxDate", selectedDate );
                    }
              
            });
        });*/
        </script>
        <script type="text/javascript">
        $(function(){

            $("#coba").spartanMultiImagePicker({
                fieldName:        'fileUpload[]',
                maxCount:         4,
                rowHeight:        '200px',
                groupClassName:   'col-md-4 col-sm-4 col-xs-6',
                maxFileSize:      '5000000',
                placeholderImage: {
                    image: '/billy/resources/img/productinput/placeholder.png',
                    width : '100%'
                },
                dropFileLabel : "Drop Here",
                onAddRow:       function(index){
                    console.log(index);
                    console.log('add new row');
                },
                onRenderedPreview : function(index){
                    console.log(index);
                    console.log('preview rendered');
                },
                onRemoveRow : function(index){
                    console.log(index);
                },
                onExtensionErr : function(index, file){
                    console.log(index, file,  'extension err');
                    alert('png, jpg 파일만 업로드 가능합니다.')
                },
                onSizeErr : function(index, file){
                    console.log(index, file,  'file size too big');
                    alert('파일 사이즈가 너무 큽니다.');
                }
            });
        });
        </script>
        <script type="text/javascript">
          $("#coba").find('img').each(function(){
            console.log($(this).attr('src'));
          });
        </script>

        <script type="text/javascript">
          //가격, 수량 input에 숫자만 입력되게 처리

          //3자리 단위마다 콤마 생성
          function addCommas(x) {
              return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
          }
             
          //모든 콤마 제거
          function removeCommas(x) {
            if(!x || x.length == 0) return "";
                else return x.split(",").join("");
          }

          $("#price").on("focus", function() {
            var x = $(this).val();
            x = removeCommas(x);
            $(this).val(x);
          }).on("focusout", function() {
            var x = $(this).val();
            if(x && x.length > 0) {
              if(!$.isNumeric(x)) {
                x = x.replace(/[^0-9]/g,"");
              }
              /* x = addCommas(x); */  //3자리 단위마다 콤마 생성
              $(this).val(x);
            }
          }).on("keyup", function() {
            //앞자리에 0이 입력 안되게
            $(this).val($(this).val().replace(/[^0-9]|(^0+)/g,""));
          });

          $("#product_quantity").on("focus", function() {
            var x = $(this).val();
            $(this).val(x);
          }).on("focusout", function() {
            var x = $(this).val();
            if(x && x.length > 0) {
              if(!$.isNumeric(x)) {
                x = x.replace(/[^0-9]/g,"");
              }
              $(this).val(x);
            }
          }).on("keyup", function() {
            //앞자리에 0이 입력 안되게
            $(this).val($(this).val().replace(/[^0-9]|(^0+)/g,""));
          });
        </script>
        <script type="text/javascript">
          $('#product_content').on('keyup', function() {

            if($(this).val().length > 500) {

                alert("글자수는 500자로 이내로 제한됩니다.");

              $(this).val($(this).val().substring(0, 500));

            }
            //컨솔 확인용
            console.log($('#product_startdate').val());
            $("#datepicker").datepicker("getDate");
          });

        </script>
        <script type="text/javascript">
          //form 전송시 입력값 확인
          function validate() {
            if($('#sel1').val() == '카테고리를 선택해주세요.'){
              alert("카테고리를 선택해주세요");
              $('#sel1').focus();
              return false;
            }
            if($('#sel2').val() == null){
              alert('세부카테고리를 선택해주세요');
              $('#sel2').focus();
              return false;
            }
            /*if($('._img').val() == null){
              alert('사진을 등록해주세요.');
              $('#coba').focus();
              return false;
            }*/
            
            /*if($('._img').attr('src') == null){*/
            if($('.img_').attr('src') == undefined){
              alert('사진을 등록해주세요.');
              $('#coba').focus();
              return false;
            }
            if($('#product_startdate').val() == null || $('#product_startdate').val() == ""){
              alert('대여가능시작일 입력하세요');
              $('#product_startdate').focus();
              return false;
            }
            if($('#product_enddate').val() == null  || $('#product_enddate').val() == ""){
              alert('대여가능종료일 입력하세요');
              $('#product_enddate').focus();
              return false;
            }
            /* alert($('#price').val()); */
            /* $('#price').val() = $('#price').val().replace(',' , ''); */
            /* ($('#price').val()).replace(/,/g, '');
            alert($('#price').val()); */
          }
        </script>
</body>

</html>