<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

	<!-- 웹 소켓 사용해서 현재 몇개의 쪽지가 도착했는지 구해오기. --> 

    <script type="text/javascript">

    var wsUri = "ws://localhost:8888/billy/count";

    function send_message() {

        websocket = new WebSocket(wsUri);

        websocket.onopen = function(evt) {

            onOpen(evt);

        };

        websocket.onmessage = function(evt) {

            onMessage(evt);

        };

        websocket.onerror = function(evt) {

            onError(evt);

        };

    }

   

    function onOpen(evt) 

    {

       websocket.send("${recv_id}");

    }

    function onMessage(evt) {

    		$('#count').append(evt.data);

    }

    function onError(evt) {

    }

    $(document).ready(function(){

    		send_message();

    });

    		

    

        </script>



</head>
<body>

</body>
</html>