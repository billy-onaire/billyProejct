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
    <title>상품수정</title>

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
      .upreview{
        width: 160px;
      	height: 180px;
        border:  1px dashed #bcbcbc;
      }
      .upreview .realimg{
        /*margin-top: 10px;*/
        height: 130px;
        width: 160px;
        cursor: pointer;
      }
      .imgbackground{
        height: 130px;
        width: 160px;
        cursor: pointer;
      }

      
      /* .upreview img{
		position: absolute;
		width: 320;
		height: 160;
      } */
      #file-input{
        display: none;

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
	<c:import url="../common/myPage.jsp" />
	
       

        <!-- Product Details Area Start -->
        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">


                <div class="row">
                    <div class="col-12">
                     <div class="single_product_desc">
                        <!-- Product Meta Data -->
                        <div class="product-meta-data">
                            <div class="line"></div>
                            <p class="product-price">상품등록</p>

                        </div>
                        
                        <br><br><br>
                       
                        <form action="myproductupdate.do" method="post"  enctype="multipart/form-data" onsubmit="return validate();">
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
                              <input type="text" class="form-control" id="product_name" name="product_name" maxlength="20" value="${product.product_name }" required>
                          	</div>
                     		</div>
                      		<div class="col-sm-4"">
                       		<div class="form-group">
                          		<label for="usr">상품수량:</label>
                          		<input type="text" class="form-control" id="product_quantity" name="product_quantity" style="width: 50%;" maxlength="2" value="${product.product_quantity }"required>
                      		</div>
                  			</div>
              			</div>
             			 <br>
                               
                              <div class="form-group">
                                  <label for="usr">상품설명:</label><br>
                                  <textarea class="form-control" id="product_content" name="product_content" rows="10" style="resize: none; width:100%;" placeholder="최대 500글자 작성 가능합니다." required>${product.product_content }</textarea>          
                              </div>
                              <div class="form-group">
                                  <label for="usr">대여가(원):</label>
                                  <input type="text" class="form-control" id="price" name="price" maxlength="6" placeholder="100만원 이하 입력" value="${product.price }" required style="width: 50%">
                              </div>
                              
                            <!-- <div class="container">
                                <br>
                                <br>
                                <div class="form-horizontal"> -->
                                  <div class="container">
                                  	<h3>이미 올린 사진</h3>
                                    <img class="img-fluid" src="/billy/resources/files/product/${product.first_img }" alt="Chania" width="230" height="170">
                                    
                                    <c:if test="${!product.second_img eq null }">
                                    <img class="img-fluid" src="/billy/resources/files/product/${product.second_img }" alt="Chania" width="230" height="170"> 
                                    </c:if>
                                    <c:if test="${!product.third_img eq null }">
                                    <img class="img-fluid" src="/billy/resources/files/product/${product.third_img }" alt="Chania" width="230" height="170"> 
                                    </c:if>
                                    <c:if test="${!product.fourth_img eq null }">
                                    <img class="img-fluid" src="/billy/resources/files/product/${product.fourth_img }" alt="Chania" width="230" height="170"> 
                                  	</c:if>
                                  </div>


                                  <input type="file" name="files1" accept="image/*" onchange="previewImage(this)" />
                					<div id="preview" class="upreview">
                                    <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true" onclick="closeImage()">&times;</span>
                                  </button>
                                  <label for="file-input">
                                    <p  id="imgbackground1">
                                    <img src="/billy/resources/img/productinput/placeholder.png" class="imgbackground">
                                    </p>
                                  </label>
                                  <input type="file" name="files1" accept="image/*" onchange="previewImage(this)" id="file-input"/>
                                  <span id='preview2'></span>
                                  </div>
                                  <button onclick="checkval()">사진여부확인</button>
									
									
									<div id="preview" class="upreview">
                                    <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true" onclick="closeImage()">&times;</span>
                                  </button>
                                  <label for="file-input">
                                    <p  id="imgbackground1">
                                    <img src="/billy/resources/img/productinput/placeholder.png" class="imgbackground">
                                    </p>
                                  </label>
                                  <input type="file" name="files1" accept="image/*" onchange="previewImage(this)" id="file-input"/>
                                  <span id='preview2'></span>
                                  </div>
									
									<br><br>
									<script type="text/javascript">
									function previewImage(f){

										var file = f.files;

										// 확장자 체크
										if(!/\.(gif|jpg|jpeg|png)$/i.test(file[0].name)){
											alert('gif, jpg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

											// 선택한 파일 초기화
											f.outerHTML = f.outerHTML;

											document.getElementById('preview2').innerHTML = '';

										}
										else {

											// FileReader 객체 사용
											var reader = new FileReader();

											// 파일 읽기가 완료되었을때 실행
											reader.onload = function(rst){
												document.getElementById('preview2').innerHTML = '<img class="realimg" src="' + rst.target.result + '">';
											}

											// 파일을 읽는다
											reader.readAsDataURL(file[0]);
                      						document.getElementById('imgbackground1').innerHTML = '';  
                      checkval(reader);
										}
									}
                  function closeImage(){
                    document.getElementById('preview2').innerHTML = '';
                    document.getElementById('imgbackground1').innerHTML = '<img class="imgbackground" src="/billy/resources/img/productinput/placeholder.png">';
                    
                  }
                  function checkval(reader){
                   console.log($('.realimg').attr('src'));
                    console.log($('#file-input').val());
                  }
									</script>
									
                                  
                                  <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label">상품사진(최대 4장 가능)</label>
                                        <div class="col-md-20">
                                            <div class="row">
                                                <div id="coba">
													<%-- <div class="col-md-4 col-sm-4 col-xs-6 spartan_item_wrapper" data-spartanindexrow="0" style="margin-bottom : 20px; ">
													<div style="position: relative;">
													<div class="spartan_item_loader" data-spartanindexloader="0" style=" position: absolute; width: 100%; height: 200px; background: rgba(255,255,255, 0.7); z-index: 22; text-align: center; align-items: center; margin: auto; justify-content: center; flex-direction: column; display : none; font-size : 1.7em; color: #CECECE">
													<i class="fas fa-sync fa-spin"></i>
													</div>
													<label class="file_upload" style="width: 100%; height: 200px; border: 2px dashed #ddd; border-radius: 3px; cursor: pointer; text-align: center; overflow: hidden; padding: 5px; margin-top: 5px; margin-bottom : 5px; position : relative; display: flex; align-items: center; margin: auto; justify-content: center; flex-direction: column;">
													<a href="javascript:void(0)" data-spartanindexremove="0" style="right: 3px; top: 3px; background: rgb(237, 60, 32); border-radius: 3px; width: 30px; height: 30px; line-height: 30px; text-align: center; text-decoration: none; color: rgb(255, 255, 255); position: absolute !important;" class="spartan_remove_row">
													<i class="fas fa-times"></i></a>
													<img style="width: 100%; margin: 0px auto; vertical-align: middle; display: none;" data-spartanindexi="0" src="/billy/resources/img/productinput/placeholder.png" class="spartan_image_placeholder"> 
													<p data-spartanlbldropfile="0" style="color : #5FAAE1; display: none; width : auto; ">Drop Here</p>
													<img style="width: 100%; vertical-align: middle;" class="img_" data-spartanindeximage="0" src="/billy/resources/files/product/${product.first_img }">
													<input class="form-control spartan_image_input" accept="image/*" data-spartanindexinput="0" style="display : none" name="fileUpload[]" type="file"></label> 
													</div>
													</div>	  
													<div class="col-md-4 col-sm-4 col-xs-6 spartan_item_wrapper" data-spartanindexrow="0" style="margin-bottom : 20px; ">
													<div style="position: relative;">
													<div class="spartan_item_loader" data-spartanindexloader="0" style=" position: absolute; width: 100%; height: 200px; background: rgba(255,255,255, 0.7); z-index: 22; text-align: center; align-items: center; margin: auto; justify-content: center; flex-direction: column; display : none; font-size : 1.7em; color: #CECECE">
													<i class="fas fa-sync fa-spin"></i>
													</div>
													<label class="file_upload" style="width: 100%; height: 200px; border: 2px dashed #ddd; border-radius: 3px; cursor: pointer; text-align: center; overflow: hidden; padding: 5px; margin-top: 5px; margin-bottom : 5px; position : relative; display: flex; align-items: center; margin: auto; justify-content: center; flex-direction: column;">
													<a href="javascript:void(0)" data-spartanindexremove="0" style="right: 3px; top: 3px; background: rgb(237, 60, 32); border-radius: 3px; width: 30px; height: 30px; line-height: 30px; text-align: center; text-decoration: none; color: rgb(255, 255, 255); position: absolute !important;" class="spartan_remove_row">
													<i class="fas fa-times"></i></a>
													<img style="width: 100%; margin: 0px auto; vertical-align: middle; display: none;" data-spartanindexi="1" src="/billy/resources/img/productinput/placeholder.png" class="spartan_image_placeholder"> 
													<p data-spartanlbldropfile="1" style="color : #5FAAE1; display: none; width : auto; ">Drop Here</p>
													<img style="width: 100%; vertical-align: middle;" class="img_" data-spartanindeximage="1" src="/billy/resources/files/product/${product.first_img }">
													<input class="form-control spartan_image_input" accept="image/*" data-spartanindexinput="1" style="display : none" name="fileUpload[]" type="file"></label> 
													</div>
													</div>  --%>
													  													                                          	
                                                </div>
                                            </div>
                                        </div>
                                    </div>                     
                                    </div>              
                                <!-- </div>  
                            </div> -->

                          <h3>직거래주말여부</h3>
                          <c:forTokens items="${product.weekend_yn }" delims="," var="s">
	                        <c:if test="${s eq 'Y' }">
								<c:set var="checked6" value="checked"/>
							</c:if>
							<c:if test="${s eq 'N' }">
								<c:set var="checked7" value="checked"/>
							</c:if>		
                        </c:forTokens>
                          <div class="form-check">
                              <label class="form-check-label" for="radio1">
                                <input type="radio" class="form-check-input" id="radio1" name="weekend_yn" value="Y" ${checked6 }>가능
                            </label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label" for="radio2">
                          
                            <input type="radio" class="form-check-input" id="radio2" name="weekend_yn" value="N" ${checked7 }>불가능
                        </label>
                    </div>
					          <br>
                    <div class="form-group">
                        <label for="pwd">직거래가능요일(월,화,수,목,금):</label><br>
                        <c:forTokens items="${product.weekday_yn }" delims="," var="s">
	                        <c:if test="${s eq 'monday' }">
								<c:set var="checked0" value="checked"/>
							</c:if>
							<c:if test="${s eq 'tuesday' }">
								<c:set var="checked1" value="checked"/>
							</c:if>		
							<c:if test="${s eq 'wendsday' }">
								<c:set var="checked2" value="checked"/>
							</c:if>
							<c:if test="${s eq 'thursday' }">
								<c:set var="checked3" value="checked"/>
							</c:if>		
							<c:if test="${s eq 'friday' }">
								<c:set var="checked4" value="checked"/>
							</c:if>		
                        </c:forTokens>
                        <div class="form-check-inline">
                          <label class="form-check-label" for="check1">
                            <input type="checkbox" class="form-check-input" id="check1" name="weekday_yn" value="monday" ${checked0 } >월
                         </label>
                         </div>
                        <div class="form-check-inline">
                            <label class="form-check-label" for="check2">
                            <input type="checkbox" class="form-check-input" id="check2" name="weekday_yn" value="tuesday" ${checked1 }>화
                            </label>
                        </div>
	                	 <div class="form-check-inline">
	                  		  <label class="form-check-label" for="check3">
	                   		    <input type="checkbox" class="form-check-input" id="check3" name="weekday_yn" value="wendsday" ${checked2 }>수
	                		    </label>
	            		  </div>
	            		 <div class="form-check-inline">
                          <label class="form-check-label" for="check4">
                           <input type="checkbox" class="form-check-input" id="check4" name="weekday_yn" value="thursday" ${checked3 }>목
                          </label>
                        </div>
                        <div class="form-check-inline">
                          <label class="form-check-label" for="check5">
                            <input type="checkbox" class="form-check-input" id="check5" name="weekday_yn" value="friday" ${checked4 }>금
                          </label>
                        </div>
                     </div>
                     
                     <div class="row">
                                  <div class="col-sm-6">
                                    <label for="sel1">대여가능시작일 </label>
                                    <BR>
                                    <input data-toggle="datepicker" id="product_startdate" name="product_startdate" type="text" value="${product.product_startdate }" readonly>
                                </div>
                                <div class="col-sm-6">
                                    <label for="sel2">대여가능종료일</label><BR>
                                    <input data-toggle="datepicker" id="product_enddate" name="product_enddate" type="text" value="${product.product_enddate }" readonly>
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
              x = addCommas(x);
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
            if($('#product_startdate').val() == null){
              alert('대여가능시작일 입력하세요');
              $('#product_startdate').focus();
              return false;
            }
            if($('#product_enddate').val() == null){
              alert('대여가능종료일 입력하세요');
              $('#product_enddate').focus();
              return false;
            }
          }
        </script>
        <script type="text/javascript">
        	/* DB에서 가져온 카테고리 선택되게 하는 스크립트  */
        	$('#sel1').val('${product.pcategory_name}');
			
        	/* 세부 카테고리가 체크 되게 하려면 먼저 sel1의 값에 맞게 세부카테고리가 출력 되게 함.  */
        	var e = $('#sel1').val();
        	var good_a = ["생활 용품", "주방 용품", "가구/인테리어", "키덜트/취미"];
            var good_b = ["야구 용품", "농구 용품", "축구 용품", "트레이닝/기타 용품"];
            var good_c = ["핸드폰", "컴퓨터", "스피커", "모니터/영상기기", "카메라/주변기기", "계절가전"];
            var good_d = ["여성 의류", "남성 의류", "여성 신발", "남성 신발", "여성 가방/잡화", "남성 가방/잡화"];
            var good_e = ["출산/돌 기념품", "장난감", "아동의류", "임부복/소품", "유아안전/실내용품", "수유용품"];
            var good_f = ["기타"];
            var target = document.getElementById("sel2");
              if(e == "LIVING") var d = good_a;
              else if(e == "SPORTS") var d = good_b;
              else if(e == "ELECTRONICS") var d = good_c;
              else if(e == "CLOTHES") var d = good_d;
              else if(e == "KIDS") var d = good_e;
              else if(e == "ETC") var d = good_f;
           
            target.options.length = 0;
           
            for (x in d) {
              var opt = document.createElement("option");
              opt.value = d[x];
              opt.innerHTML = d[x];
              target.appendChild(opt);
            } 
            /* 그 후 sel1의 값 선택  */
        	$('#sel2').val('${product.sub_pcategory_name}');
        	
        </script>
        
        </body>

</html>