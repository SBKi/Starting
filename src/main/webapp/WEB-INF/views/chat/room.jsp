<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
</head>
<style>
	.alert-secondary{
	    text-align: right;
    width: 100%;
	}
</style>
<body>
  <div class="container">
            <div class="col-6">
            </div>
            <div>
                <div id="msgArea" class="col">
                	<c:forEach items="${roomlist }" var="chat">
                		<div class="col-6">
                		<c:if test="${chat.writer eq client.client_id }">
                			<div class="alert alert-secondary">
                		</c:if>
                		<c:if test="${chat.writer ne client.client_id }">
                			<div class="alert alert-warning">
                		</c:if>
                				<b>${chat.writer } :  ${chat.message}</b>
                			</div>
                		</div>
                	</c:forEach>
                </div>
                <div class="col-6">
                    <div class="input-group mb-3">
                        <input type="text" id="msg" class="form-control">
                        <div class="input-group-append">
                        	<input type="hidden" id="roomid" value="${roomlist.get(0).getRoomid() }">
                        	<input type="hidden" id="id" value="${client.client_id }">
                            <button class="btn btn-outline-secondary" type="button" id="button-send">전송</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-6"></div>
        </div>
        <script type="text/javascript">
            $(document).ready(function(){
                var roomId = $("#roomid").val();
                alert(roomId);
                var username =  $("#id").val();

                console.log(roomId + ", " + username);

                var sockJs = new SockJS("/stomp/chat");
                //1. SockJS를 내부에 들고있는 stomp를 내어줌
                var stomp = Stomp.over(sockJs);

                //2. connection이 맺어지면 실행
                stomp.connect({}, function (){
                   console.log("STOMP Connection")

                   //4. subscribe(path, callback)으로 메세지를 받을 수 있음
                   stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                       var content = JSON.parse(chat.body);

                       var writer = content.writer;
                       var str = '';

                       if(writer === username){
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-secondary'>";
                           str += "<b>" + writer + " : " + content.message + "</b>";
                           str += "</div></div>";
                       }
                       else{
                           str = "<div class='col-6'>";
                           str += "<div class='alert alert-warning'>";
                           str += "<b>" + writer + " : " + content.message + "</b>";
                           str += "</div></div>";
                       }

                       $("#msgArea").append(str);
                   });

                   //3. send(path, header, message)로 메세지를 보낼 수 있음
                   stomp.send('/pub/chat/enter', {}, JSON.stringify({roomid: roomId, writer: username}))
                });

                $("#button-send").on("click", function(e){
                    var msg = document.getElementById("msg");

                    console.log(username + ":" + msg.value);
                    stomp.send('/pub/chat/message', {}, JSON.stringify({roomid: roomId, message: msg.value, writer: username}));
                    msg.value = '';
                });
            });
        </script>
</body>
</html>