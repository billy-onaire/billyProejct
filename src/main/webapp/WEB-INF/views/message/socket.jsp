<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<link rel="icon" href="/billy/resources/img/core-img/billyTitle.png">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>


<script>
var socket = null;
/* $(document).ready(function(){
	connectWS();
}); */

function connectWS(){
	var wsUri = "ws://localhost:8888/billy/mmsSocket.do";
	var ws = new WebSocket(wsUri);
	socket = ws;
	
	ws.onopen = function () {
	    console.log('Info: connection opened.');
	    
	};


	ws.onmessage = function (event) {
	    console.log("ReceiveMessage : ", evt.data+'\n');
	};


	ws.onclose = function (event) { 
		console.log('Info: connection closed.'); 
		/* setTimeout( function(){ connect(); }, 1000); // retry connection!! */
	};
	ws.onerror = function (err) { console.log('Error :', err); };
	
}

</script>

<script>
$('#btnSend').on('click', function(event) {
	alert("확인");
	event.preventDefault();
	if (socket.readyState !== 1) return;
		  let msg = $('input#msg').val();
		  socket.send(msg);
	});
	
	 connectWS(); 
</script>

</head>
<body>


<div class="well">
	<input type="text" id="msg" value="1212" class="form-control">
	<button id="btnSend" class="btn btn-primary">Send Message</button>
</div>

</body>
</html>