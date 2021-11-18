<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디찾기</title>
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
				<div>
					<div class="header_title">아이디 찾기</div>
					<div class="navigation_list">
						<div class="navigation_item on">01 본인인증</div>
						<div class="navigation_item">02</div>
					</div>
				</div>
				<div class="login_line"></div>
				<form action="find_id_C" method="post">
					<div class="input_section">
						<input class="input" type="text" id="name" name="client_name" placeholder="이름" required="required">
						<input class="input" type="email" id="email" name="client_email" placeholder="이메일(주소)" required="required">
						<input class="input" type="date" id="birth" name="client_birth" placeholder="생년월일" required="required">
					</div>
					<div>
						<input class="submit_button1" type="submit" value="확인">
						<input class="cancel_button" type="button" value="취소" onclick="location.href='login'">
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
</body>
</html>