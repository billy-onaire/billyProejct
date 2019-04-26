<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | 회원가입</title>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="css/core-style.css">
    <link rel="stylesheet" href="style.css">

    <style>
            body {
              font-family: Arial, Helvetica, sans-serif;
              background-color: white;
            }
            
            * {
              box-sizing: border-box;
            }
            
            /* Add padding to containers */
            .container {
              padding: 16px;
              background-color: white;
            }
            
            /* Full-width input fields */
            input[type=text], input[type=password] {
              width: 100%;
              padding: 15px;
              margin: 5px 0 22px 0;
              display: inline-block;
              border: none;
              background: #f1f1f1;
            }
            
            input[type=text]:focus, input[type=password]:focus {
              background-color: #ddd;
              outline: none;
            }
            
            /* Overwrite default styles of hr */
            hr {
              border: 1px solid #f1f1f1;
              margin-bottom: 25px;
            }
            
            /* Set a style for the submit button */
            .registerbtn {
              background-color: #4CAF50;
              color: white;
              padding: 16px 20px;
              margin: 8px 0;
              border: none;
              cursor: pointer;
              width: 100%;
              opacity: 0.9;
            }
            
            .registerbtn:hover {
              opacity: 1;
            }
            
            /* Add a blue text color to links */
            a {
              color: dodgerblue;
            }
            
            /* Set a grey background color and center the text of the "sign in" section */
            .signin {
              background-color: #f1f1f1;
              text-align: center;
            }

            #pp{
                margin-top: -15px;
                margin-left: 10px;
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
                    <li><a href="cart.html">Cart</a></li>
                    <li class="active"><a href="checkout.html">Checkout</a></li>
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

        <form action="#">
            <div class="container">
              <h1>회원가입</h1>
              <p>Please fill in this form to create an account.</p>
              <hr>
         
              <label for="email"><b>아이디</b></label>
              <input type="text" placeholder="Enter ID" name="user_id" required>

              <label for="email"><b>비밀번호</b></label>
              <input type="text" placeholder="Enter Password" name="user_pwd" required>

              <label for="psw-repeat"><b>비밀번호 재입력</b></label>
              <input type="password" placeholder="Repeat Password" name="psw-repeat" required>

              <label for="email"><b>핸드폰 번호</b></label>
              <input type="text" placeholder="Enter Phone" name="phone" required>

              <label for="email"><b>이메일 인증</b></label>
              <input type="text" placeholder="Enter Email" name="email" required>          
              <p id="pp" style="color: orange">E-mail로 발송된 내용을 확인한 후 인증하셔야 회원가입이 완료됩니다.</p>
              
              <label for="email"><b>인증 번호</b></label>
              <input type="text" placeholder="Enter verification number" name="certifi" required>          
              
              <label for="email"><b>주소</b></label>
              <input type="text" placeholder="Enter Phone" name="address" required>
               
              <label for="email"><b>주거래가능 지역</b></label>
              <input type="text" placeholder="Enter Possible Transaction Area" name="location_area" required>

              <label for="email"><b>본인소개</b></label>
              <textarea style="background-color: #f1f1f1" class="form-control" rows="5" id="comment"
              placeholder="500자 이내로 작성하세요."></textarea>
            
              <hr>
              <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
          
              <button type="submit" class="registerbtn" style="background-color: orange">등록하기</button>
            </div>
            
          </form>
               

    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="js/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>

</body>

</html>