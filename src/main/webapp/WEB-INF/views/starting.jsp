<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Starting</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
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
		<div class="feeds">
			<!-- story section -->
			<div class="section-story ">
				<div class="menu-title "></div>
				<ul class="story-list slider">
					<li class="story-list_li ">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">김범진</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">김민재</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">신범기</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">장치영</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='userProfile'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
				</ul>
			</div>
			<!-- article -->
			<article>
				<header>
					<div class="profile-of-article">
						<img class="img-profile1 pic"
							src="${pageContext.request.contextPath}/resources/img/logo.jpg"
							onclick="location.href='/${board_client_id}'"> <span
							class="userID main-id point-span" style="margin-top: 8px;">장치영</span>
					</div>
					<img class="icon-react icon-more"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png"
						alt="more">
				</header>
				<div class="single-item">
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/img/logo.jpg">
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/img/logo.jpg">
					</div>
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/img/logo.jpg">
					</div>
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
						<img class="icon-react" onclick="location.href='starting/comment'"
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png">
						<img class="icon-react" onclick="location.href='starting/message'"  src="/resources/img/dm.png">
					</div>
				</div>
				<!-- article text data -->
				<div class="reaction">
					<div class="liked-people">
						<p>
							<span class="point-span" id="heart_count">0</span>
						</p>
					</div>
					<div class="description">
						<p>
							<span class="point-span userID">travel_behappyhere</span> <span>
								해발 700m 산자락 위, 프라이빗 캠핑 스팟💛 감탄을 자아내는 뷰와 함께 향긋한 메리골드 꽃차를 마시고, 밤이
								되면 머리 위로 별이 쏟아지는 곳✨ 산촌 생활의 불편함 그 자체가 매력적인 팜스테이를 즐기고 싶다면 추천드려요❣

								숙소 이름과 더 자세한 정보는, 👉숙소기록: @rest_behappyhere 에서 확인해주세요! 📷이미지출처
								@1amny @iam_eunz - ⠀ 여행 기록은 #여기서행복할것 태그♥ 여행 제보는 DM 또는 이메일로♥ ⠀
								#여기서행복할것_국내 #behappyhere</span>
						</p>
					</div>
					<div class="comment-section">
						<ul class="comments">
							<li><a id="commentsAll" onclick="#commentsAll">댓글보기</a></li>
						</ul>
					</div>
				</div>
				<div class="hl"></div>
				<div class="comment">
					<form action="" method="post">
						<input id="input-comment" class="input-comment" type="text"
							placeholder="댓글 달기...">
						<button type="submit" class="submit-comment">게시</button>
					</form>
				</div>
			</article>
		</div>
		<!-- main-right -->
		<div class="main-right">
			<div class="myProfile">
				<img class="pic"
					src="${pageContext.request.contextPath}/resources/img/logo.jpg"
					onclick="location.href='#'" style="cursor: pointer;">
				<div>
					<span class="userID point-span">${client_name}</span>
				</div>
				<div>
					<span class="sub-span"
						style="margin-left: 110px; color: #0095f6; font-weight: 600; font-size: 12px; cursor: pointer;">내
						계정</span>
				</div>
			</div>
			<!-- recommendation section -->
			<div class="section-recommend">
				<div class="menu-title">
					<span class="sub-title">회원님을 위한 추천</span> <span class="find-more">모두
						보기</span>
				</div>
				<ul class="recommend-list">
					<li>
						<div class="recommend-friend-profile">
							<img class="img-profile1 story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
							<div class="profile-text1">
								<span class="userID point-span">홍길동</span> <span
									class="sub-span">신범기님 외 5명이 팔로우합니다</span>
							</div>
						</div> <span class="btn-follow">팔로우</span>
					</li>
					<li>
						<div class="recommend-friend-profile">
							<img class="img-profile1 story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
							<div class="profile-text1">
								<span class="userID point-span">강호동</span> <span
									class="sub-span">jang123님이 팔로우합니다</span>
							</div>
						</div> <span class="btn-follow">팔로우</span>
					</li>
					<li>
						<div class="recommend-friend-profile">
							<img class="img-profile1 story"
								src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
							<div class="profile-text1">
								<span class="userID point-span">유재석</span> <span
									class="sub-span">hgggggggg님 외 5명이 팔로우합니다</span>
							</div>
						</div> <span class="btn-follow">팔로우</span>
					</li>
				</ul>
			</div>
		</div>
	</main>

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
	<!-- <script>
	var id = '${id}'; // postid

	function likeview() {
		$.ajax({
			url : '/like/view',
			type : 'post',
			async : true,
			data : {'id' : id}, // postid 보냄
			dataType : "json", // data가 json타입
			success : function(data) {
				var a = '';
				if (data.cnt == 1) {   // 현재 로그인 유저가 포스팅 좋아요를 눌렀음
					a += '<a onclick="likeDelete('+ id +');"' // likeDelete는 밑에서
						+ 'class="glyphicon glyphicon-heart heart" aria-hidden="true"></a>'
					a += '<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> <br />'
					a += '<span><b>좋아요 ' + data.total_cnt + '개</b></span>' // 총 좋아요 개수
				} else if (data.cnt == 0) { // 안눌렀음
					a += '<a onclick="likeInsert('+ id +');"' // likeInsert는 밑에서
						+'class="glyphicon glyphicon-heart-empty heart" aria-hidden="true"></a>'
					a += '<span class="glyphicon glyphicon-comment" aria-hidden="true"></span> <br />'
					a += '<span><b>좋아요 ' + data.total_cnt + '개</b></span>'		
				}
				$('.like').html(a); // <div class="like></div> 이부분에 나타남
			}
		});
	}
	$(document).ready(function() { // 페이지가 준비되면
		likeview(); // 함수 likeview ㄱ
	});
</script> -->

</body>


</html>