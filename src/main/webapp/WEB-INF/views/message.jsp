<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Starting</title>
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/css/message.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script   src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
   .alert-secondary{
       float: right;
   }
</style>
</head>
<body>
   <jsp:include page="fragments/header.jsp"></jsp:include>
   <main>
      <div class="main_area">
         <div class="left_main">
            <div class="left_main_header">
               <!-- room 반복 -->
               <c:forEach items="${roomlist }" var="item" varStatus="status">
               <div class="S-mcP">
                  <div class="AjEzM ">
                     <div class="">
                        <img src="/img/${clientlist.get(status.count-1).client_img }"onclick="location.href='/starting/userProfile?client_id=${clientlist.get(status.count-1).client_id}'"
                           style="cursor: pointer; border-radius: 30px; width: 35px; height: 35px;">
                     </div>
                     <div class="m7ETg">
                        <div class="" style="width: 100%;">
                           <button class="" type="button">
                              <div class="" style="width: 100%;">
                                 <div class="lf6L3">
                                 <input type="hidden" id="rid${status.count }" value="${item.roomid }">
                                 <a  onclick="getChat('${status.count}')">
                                    <div style="cursor: pointer;">${clientlist.get(status.count-1).client_name }</div>
                                    </a>
                                 </div>
                                 <div class="">
                                 </div>
                              </div>
                           </button>
                        </div>
                     </div>
                  </div>
               </div>
            </c:forEach>
               </div>
         </div>
         <div class="right_main">
            <div id="message">
               <div class="chat_header">
                  <div class="image_box">
                     <div class="image_table">
                        <img onclick="location.href='/starting/userProfile?client_id=${client.client_id}'"src="/img/${client.client_img }">
                     </div>
                  </div>
                  <div class="profile-of-article">
                              <input type="hidden" value="whiteboard_client_id">
                              <h3 class="userID main-id point-span" style="margin-top: 8px;">${client.client_id}</h3>
                              <h4 class="userID main-id point-span" style="margin-top: 8px;">${client.client_name}</h4>
                           </div>
               </div>
                   <div id="msgArea" class="chat_description">

            </div>
         </div>
         <div id="footer_input" class="chat_footer">
            <div class="input-group mb-3" id="aas">
            </div>
         </div>
      </div>
      </div>
      <input type="hidden" id="seid" value="${client.client_id }">
   </main>
           <script type="text/javascript">
           
           const sockJs = new SockJS("/stomp/chat");
            const stomp = Stomp.over(sockJs);
            let roomId = '';
            let username = '';
            let str = '';
            stomp.connect({}, function (){
                    console.log("STOMP Connection22")

            });
            function enterkey() {
            	if (window.event.keyCode == 13) {
            		insert_mail(room);
            	} 
            }
           function getChat(index){
                var roomid = $('#rid'+index).val();
                var id = $('#seid').val();
                
               var data  = {
                           roomid   : roomid, 
                         id  :  id
                        };
               
                  $.ajax({
                      type      : "POST",
                      url       : "/starting/message/room",
                    data      :  JSON.stringify(data), 
                      contentType : "application/json",
                      success    : function(data) {
                         var msgtext = '';
                             $("#msgArea").empty();
                         for(key in data.list){
                             if(data.list[key].writer === id){
                               msgtext = "<div class='right_div'>";
                               msgtext += "<div class='mail_right_content'>"+ data.list[key].message+"</div>";
                               msgtext += "</div>";
                               $("#msgArea").scrollTop($("#msgArea")[0].scrollHeight);
                             }else{
                               msgtext = "<div class='left_div'>";
                               msgtext += "<div class='mail_id_content'>"+data.list[key].writer+"</div>";
                               msgtext += "<div class='mail_left_content'>"+ data.list[key].message+"</div>";
                               msgtext += "</div>";
                               $("#msgArea").scrollTop($("#msgArea")[0].scrollHeight);
                             }
                             $("#msgArea").append(msgtext);
                         }
                                   $("#aas").empty();
                                  var str2 = '';
                                   str2 = "<input type='text' id='msg' onkeyup='if(window.event.keyCode==13){sendMsg()}' class='form-control' style='width:580px'>";
                                   str2 += "<div class='input-group-append'>";
                                   str2 += "<input type='hidden' id='roomid'value='"+roomid+"'>";
                                   str2 += " <input   type='hidden' id='id' value='"+id+"'>";
                                   str2 += "<button class='btn btn-outline-secondary' type='button' onclick='sendMsg()' id='button-send'>전송</button>";
                                   str2 += "</div>";
                                   $("#aas").append(str2);
                                   
                                   roomId = roomid;
                                   username = id;
                         stomp.unsubscribe("chatsC");
                                 stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                                   var content = JSON.parse(chat.body);

                                   var writer = content.writer;
                                   if(writer === username){
                                       str = "<div class='right_div'>";
                                       str += "<div class='mail_right_content'>"+ content.message+"</div>";
                                       str += "</div>";
                                   $("#msgArea").append(str);
                                   str='';
                                   $("#msgArea").scrollTop($("#msgArea")[0].scrollHeight);
                                   }
                                   else{
                      
                                       str = "<div class='left_div'>";
                                       str += "<div class='mail_id_content'>"+ writer+"</div>";
                                       str += "<div class='mail_left_content'>"+ content.message+"</div>";
                                       str += "</div>";
                                   $("#msgArea").append(str);
                                   str='';
                                   $("#msgArea").scrollTop($("#msgArea")[0].scrollHeight);
                                   }
                               //3. send(path, header, message)로 메세지를 보낼 수 있음
                     },{id:"chatsC"});
                      },
                      error      : function(error) {
                         console.log(error);
                      }
                  });
             }
           	
             
               function sendMsg(){
                    var msg = document.getElementById("msg");
                    stomp.send('/pub/chat/message', {}, JSON.stringify({roomid: roomId, message: msg.value, writer: username}));
                    msg.value = '';
                };
                const input = document.getElementById("msg");
                input.addEventListener('keyup',function(e){
                    if (e.keyCode === 13) {
                    	sendMsg();
                  }  
                });
           
        </script>
</body>
</html>