<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스타팅</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/detail.css">
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
							<img class="img-profile story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">김범진</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">김민재</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">신범기</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story" src="${pageContext.request.contextPath}/resources/img/logo.jp"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">안준석</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">장치영</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story"src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
						</div>
						<div class="profile-text">
							<span class="userID point-span">한병훈</span>
						</div>
					</li>
					<li class="story-list_li">
						<div class="gradient-wrap">
							<img class="img-profile story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
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
						<img class="img-profile1 pic"src="${pageContext.request.contextPath}/resources/img/logo.jpg"
							onclick="location.href='/instagram'"> <span
							class="userID main-id point-span" style="margin-top: 8px;">장치영</span>
					</div>
					<img class="icon-react icon-more"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png"
						alt="more">
				</header>
				<div class="single-item">
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/logo.jpg">
					</div>
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/logo.jpg">
					</div>
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/logo.jpg">
					</div>
				</div>
				<div class="icons-react">
					<div class="icons-left">
						<img class="icon-react" id="heart" onclick=""
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/heart.png">
						<img class="icon-react"
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png">
						<img class="icon-react" src="img/dm.png">
					</div>
					<img class="icon-react"
						src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/bookmark.png"
						alt="북마크">
				</div>
				<!-- article text data -->
				<div class="reaction">
					<div class="liked-people">
						<p>
							<span class="point-span">좋아요 777개</span>
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
				<img class="pic" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
					onclick="location.href='#'" style="cursor: pointer;">
				<div>
					<span class="userID point-span">장치영</span>
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
							<img class="img-profile1 story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
							<div class="profile-text1">
								<span class="userID point-span">홍길동</span> <span
									class="sub-span">신범기님 외 5명이 팔로우합니다</span>
							</div>
						</div> <span class="btn-follow">팔로우</span>
					</li>
					<li>
						<div class="recommend-friend-profile">
							<img class="img-profile1 story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
								onclick="location.href='#'" style="cursor: pointer;">
							<div class="profile-text1">
								<span class="userID point-span">강호동</span> <span
									class="sub-span">jang123님이 팔로우합니다</span>
							</div>
						</div> <span class="btn-follow">팔로우</span>
					</li>
					<li>
						<div class="recommend-friend-profile">
							<img class="img-profile1 story" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
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
	<div class="modal">
		<div class="modal_body">
			<div class="modal_body2">
				<div class=" modal_body3"></div>
			</div>
		</div>
		<div class="modal_main">
			<div class="modal_main2">
				<article class="modal_main3">
					<div class="modal_main4">
						<div class="modal_left1">
							<div class="single-items">
								<div>
									<img src="${pageContext.request.contextPath}/resources/img/liked.png">
								</div>
								<div>
									<img src="${pageContext.request.contextPath}/resources/img/dm.png">
								</div>
								<div>
									<img src="${pageContext.request.contextPath}/resources/img/home.png">
								</div>
								<div>
									<img src="${pageContext.request.contextPath}/resources/img/logo.jpg">
								</div>
							</div>
						</div>
						<div class="modal_right1">
							<header>
								<div class="profile-of-article">
									<img class="img-profile1 pic" src="${pageContext.request.contextPath}/resources/img/logo.jpg"
										onclick="location.href='/instagram'"> <span
										class="userID main-id point-span" style="margin-top: 8px;">장치영</span>
								</div>
								<img class="icon-react icon-more"
									src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png"
									alt="more">
							</header>

							<div class="icons-react">
								<div class="icons-left">
									<img class="icon-react" id="heart" onclick=""
										src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/heart.png">
									<img class="icon-react"
										src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png">
									<img class="icon-react" src="img/dm.png">
								</div>
								<img class="icon-react"
									src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/bookmark.png"
									alt="북마크">
							</div>
							<div class="reaction">
								<div class="liked-people">
									<p>
										<span class="point-span">좋아요 777개</span>
									</p>
								</div>
							</div>
							<div class="comment">
								<form action="" method="post">
									<input id="input-comment" style="width: 526px;"
										class="input-comment" type="text" placeholder="댓글 달기...">
									<button type="submit" class="submit-comment">게시</button>
								</form>
							</div>
						</div>
						<div class="modal_cansle">
							<button id="modal_cansle" class="modal_cansle" type="button">
								<div class="QBdPU ">
									<svg class="xbotton" color="#ffffff"
										fill="#ffffff" height="24" role="img" viewBox="0 0 48 48"
										width="24">
										<path clip-rule="evenodd"
											d="M41.8 9.8L27.5 24l14.2 14.2c.6.6.6 1.5 0 2.1l-1.4 1.4c-.6.6-1.5.6-2.1 0L24 27.5 9.8 41.8c-.6.6-1.5.6-2.1 0l-1.4-1.4c-.6-.6-.6-1.5 0-2.1L20.5 24 6.2 9.8c-.6-.6-.6-1.5 0-2.1l1.4-1.4c.6-.6 1.5-.6 2.1 0L24 20.5 38.3 6.2c.6-.6 1.5-.6 2.1 0l1.4 1.4c.6.6.6 1.6 0 2.2z"
											fill-rule="evenodd"></path></svg>
								</div>
							</button>
						</div>
					</div>
				</article>
			</div>
		</div>
		<div></div>
	</div>
	<button class="btn-open-popup">Modal 띄우기</button>
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
  $('.single-items').slick({
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
});
</script>
	<script> 
const modal = document.querySelector('.modal'); 
const btnOpenPopup = document.querySelector('#commentsAll');
btnOpenPopup.addEventListener('click', () => { 
	modal.style.display = 'block';
	 $('.single-items').slick({
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
	});
const btnCansle = document.querySelector('#modal_cansle');
btnCansle.addEventListener('click', () => { 
	modal.style.display = 'none';
});	
</script>

</body>


</html>