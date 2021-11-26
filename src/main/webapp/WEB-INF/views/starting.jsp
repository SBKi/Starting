<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Starting</title>
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/css/comment.css">   
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"href="${pageContext.request.contextPath}/resources/css/userProfile.css">   
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"   rel="stylesheet">
<link rel="stylesheet" type="text/css"href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style type="text/css">
.slick-prev {
   left: 10px;
}
.slick-next {
   right: 10px;
}
.slick-arrow {
   z-index: 1;
}
.modal {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   right: 0;
   width: auto;
   height: 100%;
   display: none;
}
.single-item {
   height: 100%;
}
</style>
</head>
<body>
   <jsp:include page="fragments/header.jsp"></jsp:include>
   <main>
   <br>
      <div class="feeds">
         <!-- story section -->
         <div class="section-story ">
            <div class="menu-title "></div>
            <ul class="story-list slider">
            <c:forEach var="client" items="${follow_list }">
               <li class="story-list_li">
                  <div class="gradient-wrap">
                     <img class="img-profile story"   src="/img/${client.client_img }"
                        onclick="location.href='userProfile?client_id=${client.client_id}'" style="cursor: pointer;">
                  </div>
                  <div class="profile-text">
                     <span class="userID point-span">${client.client_name }</span>
                  </div>
               </li>
            </c:forEach>
            </ul>
         </div>
         <!-- article -->
         <article>
         <c:forEach var="board" items="${board_All_list }">
         <div class="article_item">
            <header style="justify-content: left;">
            <c:forEach var="clients" items="${client_All_list }">
               <div class="profile-of-article">
               <c:if test="${board.whiteboard_client_id eq clients.client_id }">
                  <img class="img-profile1 pic"  src="/img/${clients.client_img }" onclick="location.href='userProfile?client_id=${board.whiteboard_client_id}'"> 
                     <span class="userID main-id point-span" style="margin-top: 9px;">${board.whiteboard_client_id }</span>
               </c:if>   
               </div>
            </c:forEach>
            </header>
            <div class="single-item" id="focus_${board.whiteboard_no}">
               <div>
                  <img style="height: 600px;"
                     src="/img/${board.whiteboard_img1 }">
               </div>
                  <c:if test="${board.whiteboard_img2 != null }">
                  <div>
                  <img style="height: 600px;"
                     src="/img/${board.whiteboard_img2 }">
                  </div>
                  </c:if>   
                  <c:if test="${board.whiteboard_img3 != null }">
                  <div>
                  <img style="height: 600px;"
                     src="/img/${board.whiteboard_img3 }">
                  </div>
                  </c:if>   
            </div>
            <div class="icons-react">
               <div class="icons-left">
               <c:set var="loop" value="false"/>
               <c:forEach var="item" items="${likelist }">
               	<c:if test="${not loop}">
               		<c:if test="${board.whiteboard_no eq item.w_heart_whiteboard_no }">
                        <i id = "heart" class="fa fa-heart heart" style="cursor: pointer;" onclick="like('${board.whiteboard_no}',this)"></i>
                        <c:set var="loop" value="true"/>
               		</c:if>
               	</c:if>
               	</c:forEach>
               	<c:if test="${not loop}">
                        <i id = "heart" class="fa fa-heart-o heart" style="cursor: pointer;" onclick="like('${board.whiteboard_no}',this)"></i>
               	</c:if>
                  <img class="icon-react" onclick="location.href='/starting/comment?whiteboard_no=${board.whiteboard_no}&client_id=${board.whiteboard_client_id }'"
                     src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png">
                     <c:if test="${client.client_id ne board.whiteboard_client_id }">
                  <img class="icon-react" onclick="location.href='/starting/message/room?id=${board.whiteboard_client_id}'"  src="/resources/img/dm.png">
                  </c:if>
               </div>
            </div>
            <!-- article text data -->
            <div class="reaction">
               
               <div class="description">
                  <p>${board.whiteboard_content }</p>
               </div>
                  <p class="point-span" id="heart_count_${board.whiteboard_no }">${board.whiteboard_like }</p>
            </div>
            <div class="hl"></div>
            <div class="comment">
                              <form action="comment/save" method="post">
                                 <input type="hidden" name="comment_no" value="0">
                                 <input type="hidden" name="comment_whiteboard_no" value="${board.whiteboard_no }">
                                 <input type="hidden" name="comment_id" value="${client.client_id }">
                                 <input id="input-comment" name="comment_content" style="width: 560px;"
                                    class="input-comment" type="text" placeholder="댓글 달기..."
                                    >
                                 <button type="submit" class="submit-comment">게시</button>
                              </form>
                           </div>
                           <div style="border-bottom: 1px solid #DBDBDB"></div>
                  </div>
            </c:forEach>
         </article>
      </div>
      <!-- main-right -->
      <div class="main-right">
         <div class="myProfile">
            <img class="pic"
               src="/img/${client.client_img}" style="cursor: pointer;">
            <div>
               <span class="userID point-span">${client.client_name}</span>
            </div>
            <div>
               <span class="sub-span" onclick="location.href='/starting/userProfile?client_id=${client.client_id}'"
                  style="margin-left: 110px; color: #0095f6; font-weight: 600; font-size: 12px; cursor: pointer;">내계정</span>
            </div>
         </div>
         <!-- recommendation section -->
         <div class="section-recommend">
            <div class="menu-title">
               <span class="sub-title">회원님을 위한 추천</span> <span class="find-more">모두   보기</span>
            </div>
            <ul class="recommend-list">
               <c:forEach var="client" items="${not_follow_list }">
               <li>
                  <div class="recommend-friend-profile">
                  
                     <img class="img-profile1 story"
                        src="/img/${client.client_img }"
                        onclick="location.href='userProfile?client_id=${client.client_id}'" style="cursor: pointer;">
                     <div class="profile-text1">
                        <span class="userID point-span">${client.client_id} ${client.client_name }</span> 
                        <c:if test="${client.client_gender eq 'M' }">
                        <span class="sub-span">${client.client_birth } (남) </span>
                        </c:if>
                        <c:if test="${client.client_gender eq 'F' }">
                        <span class="sub-span">${client.client_birth } (여) </span>
                        </c:if>
                     </div>
                  </div> 
                  <a href="/starting/send_follow?id=${client.client_id }"><div class="btn-follow">팔로우</div></a>
               </li>
               </c:forEach>
            </ul>
         </div>
      </div>
   </main>
   <script type="text/javascript">
