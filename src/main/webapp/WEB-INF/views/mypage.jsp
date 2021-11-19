<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="shortcut icon" href="/React-PortFolio/favicon.ico">
    <link rel="stylesheet" type="text/css"  href="./mobile.css" media="only screen and (max-width:400px)"  />
    <link rel="stylesheet" type="text/css"  href="./desktop.css" media="only screen and (min-width:401px)"  />
<style>
/* 공통 */
/* 사이드바 래퍼 스타일 */
  #page-wrapper {
    padding-left: 250px;
  }
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #f3eaed;
    overflow-x: hidden;
    overflow-y: auto;
  }
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
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
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
  h2{
  font-family: "Lucida Console", "Courier New", monospace;
  }
  img {
  border-radius: 50%;
}
body {
    font-family: 'Nanum Gothic', '맑은 고딕', Helvetica, Arial, sans-serif;
    line-height: 100%;
    color: #676767;
    border-top: 7px solid #7cc0cb; /*넓이 스타일 색상*/
}
/* 여기까지 */

/* mypage.css */
@font-face {
    font-family: 'Nanum Gothic';
    src: url('./font/NanumGothicCoding.ttf');
}
@font-face {
    font-family: 'Yanone';
    src: url('./font/YanoneKaffeesatz-Regular.ttf');
}
html, body {
    width: 100%; height: 100%;
}
img {
    border: none;
}
#wrap {
    width: 600px;
}
/*타이틀*/
#contents h1 {
    color: #888888;
    font-size: 50px;
    line-height: 70px;
    padding:0 0 15px 0;
    margin-bottom: 30px;
    text-transform: uppercase;
    text-shadow: 1px 1px 1px #cecece;
    font-family: 'Yanone', 'Nanum Gothic', '맑은 고딕', Helvetica, Arial, sans-serif;
}
/*aboutme*/
.onethird {
    width: 400px;
    margin-right: 21px;
    float: left;
}
.last {
    margin-right: 0;
    float: right;
}
h2 {
    font-size: 20px;
    line-height: 25px;
    margin-bottom: 10px;
}
/*추가 css 리셋*/
img, input, select, textarea, label {
    vertical-align: middle;
}

 .btn-outline-success1 {
    color: #fff!important;
    background-color: #e5c7da!important;
    width: 100px;
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
      <li class="sidebar-brand">
        <a href="./main">Starting gram</a>
      </li>
      <li><a class="leftitems" href="./mypage">마이페이지</a></li>
			<li><a class="leftitems" href="./profile_update">개인정보 변경</a></li>
			<li><a class="leftitems" href="./password_update">비밀번호 변경</a></li>
			<li><a class="leftitems" href="./like_list">이상형 리스트</a></li>
			<li><a class="leftitems" href="./matching_list">매칭된 리스트</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
		<div id="wrap">
   		<h2>ABOUT ME</h2>
			<div id="contents">
				<img src="/resources/img/logo.jpg" style="width:100px;height:auto;">
				<hr>
				<div class="onethird">
					<h2>1. 신상</h2>
					<p><b>이름:</b> ${client.client_name}<br>
					   <b>생년월일:</b> ${client.client_birth}<br>
					   <b>성별:</b> ${client.client_gender}<br>
					   <b>지역:</b> ${client.client_address}<br>
					   <b>키:</b> ${client.client_tall}<br>
					</p>
		        </div>
				<div class="onethird  last">
					<h2>2. 자기소개</h2>
					<p>${client.client_instruction}</p>
				</div>
				<div class="onethird  last">
					<h2>3. MBTI</h2>
					<p>${client.client_info}</p>
				</div>
			</div>
  		</div>
      </div>
  </div>
  <!-- /본문 -->
</div>
</main>
</body>
</html>