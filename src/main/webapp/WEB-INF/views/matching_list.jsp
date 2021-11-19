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
<style>
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
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}
h2{
  font-family: "Lucida Console", "Courier New", monospace;
  color: pink;
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
  <h2>매칭된 리스트</h2>
    <div class="container-fluid">
      <div class="article_right" style="width:100%;text-align:center;">
					<div class="topnav">
					
					  
					  
					  <!-- 반복문시작 -->
<table style="width:100%;height:60%;text-align:center;margin:auto;">
	<thead>
		<tr>
			<th scope="col">상대방 사진</th>
			<th scope="col">상대방 이름</th>
			<th scope="col">상대방 정보</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list }" var="item" varStatus="index">

			

<!-- 반복구문시작 -->
		<tr>
			<td class="img"><a href="#">{{$이미지}}</a></td>
			<td class="tal"><a href="#">{{$이름}}</a></td>
			<td><strong><a href="#">{{$나이}}{{$키}}{{$주소}}{{$mbti}}</a></strong></td>
		</tr>
			<tr>
			    <td><img src="/resources/img/logo.jpg" style="width:50px;height:auto;"></td>
			    <td><a href="#">모모</a></td>
			    <td><a href="#">나이,키,mbti 유형</a></td>
			  </tr>
<!-- 반복구문끝 -->
	</tbody>
</table>
<div class="btn">
	<span class="box_btn large w150 white"><a href="{{$위시리스트비우기}}">전체인원삭제</a></span>
	<span class="box_btn large w150 white"><a href="{{$체크삭제}}">선택인원삭제</a></span>
</div>
 </c:forEach>
<!-- 반복문끝 -->
					</table>
					</div>
				</div>
			
    </div>
  </div>
  <!-- /본문 -->
</div>
</main>
</body>
</html>