$(document).ready(function(){

	
  $('.single-item').slick({
      infinite : true,    //무한 반복 옵션    
      slidesToShow : 1,      // 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 1,      //스크롤 한번에 움직일 컨텐츠 개수
      speed : 100,    // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true,       // 옆으로 이동하는 화살표 표시 여부
      dots : true,       // 스크롤바 아래 점으로 페이지네이션 여부
      draggable : true, 
      vertical : false,      // 세로 방향 슬라이드 옵션
      pauseOnHover : true,      // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
  });
  
  $('.slider').slick({
      infinite : true,    //무한 반복 옵션    
      slidesToShow : 8,      // 한 화면에 보여질 컨텐츠 개수
      slidesToScroll : 2,      //스크롤 한번에 움직일 컨텐츠 개수
      speed : 100,    // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
      arrows : true,       // 옆으로 이동하는 화살표 표시 여부
      dots : true,       // 스크롤바 아래 점으로 페이지네이션 여부
      autoplay : true,         // 자동 스크롤 사용 여부
      autoplaySpeed : 10000,       // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,      // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,      // 세로 방향 슬라이드 옵션
      draggable : true, 
   });

});

   // 좋아요버튼 클릭시(좋아요 추가 또는 좋아요 취소)
      function like(idx,e){
      var data ={ no : idx  };
      var className= $(e).attr('class')
      if(className == 'fa fa-heart-o heart'){
    	  className = 'fa fa-heart heart';
      }else{
    	  className = 'fa fa-heart-o heart';
      }
      
      $(e).attr('class',className);
      
      $.ajax({
        	url: "/heart",
            type: "POST",
            data: JSON.stringify(data),   
            contentType : "application/json",
            success    : function(data) {
            	$("#heart_count_"+data.idx).text(data.like);
            }
      });
   };

   
</script>
</body>


</html>