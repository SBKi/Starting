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
  <h2>매칭된 리스트</h2>
    <div class="container-fluid">
      <div class="article_right" style="width:100%;text-align:center;">
		<div class="topnav">
					
					  
					  
					  <!-- 반복문시작 -->
	<table style="width:100%;height:60%;text-align:center;margin:auto;">
			<colgroup>
				<col style="width:auto;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
				<col style="width:15%;" />
			</colgroup>
			<thead>
				<tr>
					<th>사진</th>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>정보</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty boardList }" >
						<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
					</c:when> 
					<c:when test="${!empty boardList}">
						<c:forEach items="${list }" var="item" varStatus="index">
	                		<tr onclick="location.href='#=${user.client_no}'">
			                	<td><p class="client_list_p">${user.client_img}</p></td>
			                	<td><p class="client_list_p">${user.client_name}</p></td>
			                	<td><p class="client_list_p">${user.client_age}</p></td>
			                	<td><p class="client_list_p">${user.client_gender}</p></td>
			                	<td><p class="client_list_p">${user.client_info}</p></td>
							</tr>	                	
	                	</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
		</table>
	<div class="btn">
	<span class="box_btn large w150 white"><a href="{{$위시리스트비우기}}">전체인원삭제</a></span>
	<span class="box_btn large w150 white"><a href="{{$체크삭제}}">선택인원삭제</a></span>
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