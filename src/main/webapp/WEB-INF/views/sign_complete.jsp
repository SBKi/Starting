<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
				<div class="header_title">회원가입을 축하드립니다!!</div>
				<div class="login_line"></div>
				<div class="">
					<table>
					<tr> 
					<td>아이디 : </td>
					<td>${client.client_id}</td>
					</tr>
					<tr> 
					<td>이름 : </td>
					<td>${client.client_name}</td>
					</tr>
					<tr> 
					<td>키 : </td>
					<td>${client.client_tall}</td>
					</tr>
					<tr> 
					<td>이메일 : </td>
					<td>${client.client_email}</td>
					</tr>
					<tr> 
					<td>주소 : </td>
					<td>${client.client_address}</td>
					</tr>
					</table>
					
				</div>
				<div>
					<input class="submit_button" type="button" value="확인" onclick="location.href='login'">
				</div>
				<div class="button_section">
					<a class="" href="find_id">아이디 찾기</a>
					<span class="hor_line">|</span>
					<a class="" href="find_password">비밀번호 찾기</a>
					<span class="hor_line ">|</span>
					<a class="" href="sign_up">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>