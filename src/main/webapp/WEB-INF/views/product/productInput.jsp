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
    <title>Amado - Furniture Ecommerce Template | Cart</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <!-- <link rel="stylesheet" href="/billy/resources/css/style.css"> -->
    <link  href="/billy/resources/css/datepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
    
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
                       
                        <form action="productinput.do" method="post"  enctype="multipart/form-data">
                           <div class="form-group">
                              <label for="usr">카테고리:</label><br>
                              <select onchange="categoryChange(this)">
								  <option>카테고리를 선택해주세요.</option>
								  <option value="a">LIVING</option>
								  <option value="b">SPORTS</option>
								  <option value="c">ELECTRONICS</option>
								  <option value="c">CLOTHES</option>
								  <option value="c">KIDS</option>
								  <option value="c">ETC</option>
								</select>
 
							<select id="good">
							<option>세부카테고리를 선택해주세요.</option>
							</select>
                              <br>
                              <div class="row">
                                  <div class="col-sm-6">
                                    <label for="sel1">대 카테고리 : </label>
                                    <BR>
                                    <select class="form-control" id="sel1" name="sellist1" onchange="categoryChange(this)">
                                        <option value="a">LIVING</option>
                                        <option value="b">SPORTS</option>
                                        <option>ELECTRONICS</option>
                                        <option>CLOTHES</option>
                                        <option>KIDS</option>
                                        <option>ETC</option>
                                    </select>
                                </div>
                                <div class="col-sm-6">
                                    <label for="sel2">세부 카테고리 : </label><BR>
                                    <select multiple class="form-control" id="sel2" name="sellist2">
                                        
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col-sm-8"">
                            <div class="form-group">
                              <label for="usr">상품명:</label>
                              <input type="text" class="form-control" id="product_name" name="product_name">
                          	</div>
                     	 </div>
                      	<div class="col-sm-4"">
                       		<div class="form-group">
                          		<label for="usr">상품수량:</label>
                          		<input type="text" class="form-control" id="product_quantity" name="product_quantity" style="width: 50%;">
                      		</div>
                  		</div>
              			</div>
             			 <br>
                               
                              <div class="form-group">
                                  <label for="usr">상품설명:</label><br>
                                  <textarea class="form-control" id="product_content" name="product_content" rows="10" style="resize: none; width:100%;" placeholder="최대 500글자 작성 가능합니다."></textarea>          
                              </div>
                              <div class="form-group">
                                  <label for="usr">대여가:</label>
                                  <input type="text" class="form-control" id="price" name="price">
                              </div>
                              <!-- <div class="form-group">
                                  <label for="pwd">상품사진:</label>
                                  <input type="password" class="form-control" id="pwd" name="password">
                              </div> -->

                                <!-- <div class="form-group">
                                <label for="InputSubject1">파일첨부</label>
                                <input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
                                <div class="bootstrap-filestyle input-group">
                                <input type="text" id="userfile" class="form-control" name="userfile" disabled="">
                                <span class="group-span-filestyle input-group-btn" tabindex="0">
                                <label for="fileInput" class="btn btn-default ">
                                <span class="glyphicon fa fa-upload"></span>
                                </label>
                                </span>
                                </div>
                            </div> -->
                            <div class="container">
                                <br>
                                <br>
                                <div class="form-horizontal">
                                    <div class="form-group">
                                        <label class="control-label col-md-3">상품사진(최대 4장 가능)</label>
                                        <div class="col-md-20">
                                            <div class="row">

                                                <div id="coba"></div>
                                            </div>
                                        </div>
                                    </div>                                   
                                </div>  
                            </div>



                           <!--  <div class="form-group">
                              <label for="usr">대여불가일:</label>
                              <input type="text" class="form-control" id="username" name="username">
                          </div>
                          <div class="form-group">
                              <label for="usr">직거래불가일:</label>
                              <input type="text" class="form-control" id="username" name="username">
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
					
                    <div class="form-group">
                        <label for="pwd">직거래가능요일(월,화,수,목,금):</label><br>
                        <div class="form-check-inline">
                          <label class="form-check-label" for="check1">
                            <input type="checkbox" class="form-check-input" id="check1" name="weekday_yn" value="mon">월
                         </label>
                         </div>
                        <div class="form-check-inline">
                            <label class="form-check-label" for="check2">
                            <input type="checkbox" class="form-check-input" id="check2" name="weekday_yn" value="tue">화
                            </label>
                        </div>
	                	<div class="form-check-inline">
	                  		<label class="form-check-label" for="check3">
	                   		<input type="checkbox" class="form-check-input" id="check3" name="weekday_yn" value="wend">수
	                		</label>
	            		</div>
	            		<div class="form-check-inline">
	              			<label class="form-check-label" for="check4">
	                		<input type="checkbox" class="form-check-input" id="check4" name="weekday_yn" value="thur">목
	            			</label>
	        			</div>
	        			<div class="form-check-inline">
	          				<label class="form-check-label" for="check5">
	            			<input type="checkbox" class="form-check-input" id="check5" name="weekday_yn" value="fri">금
	        				</label>
    					</div>
                                    <!-- <div class="form-check-inline">
                                      <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" disabled>수
                                      </label>
                                  </div> -->
                     </div>
                     <div class="row">
                                  <div class="col-sm-6">
                                    <label for="sel1">대여가능시작일 </label>
                                    <BR>
                                    <input data-toggle="datepicker" id="product_startdate" name="product_startdate" type="text">
                                </div>
                                <div class="col-sm-6">
                                    <label for="sel2">대여가능종료일</label><BR>
                                    <input data-toggle="datepicker" id="product_enddate" name="product_enddate" type="text">
                                </div>
                     </div>
                              <!-- <input data-toggle="datepicker" type="text"> -->
                              
                              <button type="submit" name="addtocart" value="5" class="btn amado-btn">상품등록하기</button>
                 </form>



                          <!-- Add to Cart Form -->
                         <!--  <form class="cart clearfix" method="post">
                            <div class="cart-btn d-flex mb-50">
                                <p>Qty</p>
                                <div class="quantity">
                                    <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty > 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                    <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                    <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                </div>
                            </div>
                            <button type="submit" name="addtocart" value="5" class="btn amado-btn">상품등록하기</button>
                        </form> -->

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
        <script src="/billy/resources/js/datepicker.js"></script>
        <!-- Popper js -->
        <script src="/billy/resources/js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="/billy/resources/js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="/billy/resources/js/plugins.js"></script>
        <!-- Active js -->
        <!-- <script src="js/active.js"></script> -->
        <!-- multi image picker.js https://www.jqueryscript.net/form/Multiple-Image-Picker-jQuery-Spartan.html-->
        <script type="text/javascript" src="/billy/resources/js/spartan-multi-image-picker.js"></script>
        
        <script type="text/javascript">
        function categoryChange(e) {
  var good_a = ["생활용품", "주방용품", "가구/인테리어", "키덜트/취미"];
  var good_b = ["야구용품", "농구용품", "축구용품", "트레이닝/기타용품"];
  var good_c = ["핸드폰", "컴퓨터", "스피커", "모니터/영상기기", "카메라/주변기기", "계절가전"];
  var good_d = ["여성의류", "남성의류", "여성신발", "남성신발", "여성가방/잡화", "남성가방/잡화"];
  var good_e = ["출산/돌기념품", "장난감", "아동의류", "임부복/소품", "유아안전/실내용품", "수유용품"];
  var good_f = ["기타"];
  var target = document.getElementById("good");
 
  if(e.value == "a") var d = good_a;
  else if(e.value == "b") var d = good_b;
  else if(e.value == "c") var d = good_c;
    else if(e.value == "d") var d = good_d;
  else if(e.value == "e") var d = good_e;
    else if(e.value == "f") var d = good_f;
 
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
        $(function(){
        	$('#product_startdate').datepicker({ 
        		format: 'yyyy-mm-dd',
        		dateFormat: 'yyyy-mm-dd'
        	});
            $('#product_enddate').datepicker({ 
            	format: 'yyyy-mm-dd',
            	dateFormat: 'yyyy-mm-dd' 
            });
        });
        </script>
<script type="text/javascript">
        $(function(){

            $("#coba").spartanMultiImagePicker({
                fieldName:        'fileUpload[]',
                maxCount:         5,
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



</body>

</html>