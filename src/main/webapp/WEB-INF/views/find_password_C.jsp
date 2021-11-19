<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/find.css">
</head>
<body>
	<div id="login">
		<div id="body" style="padding-top: 19.5px;">
			<div class="container" style="padding-top: 28px;">
				<div class="instagram_logo">
					<img src="${pageContext.request.contextPath}/resources/img/logo.jpg"
						onclick="location.href='/starting'"
						style="cursor: pointer;">
				</div>
				<div class="header_title">비밀번호 재설정</div>
				<div class="navigation_list">
						<div class="navigation_item ">01</div>
						<div class="navigation_item on">02 본인인증</div>
					</div>
				<form action="find_password_Com" method="post">
				<input type="hidden" name="client_id" value="${client.client_id}">
				<input type="hidden" name="client_email" value="${client.client_email}">
				<input type="hidden" name="client_birth" value="${client.client_birth}">
				<div class="login_line"></div>
				<div class="input_section">
				<input class="input" type="password" id="pswd1" name="client_password" placeholder="비밀번호(8자 이상)" required="required">
						<span class="error_next_box"></span>
						<!-- ID -->	
						<input class="input" type="password" id="pswd2" placeholder="비밀번호 재확인" required="required" maxlength="20">
						<span class="error_next_box"></span>
				
				</div>
				<div>
					<input style="background: #ff80ab;" class="button1 input" type="submit" value="확인">
				</div>
				</form>
				<div class="button_section">
					<a class="" href="find_id">아이디 찾기</a>
					<span class="hor_line">|</span>
					<a class="" href="find_password">비밀번호 찾기</a>
					<span class="hor_line ">|</span>
					<a class="" href="join">회원가입</a>
				</div>
			</div>
		</div>
	</div>
<script src="${pageContext.request.contextPath}/resources/js/main.js}"  type="text/javascript"></script>
</body>
</html>