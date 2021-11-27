<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.modihd {
	display: none;
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
											<img style="height: 475px;"	src="/img/${whiteboard.whiteboard_img1 }">
										</div>
										<c:if test="${whiteboard.whiteboard_img2 != null }">
											<div>
												<img style="height: 475px;"	src="/img/${whiteboard.whiteboard_img2 }">
											</div>
										</c:if>
										<c:if test="${whiteboard.whiteboard_img3 != null }">
											<div>
												<img style="height: 475px;"	src="/img/${whiteboard.whiteboard_img3 }">
											</div>
										</c:if>
									</div>
								</div>
								<div class="modal_right1" style="overflow: hidden;">
									<header>
										<div class="profile-of-article">
											<img class="img-profile1 pic" src="/img/${board_writer.client_img }" onclick="location.href='/starting/userProfile?${whiteboard.whiteboard_client_id}'">
											<h3 class="userID main-id point-span" style="margin-top: 8px;">${board_writer.client_name }</h3>
												<span style="margin-top: 8px; color:gray;">(${whiteboard.whiteboard_client_id })</span>
										</div>
										<img class="icon-react icon-more" id="option" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png">
									</header>
									<div>
										<div class="EtaWk">
											<ul class="XQXOT    pXf-y " style="height: 350px;" id="comment_">
												<c:forEach var="comment" items="${commentlist }" varStatus="status">
													<div role="button" class="ZyFrc" tabindex="0">
														<li class="gElp9 rUo9f  PpGvg " role="menuitem">
															<div class="C7I1f X7jCj">
																<div class="Jv7Aj mArmR   pZp3x">
																	<div class="RR-M-  TKzGu  " role="button" tabindex="-1">
																		<canvas class="CfWVH" height="53" width="53" style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
																		<a class="_2dbep qNELH kIKUG" href="/starting/userProfile?client_id=${comment.comment_id }"	tabindex="0" style="width: 32px; height: 32px; display: block;">
																			<img src="/img/${clientlist.get(status.count-1).client_img }"class="_6q-tv">
																		</a>
																	</div>
																</div>

																<div class="C4VMK">
																		<div>
																	<h3 class="_6lAjh ">
																			<span><a style="font-size: 15px;"  href="/starting/userProfile?client_id=${comment.comment_id }">${clientlist.get(status.count-1).client_name }</a></span>
																		</div>
																	</h3>
																	<span class="">${comment.comment_content} </span>
																	<div id="modiComment_${comment.comment_no }"
																		class="modihd modiDiv_${comment.comment_no }">
																		<form action="comment/modify" method="post">
																			<input type="text" name="modityText"
																				value="${comment.comment_content }"> <input
																				type="hidden" name="modityNo"
																				value="${comment.comment_no }"> <input 
																				type="hidden" name="whiteboard_no"
																				value="${comment.comment_whiteboard_no }"> <input class="comment_update"
																				type="submit" value="수정하기">
																		</form>
																	</div>
																	<c:if test="${client.client_id eq comment.comment_id }">
																	<div style="display: flex; flex-direction: row;">
																		<svg  class="_8-yf5 " onclick="modity('${comment.comment_no }')"
																			color="#262626" fill="#262626" height="24" role="img"
																			viewBox="0 0 24 24" width="24">
																			<path
																				d="M12.202 3.203H5.25a3 3 0 00-3 3V18.75a3 3 0 003 3h12.547a3 3 0 003-3v-6.952"
																				fill="none" stroke="currentColor"
																				stroke-linecap="round" stroke-linejoin="round"
																				stroke-width="2"></path>
																			<path
																				d="M10.002 17.226H6.774v-3.228L18.607 2.165a1.417 1.417 0 012.004 0l1.224 1.225a1.417 1.417 0 010 2.004z"
																				fill="none" stroke="currentColor"
																				stroke-linecap="round" stroke-linejoin="round"
																				stroke-width="2"></path>
																			<line fill="none" stroke="currentColor"
																				stroke-linecap="round" stroke-linejoin="round"
																				stroke-width="2" x1="16.848" x2="20.076" y1="3.924"
																				y2="7.153"></line></svg>
																			<img style="width: 20px; height: 20px; margin-left: 12px;" onclick="location.href='/starting/comment/delete?comment_no=${comment.comment_no }'"
																				src="${pageContext.request.contextPath}/resources/img/x.png">
																		</div>
																	</c:if>
																</div>
															</div>
														</li>
													</div>
												</c:forEach>
											</ul>
										</div>
									</div>
									<div class="comment">
										<form action="comment/save" method="post">
											<input type="hidden" name="comment_no" value="0"> 
											<input type="hidden" name="comment_whiteboard_no" value="${whiteboard.whiteboard_no }"> 
											<input type="hidden" name="comment_id" value="${client.client_id }">
											<input id="input-comment" name="comment_content"style="width: 400px; margin-left: 16px;" class="input-comment" type="text"	placeholder="댓글 달기...">
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
					<c:forEach var="board" items="${board_list }">
						<div>
							<img class="board_img img"
								onclick="location.href='/starting/comment?whiteboard_no=${board.whiteboard_no}&client_id=${board.whiteboard_client_id }'"
								src="/img/${board.whiteboard_img1 }">
						</div>
					</c:forEach>
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
						<c:if
							test="${client.client_id eq whiteboard.whiteboard_client_id}">
							<button class="modal_button" tabindex="0"
								onclick="location.href='delete?whiteboard_no=${whiteboard.whiteboard_no}'">삭제하기</button>
							<button class="modal_button" tabindex="0"
								onclick="location.href='update?whiteboard_no=${whiteboard.whiteboard_no}'">수정하기</button>
							<button id="modal_cansle" class="modal_button" tabindex="0">취소</button>
						</c:if>
						<!-- 상대방 글 이면 -->
						<c:if
							test="${client.client_id ne whiteboard.whiteboard_client_id}">
							<button class="modal_button" id="meaning_option" tabindex="0"
								onclick="meaning_modal">차단하기</button>
							<button id="modal_cansle" class="modal_button" tabindex="0">취소</button>
						</c:if>
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
	<script>
	/*옵션 모달  */
$("#comment_").scrollTop($("#comment_")[0].scrollHeight);	
const modal = document.querySelector('#modal'); 
const btnOpenPopup = document.getElementById('option');
const btnCansle = document.querySelector('#modal_cansle');

btnOpenPopup.addEventListener('click', () => { 
	modal.style.display = 'block';
	});
	
btnCansle.addEventListener('click', () => { 
	modal.style.display = 'none';
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
	<script type="text/javascript">
	function modity(comment_no){
		$('#modiComment_'+comment_no).css('display','block');
		
	}
	
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