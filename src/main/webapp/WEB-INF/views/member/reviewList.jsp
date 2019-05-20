<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Amado - Furniture Ecommerce Template | Checkout</title>

    <!-- Favicon  -->
    <link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="/billy/resources/css/core-style.css">
    <link rel="stylesheet" href="/billy/resources/css/style.css">

	<!-- 페이징 관련 -->
	<link rel="stylesheet" href="/billy/resources/css/reviewpaging.min.css">
	<!-- <link rel="stylesheet" href="/billy/resources/css/reviewpaging-theme.min.css"> -->
	<script type="text/javascript" src="/billy/resources/js/paging.js"></script>

	<style type="text/css">
		table.type06 {
		    border-collapse: collapse;
		    text-align: left;
		    line-height: 1.5;
		    border-top: 1px solid #ccc;
		    border-bottom: 1px solid #ccc;
		    margin: 20px 10px;
		}
		table.type06 th {
		    /* width: 150px; */
		    width: 250px;
		    padding: 10px;
		    font-weight: bold;
		    vertical-align: center;
		}
		table.type06 td {
		    width: 300px;
		    padding: 10px;
		    vertical-align: center;
		}
		table.type06 .even {
		    /* background: #efefef; */
		    background: #ffe2b8;
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
	  
		<div>
		<table class="type06">
	    	<tr>
		        <th class="even">이미지</th>
		        <th class="even">제품명</th>
		        <th class="even">대여기간</th>
		        <th class="even">후기작성</th>
		    </tr>
		    <c:forEach var="r" items="${lists}">
				<tr>
					<td><img src="/billy/resources/files/product/${r.first_img}"></td>
					<td><a href="pdetail.do?pno=${r.product_no }" style="font-size:15pt; font-weight:bold">${r.product_name}</a></td>
					<td>						
						<c:set var="begindate" value="${fn:replace(r.payment_begindate, '-', '.')}"/>
						<c:set var="enddate" value="${fn:replace(r.payment_enddate, '-', '.')}"/>
						${begindate } ~ ${enddate }
					</td>
					<td>
						<c:if test="${r.review_status eq 'N'}">
							<div class="cart-btn mt-100">
							<c:url var="insertReview" value="writeReview.do">
			        		<c:param name="name" value="${r.product_name }" />
			        		<c:param name="img" value="${r.first_img }" />
			        		<c:param name="begin" value="${begindate }" />
			        		<c:param name="end" value="${enddate }" />
			        		<c:param name="pno" value="${r.product_no }" />
			        		<c:param name="payno" value="${r.payment_no }" />
				        	</c:url>			       
			                	<a href="${insertReview }" class="btn amado-btn w-100">대여후기 쓰기</a>		                		               
			             	</div>
		             	</c:if>
		             	<c:if test="${r.review_status eq 'Y' }">
		                	작성완료
		                </c:if>
		            </td>
				</tr>						
			</c:forEach>
		</table>
		
		<!-- 5. paging view -->
		<center>	
		<ul class="pagination">
			<c:if test="${p.pageStartNum ne 1}">
				<!--맨 첫페이지 이동 -->
				<li><a onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>&laquo;</a></li>
				<!--이전 페이지 이동 -->
				<li><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>&lsaquo;</a></li>
			</c:if>
			
			<!--페이지번호 -->
			<c:forEach var='i' begin="${p.pageStartNum}" end="${p.pageLastNum}" step="1">
				<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
			</c:forEach>
			
			<c:if test="${p.lastChk}">
				<!--다음 페이지 이동 -->
				<li><a onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&rsaquo;</a></li>
				<!--마지막 페이지 이동 -->
				<li><a onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&raquo;</a></li>
			</c:if>
		</ul>
		</center>
		<form action="reviewList.do" method="post" id='frmPaging'>
			<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
			<input type='hidden' name='index' id='index' value='${p.index}'>
			<input type='hidden' name='pageStartNum' id='pageStartNum' value='${p.pageStartNum}'>
			<input type='hidden' name='listCnt' id='listCnt' value='${p.listCnt}'>	
		</form>
        </div>
        
    </div>
 
    <!-- ##### Main Content Wrapper End ##### -->
	<c:import url="../common/footer.jsp" />
   


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