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
    <title>Billy</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <link rel="stylesheet" href="/billy/resources/css/report.css">
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

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="checkout_details_area mt-50 clearfix">

                            <div class="cart-title">
                                <h2>신고 내용 작성</h2>
                            </div>

                            <form action="#" method="post">
                                <div class="row">
                                    <div class="col-12 mb-3">
                                        <p>신고 할 상품명</p>
                                        <input type="text" class="form-control" id="company" value="${prod.product_name}"
                                            readonly>
                                    </div>

                                    <div class="col-12 mb-3">
                                        <p>신고자 아이디</p>
                                        <input type="text" class="form-control mb-3" id="street_address" value="${prod.seller_id}">
                                    </div>

                                    <div class="col-12 mb-3">
                                        <p>신고 카테고리 / 내용</p>
                                        <select class="w-100" id="rcategoty">
                                            <option value="1">[ 부적절한 이미지인 경우 ]</option>
                                            <option value="2">[ 욕설 및 스팸 게시물인 경우 ]</option>
                                            <option value="3">[ 거래 시간 미준수한 경우 ]</option>
                                            <option value="4">[ 사진과 상이한 물품의 품질인 경우 ]</option>
                                            <option value="5">[ 거래 시 욕설 또는 협박을 한 경우 ]</option>
                                            <option value="6">[ 기타 ]</option>
                                        </select>
                                    </div>
                                    <div class="col-12 mb-3">
                                        <textarea name="comment" class="form-control w-100" id="comment" cols="30"
                                            rows="10" placeholder="상세 신고 내용을 입력해주세요"></textarea>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <p>신고 날짜</p>
                                        <input type="date" class="form-control" id="rdate"  value="" readonly>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>신고 접수</h5>
                            <ul class="summary-table">
                                <li><span>Product No:</span> <span>${prod.product_no}</span></li>
                                <li><span>Product Name:</span> <span>${prod.product_name}</span></li>
                                <li><span>ID:</span> <span id="for_nocap">${prod.seller_id}</span></li>
                                <li><span>Category:</span> <span></span></li>
                                
                            </ul>

    

                            <div class="cart-btn mt-100">
                                <a href="#" class="btn amado-btn w-100">REPORT</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
    </div>
    <!-- ##### Main Content Wrapper End ##### -->
    <c:import url="../common/footer.jsp" />




    <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
    <script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
    <!-- Popper js -->
    <script src="/billy/resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="/billy/resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="/billy/resources/js/plugins.js"></script>
    <!-- Active js -->
    <script src="/billy/resources/js/active.js"></script>
    <!-- goReport.js -->
    <script src="/billy/resources/js/goReport.js"></script>

</body>

</html>