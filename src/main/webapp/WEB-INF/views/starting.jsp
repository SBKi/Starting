<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Starting</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/comment.css">	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/userProfile.css">	
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
	${sessionScope.client }
	<br>
	${asd.client }
		<div class="feeds">
			<!-- story section -->
			<div class="section-story ">
				<div class="menu-title "></div>
				<ul class="story-list slider">
				<c:forEach var="client" items="${c_list }">
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="/img/${client.client_img }"
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
			<c:forEach var="board" items="${list }">
				<header>
					<div class="profile-of-article">
						<img class="img-profile1 pic"
							src="/img/${client.client_img }"
							onclick="location.href='userProfile?client_id=${board.whiteboard_client_id}'"> 
							<span class="userID main-id point-span" style="margin-top: 9px;">${board.whiteboard_client_id }</span>
					</div>
					<img class="icon-react icon-more" id="option" onclick="option"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png"
						alt="more">
					   <a href="update?whiteboard_no=${board.whiteboard_no }">수정</a>	
				</header>
				<div class="single-item">
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
						<c:if test="${!heartCheck }">
								<i class="fa fa-heart-o heart" style="cursor: pointer;" onclick="like(heart)"></i> <span
									class="visually-hiddewn"></span>
						</c:if>
							<!-- 이미 관심등록 되어있음 -->
						<c:if test="${heartCheck }">
								<i class="fa heart heart-clicked fa-heart" style="color: red; cursor: pointer;"
									onclick="unLike(heart)"></i> <span class="visually-hidden"></span>
						</c:if>
						<img class="icon-react" onclick="location.href='/starting/comment?whiteboard_no=${board.whiteboard_no}&client_id=${board.whiteboard_client_id }'"
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png">
						<img class="icon-react" onclick="location.href='/starting/message/room?id=${board.whiteboard_client_id}'"  src="/resources/img/dm.png">
					</div>
				</div>
				<!-- article text data -->
				<div class="reaction">
					<div class="liked-people">
						<p>
							<span class="point-span" style="margin-left: 11px;" id="heart_count">${board.whiteboard_like }</span>
						</p>
					</div>
					<div class="description">
						<p>
							<span class="point-span userID">${board.whiteboard_client_id }</span> <span>
								${board.whiteboard_content }</span>
						</p>
					</div>
					<div class="comment-section">
						<ul class="comments">
							<li><a id="commentsAll" onclick="#commentsAll" href="/starting/comment?whiteboard_no=${board.whiteboard_no}&client_id=${board.whiteboard_client_id }">댓글보기</a></li>
						</ul>
					</div>
				</div>
				<div class="hl"></div>
				<div class="comment" style="margin-bottom: 20px; border-bottom: 1px solid #DBDBDB;">
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
					<span class="sub-span" onclick="location.href='/starting/userProfile'"
						style="margin-left: 110px; color: #0095f6; font-weight: 600; font-size: 12px; cursor: pointer;">내계정</span>
				</div>
			</div>
			<!-- recommendation section -->
			<div class="section-recommend">
				<div class="menu-title">
					<span class="sub-title">회원님을 위한 추천</span> <span class="find-more">모두	보기</span>
				</div>
				<ul class="recommend-list">
					<c:forEach var="client" items="${c_list }">
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
						</div> <span class="btn-follow">팔로우</span>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</main>
	<div class="RnEpo  Yx5HN " id="modal">
		<div class="pbNvD  fPMEg">
			<div class="_1XyCr  ">
				<div class="piCib">
					<div class="modal_button_body">
						<!-- 상대방 글 이면 -->
						<button class="modal_button" id="report_option" tabindex="0" onclick="location.href='/starting/comment?whiteboard_no=${board.whiteboard_no }'">게시물로 이동</button>
						<button class="modal_button" id="report_option" tabindex="0" onclick="report_modal">신고하기</button>
						<button class="modal_button" id="meaning_option" tabindex="0" onclick="meaning_modal">차단하기</button>
						<button id="modal_cansle" class="modal_button" tabindex="0">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>								
	<div class="RnEpo  Yx5HN " id="report_modal">
		<div class="pbNvD  fPMEg" style="margin-top: 50px;">
			<div class="_1XyCr  ">
				<div class="piCib">
					<div class="modal_button_body">
						<h3>신고</h3>
						<h3>이 게시물을 신고하는 이유</h3>
						<button class="modal_button" tabindex="0" onclick="meaning_modal">스팸</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${1}'">나체 이미지 또는 성적 행위</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${2}'">혐오발언 또는 상징</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${3}'">폭력 또는 위험한 단체</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${4}'">불법 또는 규제 상품 판매</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${5}'">따돌림 또는 괴롭힘</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${6}'">지적 재산권 침해</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${7}'">자살 또는 자해</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${8}'">자살 또는 자해</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${9}'">사기 또는 거짓</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${10}'">거짓 정보</button>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/report/${11}'">마음에 들지 않습니다</button>
						<button id="report_modal_cansle" class="modal_button" tabindex="0">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="RnEpo  Yx5HN " id="meaning_modal">
		<div class="pbNvD  fPMEg" style="margin-top: 250px;">
			<div class="_1XyCr  ">
				<div class="piCib">
					<div class="modal_button_body">
						<div class="">
							<div class="">
								<div class="">
									<h3 style="margin-top: 20px;">이 내용을 보고 싶지 않으세요?</h3>
								</div>
								<div class="">
									<div class="">
										<h4 style="padding: 15px;">starting에서 마음에 들지 않는 게시물이 표시될
											때 게시물을 신고하거나 해당 게시물을 공유한 사람이 회원님에게 보이지 않도록 삭제할 수 있습니다.</h4>
									</div>
								</div>
							</div>
						</div>
						<button class="modal_button" tabindex="0"
							onclick="location.href='/starting/meaning/${jang123}'">{jang123}
							님 차단</button>
						<button id="meaning_modal_cansle" class="modal_button"
							tabindex="0">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
