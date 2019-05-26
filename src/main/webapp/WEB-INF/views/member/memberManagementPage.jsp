<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">
<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">
<title>Billy - 회원관리</title>
<style type="text/css">
.pagination {
	justify-content: center;
}
.form-control{
	width: 200px;
	float:left;
}
.input-group{
	width: 300px;
}
</style> 
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function deleteMember() {
	$("#memberTable tr").on("click",function(){
		if(confirm("회원을 정말 탈퇴 시키겠습니까?")){
			var tdArr = new Array();
			
			var tr = $(this);
			var td = tr.children();
			console.log("tr : " + tr.text());
			td.each(function(i){
				tdArr.push(td.eq(i).text);
			});
			
			var userId = td.eq(0).text();
			
			$.ajax({
				url: "deleteMember.do",
				data: {userId: userId},
				type: "get",
				dateType: "json",
				success: function(result){
					alert(decodeURIComponent(result.hashMap.message.replace(/\+/gi," ")));						
				},error: function(request, status, errorData){
					console.log("error code : " + request.status
							+ "\nmessage : " + request.responseText
							+ "\nerror : " + errorData);
				}
			});
		}else{
			$("#memberTable tr").off("click");
			return false;
		}
	});
}

function backMember() {
	$("#memberTable tr").on("click",function(){
		if(confirm("회원을 정말 복구 시키겠습니까?")){
			var tdArr = new Array();
			
			var tr = $(this);
			var td = tr.children();
			console.log("tr : " + tr.text());
			td.each(function(i){
				tdArr.push(td.eq(i).text);
			});
			
			var userId = td.eq(0).text();
			
			$.ajax({
				url: "backMember.do",
				data: {userId: userId},
				type: "get",
				dateType: "json",
				success: function(result){
					alert(decodeURIComponent(result.hashMap.message.replace(/\+/gi," ")));						
				},error: function(request, status, errorData){
					console.log("error code : " + request.status
							+ "\nmessage : " + request.responseText
							+ "\nerror : " + errorData);
				}
			});
		}else{
			$("#memberTable tr").off("click");
			return false;
		}
	});
}

function optionValue(){
	var select = document.getElementById("selection");
	var deleteUser = select.options[select.selectedIndex].value;

	if(deleteUser == "deleteUser"){
		document.getElementById("search").style.display = "none";
	}else{
		document.getElementById("search").style.display = "block";
	}
}
</script>
</head>
<body>
<div class="main-content-wrapper d-flex clearfix">
<c:import url="../common/adminNav.jsp" />
	<div class="products-catagories-area clearfix">
		<div class="amado-pro-catagory clearfix">
		<div class="container">
		<h1 align="center">회원 관리</h1>
		<table class="table table-hover text-center" id="memberTable">
			<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>신고당한수</th>
				<th>회원탈퇴여부</th>
			</tr>
			</thead>
			<c:forEach var="member" items="${mList }" >
			<tbody>
				<tr>
					<td>${member.user_id }</td>
					<td>${member.user_name }</td>
					<td>${member.email }</td>
					<td>${member.user_enroll }</td>
					<td>${member.report_count }</td>
					<td>
						<button type="button" class="btn btn-dark" onclick="deleteMember();">탈퇴</button>
						<button type="button" class="btn btn-dark" onclick="backMember();">회원복구</button>
					</td>
				</tr>
			</tbody>
			</c:forEach>
		</table>
		</div>
			<ul class="pagination">
			<c:if test="${paging.prev }">
			<li class="page-item">
				<a class="page-link" href='<c:url value="mSearchList.do?page=${paging.startPage - 1 }&selection=${selection }&search=${search }"/>'><i class="fa fa-chevron-left"></i></a>
			</li>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="idx">
			<li class="page-item">
				<a class="page-link" href='<c:url value="mSearchList.do?page=${idx }&selection=${selection }&search=${search }"/>'>${idx }</a>
			</li>
			</c:forEach>
			<c:if test="${paging.next }">
			<li class="page-item">
				<a class="page-link" href='<c:url value="mSearchList.do?page=${paging.endPage + 1 }&selection=${selection }&search=${search }" />'><i class="fa fa-chevron-right"></i></a>
			</li>
			</c:if>
		</ul>
		<div class="container"> 
		<form action="mSearchList.do" method="get">
		<div class="form-group">
			<select class="form-control" id="selection" name="selection" onChange="optionValue();">
				<option>선택해주세요</option>
				<option value="userId">아이디</option>
				<option value="userName">이름</option>
				<option value="deleteUser">탈퇴회원</option>
			</select>
			<div class="input-group">
			<input type="text" class="form-control" id="search" name="search" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-search" type="submit"><i class="fa fa-search fa-fw"></i>Search</button>
				</span>
			</div>
		</div>
		</form>
		</div>
	</div>
	</div>
</div>
</body>
</html>