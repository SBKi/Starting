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
	href="${pageContext.request.contextPath}/resources/css/userProfile.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/comment.css">
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

.modal  .report_modal .meaning_modal {
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	width: auto;
	height: 100%;
}

.single-item {
	height: 100%;
}
</style>
</head>
<body style="background-color: #fafafa;">
	<jsp:include page="fragments/header.jsp"></jsp:include>
	<main>
		<div class="comment">
			<div class="comment_body">
				<div class="modal_main">
					<div class="modal_main2">
						<article class="modal_main3">
							<div class="modal_main4">
								<div class="modal_left1">
									<div class="single-items">
										<div>
											<img
												src="${pageContext.request.contextPath}/resources/img/liked.png">
												${whiteboard.whiteboard_img1 }
										</div>
										<div>
											<img
												src="${pageContext.request.contextPath}/resources/img/dm.png">
												${whiteboard.whiteboard_img2 }
										</div>
										<div>
											<img
												src="${pageContext.request.contextPath}/resources/img/logo.jpg">
												${whiteboard.whiteboard_img3 }
										</div>
									</div>
								</div>
								<div class="modal_right1"
									style="overflow: hidden;">
									<header>
										<div class="profile-of-article">
											<img class="img-profile1 pic"
												src="${pageContext.request.contextPath}/resources/img/logo.jpg"
												onclick="location.href='/userProfile/jang123'">
											<h3 class="userID main-id point-span"
												style="margin-top: 8px;">jang96</h3>

											<button id="follow_update" class="follow_list_button" style="margin-top: 8px;">팔로우</button>
										</div>
										<img class="icon-react icon-more" id="option"
											src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png"
											alt="more">
									</header>
									<div>
										<div class="EtaWk">
											<ul class="XQXOT    pXf-y ">
											<c:forEach var="comment" items="${commentlist }">
												<div role="button" class="ZyFrc" tabindex="0">
													<li class="gElp9 rUo9f  PpGvg " role="menuitem"><div
															class="P9YgZ">
															
															<div class="C7I1f X7jCj">
																<div class="Jv7Aj mArmR   pZp3x">
																	<div class="RR-M-  TKzGu  " role="button" tabindex="-1">
																		<canvas class="CfWVH" height="53" width="53"
																			style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
																		<a class="_2dbep qNELH kIKUG" href="/zeromin_96/"
																			tabindex="0"
																			style="width: 32px; height: 32px; display: block;"><img
																			src="${pageContext.request.contextPath}/resources/img/person.png"
																			class="_6q-tv"></a>
																	</div>
																</div>
																
																<div class="C4VMK">
																	<h3 class="_6lAjh ">
																		<div>
																			<span><a href="/starting/${comment.comment_id }">${comment.comment_id
																					}</a></span>
																		</div>
																	</h3>
																	<span class="">${comment.comment_content} </span>
																	<div
																		class="             qF0y9          Igw0E     IwRSH      eGOV_         _4EzTm   pjcA_                                                         aGBdT                                                  ">
																		<div
																			class="_7UhW9  PIoXz       MMzan   _0PwGv         uL8Hv         ">
																		</div>
																	</div>
																</div>
																
															</div>
														</div></li>
												</div>
												</c:forEach>
											</ul>
										</div>
									</div>
									<div class="icons-react">
										<div class="icons-left">
											<c:if test="${!heartCheck }">
												<i class="fa fa-heart-o heart" style="cursor: pointer;"
													onclick="like(heart)"></i>
												<span class="visually-hiddewn"></span>
											</c:if>
											<!-- 이미 관심등록 되어있음 -->
											<c:if test="${heartCheck }">
												<i class="fa heart heart-clicked fa-heart"
													style="color: red; cursor: pointer;"
													onclick="unLike(heart)"></i>
												<span class="visually-hidden"></span>
											</c:if>
											<img class="icon-react"
												onclick="location.href='/starting/message'"
												src="/resources/img/dm.png">
										</div>
									</div>
									<div class="reaction">
										<div class="liked-people">
											<p>
												<span class="point-span" id="heart_count">0</span>
											</p>
										</div>
									</div>
									<div class="comment">
										<form action="comment/save" method="post">
											<input type="hidden" name="comment_no" value="0">
											<input type="hidden" name="comment_whiteboard_no" value="${whiteboard.whiteboard_no }">
											<input type="hidden" name="comment_id" value="${client.client_id }">
											<input id="input-comment" name="comment_content" style="width: 420px;"
												class="input-comment" type="text" placeholder="댓글 달기..."
												>
											<button type="submit" class="submit-comment">게시</button>
										</form>
									</div>
								</div>
							</div>
						</article>
					</div>
				</div>

			</div>
			<div class="profile_board_body">

				<div class="profile_board">
					<a aria-selected="true" class="_9VEo1 T-jvg" role="tab" href=""
						tabindex="0"><span class="smsjF"><svg aria-label=""
								class="_8-yf5 " color="#262626" fill="#262626" height="24"
								role="img" viewBox="0 0 48 48" width="24">
							<path clip-rule="evenodd"
									d="M45 1.5H3c-.8 0-1.5.7-1.5 1.5v42c0 .8.7 1.5 1.5 1.5h42c.8 0 1.5-.7 1.5-1.5V3c0-.8-.7-1.5-1.5-1.5zm-40.5 3h11v11h-11v-11zm0 14h11v11h-11v-11zm11 25h-11v-11h11v11zm14 0h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11zm14 28h-11v-11h11v11zm0-14h-11v-11h11v11zm0-14h-11v-11h11v11z"
									fill-rule="evenodd"></path></svg> </span> </a>
				</div>
				<div>
					<span class="PJXu4">게시물</span>
				</div>

			</div>
			<div class="profile_board_imgs">
				<div class="board_imgs">
					<div class="board_img">
						<img onclick="location.href='comment/${1}'" class="img" alt="1"
							src="${pageContext.request.contextPath}/resources/img/dm.png"><a
							href="comment/${comment.no }"></a>
					</div>
					<div class="board_img">
						<img class="img" alt="1"
							src="${pageContext.request.contextPath}/resources/img/dm.png">
						<a href="comment/${comment.no }"></a>
					</div>
					<div class="board_img">
						<img class="img" alt="1"
							src="${pageContext.request.contextPath}/resources/img/dm.png"><a
							href="comment/${comment.no }"></a>
					</div>
					<div class="board_img">
						<img class="img" alt="1"
							src="${pageContext.request.contextPath}/resources/img/dm.png"><a
							href="comment/${comment.no }"></a>
					</div>
					<div class="board_img">
						<img class="img" alt="1"
							src="${pageContext.request.contextPath}/resources/img/dm.png"><a
							href="comment/{comment.no }"></a>
					</div>
					<div class="board_img">
						<img class="img" alt="1"
							src="${pageContext.request.contextPath}/resources/img/dm.png"><a
							href="comment/${comment.no }"></a>
					</div>
					<div class="board_img">
						<img class="img" alt="1"
							src="${pageContext.request.contextPath}/resources/img/dm.png"><a
							href="comment/${comment.no }"></a>
					</div>
				</div>
			</div>

		</div>

	</main>
	<div class="RnEpo  Yx5HN " id="modal">
		<div class="pbNvD  fPMEg">
			<div class="_1XyCr  ">
				<div class="piCib">
					<div class="modal_button_body">
						<!--내 글 이면-->
						<button class="modal_button" tabindex="0"
							onclick="location.href='delete'">삭제하기</button>
						<button id="modal_cansle" class="modal_button" tabindex="0">취소</button>
						<!-- 상대방 글 이면 -->
						<button class="modal_button" id="report_option" tabindex="0"
							onclick="report_modal">신고하기</button>
						<button class="modal_button" id="meaning_option" tabindex="0"
							onclick="meaning_modal">차단하기</button>
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
	<div class="RnEpo  Yx5HN " id="follow_modal">
		<div class="pbNvD1  fPMEg">
			<div class="_1XyCr  ">
				<div class="piCib">
					<div class="modal_button_body">
						<div class="user_profile">
							<img class="user_img" src="${pageContext.request.contextPath}/resources/img/person.png">
							<div>
								<h4 class="h4">{client_id} 님을 팔로우 하시겠습니까?</h4>
							</div>
						</div>
						<button class="modal_button" tabindex="0" style="font-weight: 700; "
							onclick="location.href='update'"><span>팔로우 하기</span></button>
						<button id="follow_modal_cansle" class="modal_button" tabindex="0">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
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
/*팔로우 모달  */
const follow_modal = document.querySelector('#follow_modal'); 
const follow_btnOpenPopup = document.getElementById('follow_update');
const follow_btnCansle = document.querySelector('#follow_modal_cansle');

follow_btnOpenPopup.addEventListener('click', () => { 
	follow_modal.style.display = 'block';
	});
	
follow_btnCansle.addEventListener('click', () => { 
	follow_modal.style.display = 'none';
});
</script>
	<script type="text/javascript">
$(document).ready(function(){
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
</body>


</html>