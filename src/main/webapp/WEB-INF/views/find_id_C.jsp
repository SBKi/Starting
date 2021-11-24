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
				<div class="header_title">아이디 찾기 완료</div>
				<div class="navigation_list">
						<div class="navigation_item ">01</div>
						<div class="navigation_item on">02 결과</div>
					</div>
				<div class="login_line"></div>
				<div class="">
					<table>
					<tr> 
					<td>아이디 : </td>
					<td>${user.client_id}</td>
					</tr>
					</table>
					
				</div>
				<div>
					<input style="background: #ff80ab;" class="button1 input" type="button" value="확인" onclick="location.href='login'">
				</div>
				<div class="button_section">
					<a class="" href="find_password">비밀번호 찾기</a>
					<span class="hor_line ">|</span>
					<a class="" href="join">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>