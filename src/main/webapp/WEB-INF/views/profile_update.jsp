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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
	})
</script>

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
    color: #b77ead!important;
    background-color: #f3eaed!important;
}

.w3-content,.w3-auto{
   margin-left:5px;
   margin-right:5px;
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
  <h2>개인정보</h2>
    <div class="container-fluid">
	<div class="container">
    
    
    <div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>Profile</h3>
			</div>
			<div>
				<form id="myForm" action="profile_update" method="post">
				
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="id" name="client_id" readonly value="${ user.client_id }"> 
					</p>
					<p>
						<input class="w3-input" type="hidden" id="pw" name="client_password" value="${ user.client_password }">
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="email" name="client_email" readonly value="${ user.client_email }"> 
					</p>
					<p>
						<label>이름</label> 
						<input class="w3-input" type="text" id="name" name="client_name" readonly value="${ user.client_name}" required> 
					</p>
					<p>
						<label>성별</label> 
						<input class="w3-input" type="text" id="gender" name="client_gender" readonly value="${ user.client_gender } "> 
					</p>
					<p>
						<label>생년월일</label> 
						<input class="w3-input" type="text" id="birth" name="client_birth" readonly value="${ user.client_birth }"> 
					</p>
					<p>
						<label>주소</label> 
						<input class="w3-input" type="text" id="address" name="client_address" value="${ user.client_address }"> 
					</p>
					<p>
						<label>신장</label> 
						<input class="w3-input" type="text" id="tall" name="client_tall" value="${ user.client_tall }"> 
					</p>
					<p>
						<label>자기소개</label> 
						<input class="w3-input" type="text" id="instruction" name="client_instruction" value="${ user.client_instruction }"> 
					</p>
					<p>
						<label>MBTI</label> 
					</p>
					<div class="info_select_box">
							<select name="Client_info" id="info">
								<option  value="${user.client_info }" >${user.client_info }</option>
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

					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">회원정보 변경</button>
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