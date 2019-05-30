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
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">

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

      .line{
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

      .upreview{
        width: 160px;
      	height: 180px;
        border:  1px dashed #bcbcbc;
        float: left; 

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
      .file-input{
        display: none;

      }
      /*.form-control{
        background-color: #f5f7fa;
      }*/
      
      #productdiv{
      background-color:#FAFAFA;
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
	<%-- <c:import url="../common/myPage.jsp" /> --%>
	
       

        <!-- Product Details Area Start -->
        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">


                <div class="row">
                    <div class="col-12" id="productdiv">
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
                              <input type="text" class="form-control" id="product_name" name="product_name" maxlength="20"  required>
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
                                  <label for="usr">상품설명(최대 500글자 작성가능):</label><br>
                                  <textarea class="form-control" id="product_content" name="product_content" rows="10" style="resize: none; width:100%;" placeholder="최대 500글자 작성 가능합니다." required>
거래 가능 지역  :   
연락 수단 : 카톡, 문자, 전화X   
기타사항 : </textarea>          
                              </div>
                              <div class="form-group">
                                  <label for="usr">대여가(원):</label>
                                  <input type="text" class="form-control" id="price" name="price" maxlength="6" placeholder="1000~100,000원 입력"  required style="width: 50%">
                              </div>
                              
                                <div class="row">
                                  <div class="col-sm-4">
                                    <h3>대표 이미지</h3>
                                  <!-- <input type="file" name="files1" accept="image/*" onchange="previewImage(this)" /> -->
                                    <div id="" class="upreview">
                                    <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true" onclick="closeImage(this)" class="closeImage">&times;</span>
                                  </button>
                                  <label for="file-input1">
                                    <p  id="imgbackground1">
                                    <img src="/billy/resources/img/productinput/placeholder.png" class="imgbackground"> 
                                    </p>
                                  </label>
                                  <input type="file" name="files1" accept="image/*" onchange="previewImage(this)" id="file-input1" class="file-input"/>
                                  <span id='preview1'></span>
                                  
                                  </div>
                                  </div><!-- 대표이미지 태그 닫기  -->
                                  <div class="col-sm-8">
                                    <h3>나머지 이미지</h3>
                                    <div id="" class="upreview"><!-- SECOND_IMG -->
                                    <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true" onclick="closeImage(this)" class="closeImage">&times;</span>
                                  </button>
                                  <label for="file-input2">
                                    <p  id="imgbackground2">                                    
                                    	<img src="/billy/resources/img/productinput/placeholder.png" class="imgbackground">                                      
                                    </p>
                                  </label>
                                  <input type="file" name="files2" accept="image/*" onchange="previewImage(this)" id="file-input2" class="file-input" />
                                  <span id='preview2'>
                                    
                                  </span>
                                  </div><!-- second_img div end -->

                                  <div id="" class="upreview"><!-- THIRD_IMG -->
                                    <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true" onclick="closeImage(this)" class="closeImage">&times;</span>
                                  </button>
                                  <label for="file-input3">
                                    <p  id="imgbackground3">
                                    <img src="/billy/resources/img/productinput/placeholder.png" class="imgbackground">
                                    </p>
                                  </label>
                                  <input type="file" name="files3" accept="image/*" onchange="previewImage(this)" id="file-input3" class="file-input"/>
                                  <span id='preview3'></span>
                                  </div><!-- third_img div end -->

                                  <div id="" class="upreview"><!-- FOURTH_IMG -->
                                    <button type="button" class="close" aria-label="Close">
                                    <span aria-hidden="true" onclick="closeImage(this)" class="closeImage">&times;</span>
                                  </button>
                                  <label for="file-input4">
                                    <p  id="imgbackground4">
                                    	<img src="/billy/resources/img/productinput/placeholder.png" class="imgbackground">
                                    </p>
                                  </label>
                                  <input type="file" name="files4" accept="image/*" onchange="previewImage(this)" id="file-input4" class="file-input"/>
                                  <span id='preview4'></span>
                                  </div><!-- fourth_img div end -->
                                </div><!-- 그 외 이미지 3장 태그 end  -->
                                  </div><!-- 사진등록 태그 닫기  -->
									
									<br><br>
									<script type="text/javascript">
                    /*$("input:file").on("change", function() {
                      var oFile = $(this)[0].files;
                      if(oFile.length < 1){
                        console.log('cancel was pressed');
                      }
                      else {
                        console.log(oFile[0].name);
                      }
                    });*/
									function previewImage(f){
                    /*console.log('황니용1 : ' + f);
                    console.log('황니용2 : ' + f.files);
                    console.log('황니용3 : ' + f.name);
                    console.log('황니용4 : ' + f.id);

                    console.log('확인용 5 : ' + $('#preview2').attr('id'));
                    console.log('확인용 6 : ' + $('.file-input').index(this));
                    console.log('황니용7 : ' + f.name.split('s')[1]);*/
										var file = f.files;

                    if(file.length < 1){
                      //파일이 없을 경우 즉 input file을 클릭하고 취소할 경우 미리보기 삭제
                      console.log('cancel was pressed');
                      document.getElementById('imgbackground'+f.name.split('s')[1]).innerHTML = '<img class="imgbackground" src="/billy/resources/img/productinput/placeholder.png">';
                    }else{
                      console.log('file.name');
                    }

										// 확장자 체크
										if(!/\.(jpg|jpeg|png)$/i.test(file[0].name)){
											alert('jpg, jpeg, png 파일만 선택해 주세요.\n\n현재 파일 : ' + file[0].name);

											// 선택한 파일 초기화
											f.outerHTML = f.outerHTML;

											document.getElementById('imgbackground'+f.name.split('s')[1]).innerHTML = '<img class="imgbackground" src="/billy/resources/img/productinput/placeholder.png">';

										}else if(file[0].size > 1024 * 1024 * 5){
                        // 용량 초과시 경고후 해당 파일의 용량도 보여줌
                        alert('5MB 이하 파일만 등록할 수 있습니다.\n\n' + '현재파일 용량 : ' + (Math.round(file[0].size / 1024 / 1024 * 100) / 100) + 'MB');
                        document.getElementById('imgbackground'+f.name.split('s')[1]).innerHTML = '<img class="imgbackground" src="/billy/resources/img/productinput/placeholder.png">';
                    }
										else {

											// FileReader 객체 사용
											var reader = new FileReader();

											// 파일 읽기가 완료되었을때 실행
											reader.onload = function(rst){
												document.getElementById('imgbackground'+f.name.split('s')[1]).innerHTML = '<img class="realimg" id="realimg'+f.name.split('s')[1]+'" src="' + rst.target.result + '">';
											}

											// 파일을 읽는다
											reader.readAsDataURL(file[0]);
                      						document.getElementById('imgbackground'+f.name.split('s')[1]).innerHTML = '';  
                      /*checkval(reader);*/
                      /*console.log('파일 확인 용 :' + f.value);*/
                      /*f.value(file[0].name);*/

                      /*console.log('파일 확인 용2 :' + $(f).val());*/

										}
									}
                  function closeImage(a){   
                    var realIndex =  Array.prototype.slice.call( document.getElementsByClassName('closeImage'), 0 );
                     var index = realIndex.indexOf(event.currentTarget)+1;
                    console.log(index);
                    document.getElementById('preview'+index).innerHTML = '';
                    document.getElementById('imgbackground'+index).innerHTML = '<img class="imgbackground" src="/billy/resources/img/productinput/placeholder.png">';
                    //close 클릭시 db에서 불러온 imgfile value 지움
                    $('#imgfile'+index).val('');
                  }
                  function checkval(reader){
                   console.log($('.realimg').attr('src'));
                    console.log($('#file-input').val());
                  }

									</script>	
									
                          
                         <h5>직거래주말여부</h5>
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
                                    <input data-toggle="datepicker" id="product_startdate" name="product_startdate" type="text"  readonly>
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

        	   $('#product_startdate').datepicker({
                   showOn: "both",           // 달력을 표시할 타이밍 (both: focus or button)
                   buttonImage: "/billy/resources/img/productinput/calendar.png", // 버튼 이미지
                   buttonImageOnly : true,       // 버튼 이미지만 표시할지 여부
                   buttonText: "날짜선택",       // 버튼의 대체 텍스트
                   dateFormat: "yy-mm-dd",       // 날짜의 형식
                   format: 'yyyy-mm-dd',
                   minDate: 0,
                   maxDate: 29,
                   changeMonth: true,          // 월을 이동하기 위한 선택상자 표시여부
                   //minDate: 0,           // 선택할수있는 최소날짜, ( 0 : 오늘 이전 날짜 선택 불가)
                   onClose: function( selectedDate ) { 
                     // 시작일(fromDate) datepicker가 닫힐때
                     // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    
                     var date = new Date(selectedDate);//선택한 날짜
   				date.setDate(date.getDate() + 1);//내일 날짜 설정
                      $("#product_enddate").datepicker( "option", "minDate", date); 
                     //mindate 옵션을 내일 날짜로 설정
                     if(selectedDate == ''){//startDate에 선택한 날짜가 없을 때
                   	  date = new Date();
                   	  date.setDate(date.getDate() + 1);
                   	  $("#product_enddate").datepicker( "option", "minDate", date);
                     }
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
                   minDate: 1,//시작일을 내일로
                   maxDate: 30,
                   changeMonth: true,
                   //minDate: 0, // 오늘 이전 날짜 선택 불가
                   onClose: function( selectedDate ) {
                     // 종료일(toDate) datepicker가 닫힐때
                     // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                     $("#product_startdate").datepicker( "option", "maxDate", selectedDate );
                   }       
                 });
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
            /*console.log($('#product_startdate').val());
            $("#datepicker").datepicker("getDate");*/
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
            
            
            if($('#product_content').val().length < 30 ){
              alert('상품에 대한 설명을 30자 이상 작성해주세요.');
              $('#product_content').focus();
              return false;
            }
            
            if($('#price').val() >100000 ||  $('#price').val() < 1000){
            	alert('금액은 1000~100000원까지 가능합니다.');
            	$('#price').focus();
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
            if($('#product_startdate').val() == $('#product_enddate').val()){
				alert('대여가능시작일과 종료일은 동일할 수 없습니다.');
				return false;
			}
           

            if($('#oldimg1').attr('src') == null && $('#realimg1').attr('src') == null){
              alert('대표 이미지는 필수 등록 해야 합니다.');
              $('#imgbackground1').click();
              return false;
            }

            if(confirm("등록 하시겠습니까?")) {
                alert('상품이 등록되었습니다.');
            } else {
            return false;
            }
          }
        </script>
        </body>

</html>