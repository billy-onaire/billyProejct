<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Title  -->
<title>Billy</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">
<script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <style type="text/css">
        .amado_product_area .container-fluid .row .col-12 .view > button {
          border: none;
          outline: none;
          padding: 10px 16px;
          background-color: #f1f1f1;
          cursor: pointer;
          font-size: 14px;
        }
        .amado_product_area .container-fluid .row .col-12 .view > button:first-child{
          background-color: #fab336;
          color: white;
        }
        .amado_product_area .container-fluid .row .col-12 .view > button.active::before{
             background-color: red;
          color: white;
        }
    </style>

    <script type="text/javascript">
        $('.amado_product_area .container-fluid .row .col-12 .view > button').click(function() {
    // 클릭된 당사자 => this
    // 이 함수를 실행한 주어 => this
    // $(this) => 이거 포장해주세요.
    // 굳이 포장을 하는 이유
    var $클릭된_녀석 = $(this);
    
    var $part5 = $클릭된_녀석.closest('.container-fluid');
    //var $part5 = $클릭된_녀석.parent().parent().parent(); // $part5를 얻는 또 다른 방법
    // 오직 $part5 안에서만 .body 로 검색해서 나온 것들 포장해주세요.
    var $body = $part5.find('.cart-table clearfix');
    
    // 기존에 active 가진 녀석에게 active 빼앗기
    $클릭된_녀석.parent().find('.active').removeClass('active');
    $클릭된_녀석.addClass('active');
    
    // 클릭된 녀석이 형제 중에서 몇 번째 인지 확인(참고로 0부터 셉니다.);
    var index = $클릭된_녀석.index();
    
    // part-5 라는 클래스를 가진 나의 조상중에 나랑 가장 가까운 1개를 포장해주세요.
    
    // 기존의 active 된 요소들에서 active 제거
    $body.find('.active').removeClass('active');
    
    $body.find('div:nth-child(' + (index + 1) + ')').addClass('active');
});

    </script>

<body>

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
           
        </header>
        <!-- Header Area End -->

        <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Catagories</h6>

                <!--  Catagories  -->
                <div class="catagories-menu">
                    <ul>
                        <li><a href="#">Chairs</a></li>
                        <li><a href="#">Beds</a></li>
                        <li><a href="#">Accesories</a></li>
                        <li><a href="#">Furniture</a></li>
                        <li><a href="#">Home Deco</a></li>
                        <li><a href="#">Dressings</a></li>
                        <li><a href="#">Tables</a></li>
                    </ul>
                </div>
            </div>

            <!-- ##### Single Widget ##### -->
            <div class="widget brands mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Brands</h6>

                <div class="widget-desc">
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="amado">
                        <label class="form-check-label" for="amado">Amado</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="ikea">
                        <label class="form-check-label" for="ikea">Ikea</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="furniture">
                        <label class="form-check-label" for="furniture">Furniture Inc</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="factory">
                        <label class="form-check-label" for="factory">The factory</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="artdeco">
                        <label class="form-check-label" for="artdeco">Artdeco</label>
                    </div>
                </div>
            </div>
        </div>

        <div class="amado_product_area section-padding-100">
            <div class="container-fluid" style="padding-left: 40px;">
                <div class="row">
                    <div class="col-12">  
                        <div class="view d-flex">
                                    <button class="active"><a href="#">받은 쪽지함</a></button>
                                    <button><a href="#">보낸 쪽지함</a></button>
                                    <button><a href="#">삭제한 쪽지함</a></button>
                        </div>
                    </div>
                </div>            
        <br>
        <br>
        <br>
                   <div class="container-fluid" style="padding-left: 40px;">	<!-- amado_product_area에서 컨테이너검색 -->
                        <div class="cart-table clearfix" style="padding-left: 40px;">
                            <div class="active">
                                <table class="table table-responsive">
                                    
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>보낸 사람</th>
                                            <th style="width: 200px">내용</th>
                                            <th>날짜</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="cart_product_img">
                                                user01
                                            </td>
                                            <td class="cart_product_desc">
                                                네고 되나요?
                                            </td>
                                            <td class="price">
                                                2019-04-24
                                            </td>
                                            <td class="cart_product_img">
                                                읽음
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                             <div>
                                <table class="table table-responsive">
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>받은 사람</th>
                                            <th style="width: 200px">내용</th>
                                            <th>날짜</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="cart_product_img">
                                                user01
                                            </td>
                                            <td class="cart_product_desc">
                                                네고 되나요?
                                            </td>
                                            <td class="price">
                                                2019-04-24
                                            </td>
                                            <td class="cart_product_img">
                                                읽음
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div>
                                <table class="table table-responsive">
                                    <thead style="text-align: center;">
                                        <tr>
                                            <th>보낸 사람/받는 사람</th>
                                            <th style="width: 200px">내용</th>
                                            <th>날짜</th>
                                            <th>읽음 여부</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="cart_product_img">
                                                user01
                                            </td>
                                            <td class="cart_product_desc">
                                                네고 되나요?
                                            </td>
                                            <td class="price">
                                                2019-04-24
                                            </td>
                                            <td class="cart_product_img">
                                                읽음
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>                  
                    </div>

                <div class="row">
                    <div class="col-12">
                        <!-- Pagination -->
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <li class="page-item active"><a class="page-link" href="#">01.</a></li>
                                <li class="page-item"><a class="page-link" href="#">02.</a></li>
                                <li class="page-item"><a class="page-link" href="#">03.</a></li>
                                <li class="page-item"><a class="page-link" href="#">04.</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
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