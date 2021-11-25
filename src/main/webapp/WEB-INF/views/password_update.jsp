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
	margin-bottom: 40px;
}

label {
	display: inline-block;
	margin-bottom: 0.5rem;
	margin-top: 11px;
	width: 130px;
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
	height: 606px;
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
									<h3 style="margin: 24px;">비밀번호 변경</h3>
								</div>
								<div>
									<form id="myForm" action="password_update" method="post">

										<div class="input_div">
											<label>현재 비밀번호</label> <input class="w3-input"
												type="password" id="old_pw" name="old_password" required>
										</div>
										<div class="input_div">
											<label>새 비밀번호</label> <input class="w3-input" type="password"
												id="new_pw" name="new_password" required>
										</div>
										<div class="input_div">
											<label>새 비밀번호 확인</label> <input class="w3-input"
												type="password" id="new_pw" name="new_password2" required>
										</div>
										<p class="w3-center">
											<button type="submit"
												class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호
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
</body>
</html>