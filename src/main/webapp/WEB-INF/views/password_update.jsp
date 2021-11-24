<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
/* 본문 스타일 */
table {
  border-collapse: collapse;
  width: 150%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #DDD;
}

tr:hover {background-color: pink;}
th{
	color: gray;
}
.topnav a {
  float: left;
  display: block;
  color: #b77ead;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
h2{
  font-family: "Lucida Console", "Courier New", monospace;
  color: pink;
  }
  
  
.button {
    background-color: #f3eaed;
    border: none;
    color: #b77ead;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: -3px;
    cursor: pointer;
}

.password_update_p {
	#008CBA;
}

.article_right_item span {
    color: gray;
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
      <li><a class="leftitems" href="./userProfile">마이페이지</a></li>
			<li><a class="leftitems" href="./profile_update">개인정보 변경</a></li>
      <li><a class="leftitems" href="./password_update">비밀번호 변경</a></li>
			<li><a class="leftitems" href="./like_list">이상형 리스트</a></li>
			<li><a class="leftitems" href="./matching_list">매칭된 리스트</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
<div id="page-content-wrapper">
  <h2>비밀번호 변경</h2>
    <div class="container-fluid">
				<form action="password_update" class="article_right" method="post">
				<div class="article_right_item">
					<span>이전 비밀번호</span>
					<input class="w3-input" id="old_pw" name="old_password" type="password" required>
				</div>
				<div class="article_right_item">
					<span>새 비밀번호</span>
					<input class="w3-input" id="new_pw" name="new_password" type="password" required>
				</div>
				<div class="article_right_item">
					<span>새 비밀번호 확인</span>
					<input class="w3-input" id="new_pw" name="new_password2" type="password" required>
				</div>
				<p class="w3-center">
					<button type="submit" class="button password_update_p">비밀번호 변경</button>
				</p>
								
			</form>
    </div>
  </div>
  <!-- /본문 -->
</div>
</main>
</body>
</html>