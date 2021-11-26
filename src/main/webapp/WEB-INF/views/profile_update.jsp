<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>
/* 공통 */
/* 사이드바 래퍼 스타일 */
#page-wrapper {
	padding-left: 250px;
}

#sidebar-wrapper {
	position: fixed;
	width: 250px;
	height: 606px;
	margin-left: -179px;
	background: #f3eaed;
	border: 1px solid #ebebeb;
}

#page-content-wrapper {
	width: 100%;
	margin-left: 20px;
}
/* 사이드바 스타일 */
.sidebar-nav {
	width: 250px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li {
	text-indent: 1.5em;
	line-height: 2.8em;
}

.sidebar-nav li a {
	display: block;
	text-decoration: none;
	color: #a75b8f;
}

.sidebar-nav li a:hover {
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.3em;
	line-height: 3em;
}

h2 {
	font-family: "Lucida Console", "Courier New", monospace;
	color: pink;
}

body {
	font-family: 'Nanum Gothic', '맑은 고딕', Helvetica, Arial, sans-serif;
	line-height: 100%;
	color: #676767;
	border-top: 7px solid #7cc0cb; /*넓이 스타일 색상*/
}
/* 여기까지 */
.btn-outline-success1 {
	color: #d98a9c;
	border-color: #d9a3af;
}

.btn-outline-danger1 {
	color: #8b8d20;
	border-color: #9b911f;
}

.w3-black, .w3-hover-black:hover {
	color: #b77ead !important;
	background-color: #f3eaed !important;
}

.w3-content, .w3-auto {
	margin-left: 5px;
	margin-right: 5px;
}

.w3-input {
	border-radius: 8px;
	width: 280px;
}

.input_div {
	display: flex;
	flex-direction: row;
	margin-bottom: 5px;
}

label {
	display: inline-block;
	margin-bottom: 0.5rem;
	margin-top: 11px;
	width: 80px;
}

.select_box_div {
	border-radius: 7px;
	height: 30px;
	width: 180px;
	text-align: center;
}

.w3-margin-top {
	margin-top: auto;
}

.w3-content {
	width: 580px;
}

.instruction {
	width: 435px;
	border-radius: 14px;
}

.w3-card-4 {
	border: 1px solid #EBEBEB;
}
</style>
</head>
<body>
	<jsp:include page="fragments/header.jsp"></jsp:include>
	<main>
		<div id="page-wrapper">
			<!-- 사이드바 -->
			<div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="./main">Starting gram</a></li>
					<li><a class="leftitems" href="./userProfile">마이페이지</a></li>
					<li><a class="leftitems" href="./profile_update">개인정보 변경</a></li>
					<li><a class="leftitems" href="./password_update">비밀번호 변경</a></li>
				</ul>
			</div>
			<!-- /사이드바 -->

			<!-- 본문 -->
			<div id="page-content-wrapper">
				<div class="container-fluid">
					<div class="container">
						<div class="w3-content w3-container ">
							<div class="w3-container w3-card-4">
								<div class="w3-center w3-large ">
									<h3 style="margin: 24px;">개인정보 변경</h3>
								</div>
								<div>
									<form id="myForm" action="profile_update" method="post">

										<div class="input_div">
											<label>ID</label> <input class="w3-input" type="text" id="id"
												name="client_id" readonly value="${ user.client_id }">
										</div>
										<div class="input_div" style="display: none;">
											<input class="w3-input" type="hidden" id="pswd1"
												name="client_password" value="${ user.client_password }">
										</div>
										<div class="input_div" style="display: none;">
											<input class="w3-input" type="hidden" id="img"
												name="client_img" value="${ user.client_img }">
										</div>
										<div class="input_div">
											<label>Email</label> <input class="w3-input" type="text"
												id="email" name="client_email" readonly
												value="${ user.client_email }">
										</div>
										<div class="input_div">
											<label>이름</label> <input class="w3-input" type="text"
												id="name" name="client_name" readonly
												value="${ user.client_name}" required>
										</div>
										<div class="input_div">
											<label>성별</label>
											<c:if test="${ user.client_gender eq 'M' }">
												<input class="w3-input" type="text" readonly value="남자">
												<input class="w3-input" style="display: none;" type="hidden"
													id="gender" name="client_gender" readonly
													value="${user.client_gender}">
											</c:if>
											<c:if test="${ user.client_gender eq 'F' }">
												<input class="w3-input" type="text" readonly value="여자">
												<input class="w3-input" style="display: none;" type="hidden"
													id="gender" name="client_gender" readonly
													value="${user.client_gender }">
											</c:if>
										</div>
										<div class="input_div">
											<label>생년월일</label> <input class="w3-input" type="date"
												id="birth" name="client_birth" min="1985-01-01"
												max="2001-12-31" value="${user.client_birth }">
										</div>
										<div class="input_div">
											<label>주소</label> <input class="input1" type="button"
												style="border-radius: 5px; border: 0px;" value="주소 검색"
												onclick="findAddr()"><br> <input
												class="w3-input" type="text" style="width: 203px"
												id="userAddress" name="client_address"
												value="${ user.client_address }">
										</div>
										<div class="input_div">
											<label>신장</label> <input class="w3-input" type="number"
												id="tall" name="client_tall" value="${ user.client_tall }">
										</div>
										<div class="input_div">
											<label>자기소개</label>
											<textarea rows="6" cols="200" class="instruction"
												id="instruction" name="client_instruction">${ user.client_instruction }</textarea>
										</div>
										<div class="input_div">
											<label>MBTI</label>
											<div class="info_select_box">
												<select name="Client_info" id="info" class="select_box_div">
													<option value="${user.client_info }">${user.client_info }</option>
													<option value="INTJ">INTJ</option>
													<option value="INTP">INTP</option>
													<option value="ENTJ">ENTJ</option>
													<option value="ENTP">ENTP</option>
													<option value="INFJ">INFJ</option>
													<option value="INFP">INFP</option>
													<option value="ENFJ">ENFJ</option>
													<option value="ENFP">ENFP</option>
													<option value="ISTJ">ISTJ</option>
													<option value="ISFJ">ISFJ</option>
													<option value="ESTJ">ESTJ</option>
													<option value="ESFJ">ESFJ</option>
													<option value="ISTP">ISTP</option>
													<option value="ISFP">ISFP</option>
													<option value="ESTP">ESTP</option>
													<option value="ESFP">ESFP</option>
												</select>
											</div>
										</div>
										<p class="w3-center">
											<button type="submit"
												class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보
												변경</button>
										</p>
									</form>
									<br />

								</div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
		<!-- /본문 -->
	</main>
	<div class="RnEpo  Yx5HN " id="modal">
		<div class="pbNvD  fPMEg">
			<div class="_1XyCr  ">
				<div class="piCib">
					<div class="modal_button_body">
						<div class="w3-content w3-container ">
							<div class="w3-center w3-large ">
								<h3>비밀번호 확인</h3>
							</div>
							<div class="input_div" style="margin-top: 30px;">
								<label>비밀번호</label> <input class="w3-input" id="pswd2"	name="client_password" type="password" required> 
								<input	type="submit" id="joinBtn" style="width: 138px;" class="w3-button w3-block w3-black w3-ripple  w3-round"value="비밀번호 확인" onclick="chkPw()" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function findAddr() {
			daum.postcode.load(function() {
				new daum.Postcode({
					oncomplete : function(data) {
						// 각 주소의 규칙에 따라 주소 조합
						// 가져올 변수가 없을때는 공백을 가지기 때문에 이를 참고해 분기한다고 한다
						var addr = ''; //주소 변수
						// 사용자가 선택한 주소타입(도로명/지번)에 따라 해당 값 가져오기
						// 만약 사용자가 도로명 주소를 선택했을 때
						if (data.userSelectedType == 'R') {
							addr += data.sido + " ";
							addr += data.sigungu + " ";
							addr += data.bname;
							// 만약 사용자가 구주소를 선택했을 때
						} else {
							addr += data.sido + " ";
							addr += data.sigungu + " ";
							addr += data.bname;
						}
						// 주소정보
						document.getElementById('userAddress').value = addr;
					}
				}).open();
			});
		}

		const modal = document.querySelector('#modal');
		const pw1 = document.querySelector('#pswd1'); //비밀번호
		function chkPw() {
		var pwd1 = $('#pswd1').val();
		var pwd2 = $('#pswd2').val();
		var data = {pwd1 : pwd1,pwd2:pwd2};
		
			$.ajax({
				type : 'POST', //post 방식으로 전송
				url : '/starting/password_check', //데이터를 주고받을 파일 주소
				data : JSON.stringify(data),
				contentType : "application/json",
				success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
					if(data.pwd == "true"){
						modal.style.display = 'none';
					}else{
						alert("비밀번호 일치하지 않습니다.");
								history.back();
					}
				}
			});
		};

	</script>
</body>
</html>