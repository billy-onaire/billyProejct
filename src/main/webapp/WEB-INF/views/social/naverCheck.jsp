<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function(){
<c:if test="${!empty naverLogin}">
	var name = ${result}.response.name;
	var email = ${result}.response.email;
	var nickname = ${result}.response.nickname;
	var profileImage = ${result}.response.profile_image;
	var id = ${result}.response.id
	document.getElementById("name").value = name;
	document.getElementById("email").value = email;
	document.getElementById("nickname").value = nickname;
	document.getElementById("profileImage").value = profileImage;
	document.getElementById("id").value = id;
	
	document.getElementById("nform").submit();
</c:if>
}
</script>
</head>
<body>
<form action="naverLogin.do" method="post" id="nform">
	<input type="hidden" name="name" id="name">
	<input type="hidden" name="email" id="email">
	<input type="hidden" name="nickname" id="nickname">
	<input type="hidden" name="profileImage" id="profileImage">
	<input type="hidden" name="uid" id="id">
</form>
</body>
</html>