$(document).ready(function(){
  $('.single-item').slick({
		infinite : true, 	//무한 반복 옵션	 
		slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
		draggable : true, 
		vertical : false,		// 세로 방향 슬라이드 옵션
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
  });
  
  $('.slider').slick({
		infinite : true, 	//무한 반복 옵션	 
		slidesToShow : 8,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 2,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
		autoplay : true,			// 자동 스크롤 사용 여부
		autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		draggable : true, 
	});
});
$(function(){
	// 좋아요버튼 클릭시(좋아요 추가 또는 좋아요 취소)
	$("#heart").click(function(){
		$.ajax({
			url: "/heart",
            type: "POST",
            async : true,
            dataType : "json", 
            data: {
                no: ${1},
                id: 'jang123'
            },
            success: function () {
            	heartCount();
            },
		});
	});
	
	// 좋아요 카운트
    function heartCount() {
		$.ajax({
			url: "/heartCount",
            type: "POST",
            async : true,
            dataType : "json",
            data: {
                no: ${1}
            },
            success: function (count) {
            	$(".heart_count").html(count);
            },
		});
    };
    $(document).ready(function() { // 페이지가 준비되면
	    heartCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
	});
});
    
</script>
<script>
	/*옵션 모달  */
const modal = document.querySelector('#modal'); 
const btnOpenPopup = document.getElementById('option');
const btnCansle = document.querySelector('#modal_cansle');

btnOpenPopup.addEventListener('click', () => { 
	modal.style.display = 'block';
	});
	
btnCansle.addEventListener('click', () => { 
	modal.style.display = 'none';
});	
	/*신고옵션 모달  */
const report_modal = document.querySelector('#report_modal'); 
const report_btnOpenPopup = document.getElementById('report_option');
const report_btnCansle = document.querySelector('#report_modal_cansle');

report_btnOpenPopup.addEventListener('click', () => { 
	modal.style.display = 'none';
	report_modal.style.display = 'block';
	});
report_btnCansle.addEventListener('click', () => { 
	report_modal.style.display = 'none';
});	
	/*차단 모달  */
const meaning_modal = document.querySelector('#meaning_modal'); 
const meaning_btnOpenPopup = document.getElementById('meaning_option')
const meaning_btnCansle = document.querySelector('#meaning_modal_cansle');

meaning_btnOpenPopup.addEventListener('click', () => { 
	meaning_modal.style.display = 'block';
	modal.style.display = 'none';
	});
meaning_btnCansle.addEventListener('click', () => { 
	meaning_modal.style.display = 'none';
});	
</script>
</body>


</html>