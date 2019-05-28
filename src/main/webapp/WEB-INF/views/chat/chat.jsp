<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-3.3.1.min.js"></script>

<style type="text/css">
.container {
  border: 2px solid #dedede;
  background-color: #f1f1f1;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}
.darker {
  border-color: #ccc;
  background-color: #ddd;
}

#fix{
	position:fixed;
	left:10px;
	top:550px;
}
</style>	
</head>

<body>
    <div id=wrapper >
        <div id=chatArea></div>
        <div id=chatInput >
          <div id="fix">
            <input type=text id="inputMessage" class="form-control"
                  placeholder="채팅을 입력하세요." style="width:300px; height:30px">
                  <button id=send class="btn btn-default">send</button>
          </div>
        </div>
    </div>
</body>
<script type="text/javascript">
var webSocket = new WebSocket('ws://localhost:8888/billy/echo.do');
webSocket.onerror = onError
webSocket.onopen = onOpen
webSocket.onmessage = onMessage

console.log("확인");

function onMessage(event) {
  var $div = $('<div/>', {"class": "container darker", text: event.data })
    $("#chatArea").append($div);
  console.log("recieved message : " + event.data + '\n');
}
function onOpen(event) {
  var $div = $('<div/>', {"class": "msg msg-connect", text: "연결성공"})
    $("#chatArea").append($div);
  console.log("connect");
}
function onError(event) {
  var $div = $('<div/>', {"class": "msg msg-error", text: "연결이 끊겼습니다."})
    $("#chatArea").append($div);
}
function send() {
	if("${loginMember.user_id}" == ""){
		alert("로그인 해주세요");
		return;
	}
    if (!inputMessage.value) {
        alert("채팅을 입력하세요.");
        return;
    }
    webSocket.send("${loginMember.user_id}: " + inputMessage.value);
    var $div = $('<div/>', {"class": "container", text: "${loginMember.user_id}: " + inputMessage.value })
    $("#chatArea").append($div);
    
    $("#inputMessage").val("");
    $("#inputMessage").focus();
}
$("#inputMessage").keypress(function(e) {
    if (e.which == 13) {
        send();
    }
});
$("#send").click(function() {
    send();
})

</script>
</html>