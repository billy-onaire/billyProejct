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
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">
    <link  href="datepicker.css" rel="stylesheet">
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
                            <button type="submit"><img src="img/core-img/search.png" alt=""></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Wrapper Area End -->

    <!-- ##### Main Content Wrapper Start ##### -->
    <div class="main-content-wrapper d-flex clearfix">

        <!-- Mobile Nav (max width 767px)-->
        <div class="mobile-nav">
            <!-- Navbar Brand -->
            <div class="amado-navbar-brand">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Navbar Toggler -->
            <div class="amado-navbar-toggler">
                <span></span><span></span><span></span>
            </div>
        </div>

        <!-- Header Area Start -->
        <header class="header-area clearfix">
            <!-- Close Icon -->
            <div class="nav-close">
                <i class="fa fa-close" aria-hidden="true"></i>
            </div>
            <!-- Logo -->
            <div class="logo">
                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
            </div>
            <!-- Amado Nav -->
            <nav class="amado-nav">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="shop.html">Shop</a></li>
                    <li><a href="product-details.html">Product</a></li>
                    <li class="active"><a href="cart.html">Cart</a></li>
                    <li><a href="checkout.html">Checkout</a></li>
                </ul>
            </nav>
            <!-- Button Group -->
            <div class="amado-btn-group mt-30 mb-100">
                <a href="#" class="btn amado-btn mb-15">%Discount%</a>
                <a href="#" class="btn amado-btn active">New this week</a>
            </div>
            <!-- Cart Menu -->
            <div class="cart-fav-search mb-100">
                <a href="cart.html" class="cart-nav"><img src="img/core-img/cart.png" alt=""> Cart <span>(0)</span></a>
                <a href="#" class="fav-nav"><img src="img/core-img/favorites.png" alt=""> Favourite</a>
                <a href="#" class="search-nav"><img src="img/core-img/search.png" alt=""> Search</a>
            </div>
            <!-- Social Button -->
            <div class="social-info d-flex justify-content-between">
                <a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
            </div>
        </header>
        <!-- Header Area End -->

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
                        <!-- <h2>상품을 등록하세요.</h2>
                        <p>ㅁㅇㄴㄹㄴㅁㅇㄻㅇㄹ</p> -->
                        <form action="/action_page.php">
                           <div class="form-group">
                              <label for="usr">카테고리:</label>
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

                              <input type="text" class="form-control" id="username" name="username">
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
                              <input type="text" class="form-control" id="username" name="username">
                          </div>
                      </div>
                      <div class="col-sm-4"">
                       <div class="form-group">
                          <label for="usr">상품수량:</label>
                          <input type="text" class="form-control" id="username" name="username" style="width: 50%;">
                      </div>
                  </div>
              </div>
              <br>
                                <!-- <div class="form-group">
                                  <label for="usr">상품명:</label>
                                  <input type="text" class="form-control" id="username" name="username">
                                </div>
                                <div class="form-group">
                                  <label for="usr">상품수량:</label>
                                  <input type="text" class="form-control" id="username" name="username">
                              </div> -->
                              <div class="form-group">
                                  <label for="usr">상품설명:</label><br>
                                  <textarea ckass="form-control" rows="10" style="resize: none; width:100%;" placeholder="최대 500글자 작성 가능합니다."></textarea>          
                              </div>
                              <div class="form-group">
                                  <label for="usr">대여가:</label>
                                  <input type="text" class="form-control" id="username" name="username">
                              </div>
                              <div class="form-group">
                                  <label for="pwd">상품사진:</label>
                                  <input type="password" class="form-control" id="pwd" name="password">
                              </div>

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
                                        <label class="control-label col-md-3">Upload Image</label>
                                        <div class="col-md-8">
                                            <div class="row">

                                                <div id="coba"></div>
                                            </div>
                                        </div>
                                    </div>                                   
                                </div>  
                            </div>



                            <div class="form-group">
                              <label for="usr">대여불가일:</label>
                              <input type="text" class="form-control" id="username" name="username">
                          </div>
                          <div class="form-group">
                              <label for="usr">직거래불가일:</label>
                              <input type="text" class="form-control" id="username" name="username">
                          </div>
                          <h3>주말여부</h3>
                          <div class="form-check">
                              <label class="form-check-label" for="radio1">
                                <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>가능
                            </label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label" for="radio2">
                            <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">불가능
                        </label>
                    </div>

                    <div class="form-group">
                        <label for="pwd">가능요일(월,화,수,목,금):</label><br>
                        <div class="form-check-inline">
                          <label class="form-check-label" for="check1">
                            <input type="checkbox" class="form-check-input" id="check1" name="vehicle1" value="something">월
                         </label>
                         </div>
                        <div class="form-check-inline">
                            <label class="form-check-label" for="check2">
                            <input type="checkbox" class="form-check-input" id="check2" name="vehicle2" value="something">화
                            </label>
                        </div>
                <div class="form-check-inline">
                  <label class="form-check-label" for="check3">
                    <input type="checkbox" class="form-check-input" id="check3" name="vehicle2" value="something">수
                </label>
            </div>
            <div class="form-check-inline">
              <label class="form-check-label" for="check4">
                <input type="checkbox" class="form-check-input" id="check4" name="vehicle2" value="something">목
            </label>
        </div>
        <div class="form-check-inline">
          <label class="form-check-label" for="check5">
            <input type="checkbox" class="form-check-input" id="check5" name="vehicle2" value="something">금
        </label>
    </div>
                                    <!-- <div class="form-check-inline">
                                      <label class="form-check-label">
                                        <input type="checkbox" class="form-check-input" disabled>수
                                      </label>
                                  </div> -->
                              </div>
                              <input data-toggle="datepicker" type="text">
                              <button type="submit" class="btn btn-primary">Submit</button>
                              <button type="submit" name="addtocart" value="5" class="btn amado-btn">상품등록하기</button>
                          </form>



                          <!-- Add to Cart Form -->
                          <form class="cart clearfix" method="post">
                            <div class="cart-btn d-flex mb-50">
                                <p>Qty</p>
                                <div class="quantity">
                                    <span class="qty-minus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty > 1 ) effect.value--;return false;"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                                    <input type="number" class="qty-text" id="qty" step="1" min="1" max="300" name="quantity" value="1">
                                    <span class="qty-plus" onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i class="fa fa-caret-up" aria-hidden="true"></i></span>
                                </div>
                            </div>
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

