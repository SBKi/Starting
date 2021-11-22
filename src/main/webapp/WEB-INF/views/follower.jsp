<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Starting</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/follow.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/userProfile.css">
</head>
<body style="background-color: #fafafa;">
	<jsp:include page="fragments/header.jsp"></jsp:include>
	<main>
		<div class="follow_body">
			<div class="follow_title">
				<h4 class="title">추천</h4>
			</div>
			<div class="follows_body">
				<div class="follow_list">
					<div class="follow_lists">
						<div class="follow_list_user">
							<div class="follow_list_img">
								<div class="img_box">
									<div>
										<a>
											<img style="width: 60px;" alt="" src="${pageContext.request.contextPath}/resources/img/person.png">
										</a>
									</div>
								</div>
							</div>
							<div class="follow_list_name">
								<div class="user_id">
									<div>
										<span>
											<a href="userProfile">client_id</a>
										</span>
									</div>
								</div>
								<div class="user_name">
									<div>
										<span>client_name</span>
									</div>
								</div>
								<div class="user_info">
									<div >
										<div>
											<span>client_info</span>
										</div>
									</div>
								</div>
							</div>
							<div class="follow_list_button">
								<button id="follow_update" class="follow_list_button">팔로우</button>
							</div>
						</div>
					</div>
					<div class="follow_lists">
						<div class="follow_list_user">
							<div class="follow_list_img">
								<div class="img_box">
									<div>
										<a>
											<img style="width: 60px;" alt="" src="${pageContext.request.contextPath}/resources/img/person.png/${list.client_img}">
										</a>
									</div>
								</div>
							</div>
							<div class="follow_list_name">
								<div class="user_id">
									<div>
										<span>
											<a href="userProfile/${list.client_id }">${list.clientid_id }</a>
										</span>
									</div>
								</div>
								<div class="user_name">
									<div>
										<span>${list.clientid_name }</span>
									</div>
								</div>
								<div class="user_info">
									<div >
										<div>
											<span>${list.clientid_info }</span>
										</div>
									</div>
								</div>
							</div>
							<div class="follow_list_button">
								<button type="button" class="follow_list_button">팔로우</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>
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
						<button class="modal_button" id="meaning_option" tabindex="0" style="color: red; font-weight: 700;"
							onclick="meaning_modal"><span>차단하기</span></button>
						<button id="modal_cansle" class="modal_button" tabindex="0">취소</button>
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
	/*팔로우 모달  */
const follow_modal = document.querySelector('#follow_modal'); 
const btnOpenPopup = document.getElementById('follow_update');
const btnCansle = document.querySelector('#modal_cansle');

btnOpenPopup.addEventListener('click', () => { 
	follow_modal.style.display = 'block';
	});
	
btnCansle.addEventListener('click', () => { 
	follow_modal.style.display = 'none';
});	
/*차단 모달  */
const meaning_modal = document.querySelector('#meaning_modal'); 
const meaning_btnOpenPopup = document.getElementById('meaning_option')
const meaning_btnCansle = document.querySelector('#meaning_modal_cansle');

meaning_btnOpenPopup.addEventListener('click', () => { 
	meaning_modal.style.display = 'block';
	follow_modal.style.display = 'none';
	});
meaning_btnCansle.addEventListener('click', () => { 
	meaning_modal.style.display = 'none';
});
</script>
	

</body>


</html>