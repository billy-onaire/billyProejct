<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Billy - 회원관리</title>
</head>
<body>
<div class="main-content-wrapper d-flex clearfix">
<c:import url="../common/adminNav.jsp" />
	<div class="products-catagories-area clearfix">
		<div class="amado-pro-catagory clearfix">
	<ul class="btn-group pagination">
		<c:if test="${paging.prev }">
		<li>
			<a href='<c:url value="memberManagementPage.do?page=${paging.startPage - 1 }"/>'><i class="fa fa-chevron-left"></i></a>
		</li>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="idx">
		<li>
			<a href='<c:url value="memberManagementPage.do?page=${idx }"/>'>${idx }</a>
		</li>
		</c:forEach>
		<c:if test="${paging.next && paging.endPage > 0 }">
		<li>
			<a href='<c:url value="memberManagementPage.do?page=${paging.endPage + 1 }" />'><i class="fa fa-chevron-right"></i></a>
		</li>
		</c:if>
	</ul>
	</div>
	</div>
</div>
</body>
</html>