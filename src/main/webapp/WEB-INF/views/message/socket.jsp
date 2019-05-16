<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="billy/resources/js/sockjs-0.3.4.min.js"></script>
<script type="text/javascript" src="billy/resources/js/stomp.min.js"></script>
<script>
var sock = null,
stompClient = null;

// connect() 은 onload 시점에서 수행될 수 있도록 지정
function connect(){
sock = new SockJS("http://localhost:8888/billy");
stompClient = Stomp.over(sock);    //stomp client 구성
stompClient.connect({}, function(frame){
   console.log('connected stomp over sockjs');
   // subscribe message
   stompClient.subscribe('mmsSocket.do', onMessage);
});

}

function onMessage(message){
console.log("Receive Data from server : "+message);
$("#chatMessageArea").append(message.body+"<br />");
$("#chatArea").scrollTop($("#chatMessageArea").height()-$("#chatArea").height());
}
</script>
</head>
<body>

<div id="chatArea">
<div id="chatMessageArea">

</div>
</div>

</body>
</html>