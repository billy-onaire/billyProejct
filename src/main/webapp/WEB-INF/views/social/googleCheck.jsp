<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>billy</title>
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url: "token.do",
			data: { code: "${param.code}", 
				client_id: "1095803907906-ngbfa3hauqa9d6v4t9um7n4u0gkof7g9.apps.googleusercontent.com", 
				client_secret: "PgasrNGtVq5aRtEci9joCM8v",
				redirect_uri: "http://localhost:8888/billy/googleCheck.do",
				grant_type: "authorization_code"},
			type: "post",
			dataType: "json",
			success: function(result){
				if(result != null){
					$("#at").val(result.hashMap.access_token);
					$("#name").val(decodeURIComponent(result.hashMap.name));
					$("#profile").val(result.hashMap.profile);
					$("#uid").val(result.hashMap.uid);
					$("#gac").submit();
				}
			},error: function(request, status, errorData){
				console.log("error code : " + request.status
						+ "\nmessage : " + request.responseText
						+ "\nerror : " + errorData);
			}
		}); //ajax
	}); //ready
</script>
</head>
<body>
<form action="googlelogin.do" method="post" id="gac">
<input type="hidden" name="access_token" id="at">
<input type="hidden" name="name" id="name">
<input type="hidden" name="profile" id="profile">
<input type="hidden" name="uid" id="uid">
</form>
</body>
</html>