<!-- ##### Newsletter Area Start ##### -->
<section class="newsletter-area section-padding-100-0">
    <div class="container">
        <div class="row align-items-center">
            <!-- Newsletter Text -->
            <div class="col-12 col-lg-6 col-xl-7">
                <div class="newsletter-text mb-100">
                    <h2>Subscribe for a <span>25% Discount</span></h2>
                    <p>Nulla ac convallis lorem, eget euismod nisl. Donec in libero sit amet mi vulputate consectetur. Donec auctor interdum purus, ac finibus massa bibendum nec.</p>
                </div>
            </div>
            <!-- Newsletter Form -->
            <div class="col-12 col-lg-6 col-xl-5">
                <div class="newsletter-form mb-100">
                    <form action="#" method="post">
                        <input type="email" name="email" class="nl-email" placeholder="Your E-mail">
                        <input type="submit" value="Subscribe">
                    </form>
                </div>
            </div>
        </div>
    </div>
                <!-- <form action="" method="">
        <input type='file' id="imgInp" />
        <img id="foo"src="#" />
    </form> -->
        <!-- <input  multiple  class="multi with-preview"/>
        <input multiple class="multi with-preview">
        <input type="file" class="this-is-your-class" /> -->

    </section>
    <!-- ##### Newsletter Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row align-items-center">
                <!-- Single Widget Area -->
                <div class="col-12 col-lg-4">
                    <div class="single_widget_area">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="index.html"><img src="img/core-img/logo2.png" alt=""></a>
                        </div>
                        <!-- Copywrite Text -->
                        <p class="copywrite"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                        </div>
                    </div>
                    <!-- Single Widget Area -->
                    <div class="col-12 col-lg-8">
                        <div class="single_widget_area">
                            <!-- Footer Menu -->
                            <div class="footer_menu">
                                <nav class="navbar navbar-expand-lg justify-content-end">
                                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#footerNavContent" aria-controls="footerNavContent" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
                                    <div class="collapse navbar-collapse" id="footerNavContent">
                                        <ul class="navbar-nav ml-auto">
                                            <li class="nav-item active">
                                                <a class="nav-link" href="index.html">Home</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="shop.html">Shop</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="product-details.html">Product</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="cart.html">Cart</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" href="checkout.html">Checkout</a>
                                            </li>
                                        </ul>
                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- ##### Footer Area End ##### -->

        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->

        <script src="js/jquery/jquery-2.2.4.min.js"></script>

        <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" type="text/javascript" language="javascript"></script> -->
        <!-- datepicker css,js -->
        <!-- <script src="//github.com/fyneworks/multifile/blob/master/jquery.MultiFile.min.js" type="text/javascript" language="javascript"></script> -->
        <script src="datepicker.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <!-- Active js -->
        <!-- <script src="js/active.js"></script> -->
        <!-- multi image picker.js https://www.jqueryscript.net/form/Multiple-Image-Picker-jQuery-Spartan.html-->
        <script type="text/javascript" src="js/spartan-multi-image-picker.js"></script>
        
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
            $('[data-toggle="datepicker"]').datepicker();
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
                    image: 'placeholder.png',
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
                    alert('Please only input png or jpg type file')
                },
                onSizeErr : function(index, file){
                    console.log(index, file,  'file size too big');
                    alert('File size too big');
                }
            });
        });
    </script>



</body>

</html>