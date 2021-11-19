<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/find.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
				<div class="header_title">회원가입</div>
				<div class="login_line"></div>
				<form action="register" method="post" name="signfrm" id="frm">
					<div class="input_section">
						<!-- 아이디 -->	
						<input class="input" type="text" id="id" name="client_id" placeholder="아이디" maxlength="20" required="required"/>
						<span class="error_next_box"></span>
						<!-- 비밀번호 -->	
						<input class="input" type="password" id="pswd1" name="client_password" placeholder="비밀번호(8자 이상)" maxlength="20" required="required">
						<span class="error_next_box"></span>
						<!-- 비밀번호 확인-->	
						<input class="input" type="password" id="pswd2" name="client_password2" placeholder="비밀번호 재확인" required="required">
						<span class="error_next_box"></span>
						<!-- 이름 -->	
						<input class="input" type="text" id="name" name="client_name" placeholder="이름" maxlength="5" required="required"> 
						<span class="error_next_box"></span>
						<!-- 이메일 -->	
						<input class="input" type="email" id="email" name="client_email" placeholder="본인확인 이메일" required="required"> 
						<span class="error_next_box"></span>
						<!-- 주소 -->
						<div>
						<input class="input1" type="button" value="주소 검색" onclick="findAddr()"><br>
						<input class="input" type="text" name="client_address" id="userAddress" placeholder="주소를 입력" required="required"/> <br>
						<span class="error_next_box"></span>
						</div>
						<!-- 생년월일 -->
						<input class="input1" type="date" id="birth" name="client_birth" min="1985-01-01" max="2001-12-31">
						<span class="error_next_box"></span>
						<!-- 성별 -->
						<label><input class="radio" type="radio" id="male" name="client_gender"  value="M" checked="checked">남</label>
						<label><input class="radio" type="radio" id="female" name="client_gender"  value="F">여</label>
						<span class="error_next_box"></span>
						<!-- 키 -->	
						<input class="input1" type="number" id="tall" name="client_tall" placeholder="키 입력" maxlength="3" required="required" > 
						<span class="error_next_box"></span>
						<!-- 자기소개 -->
						<textarea rows="5" cols="200" class="instruction" id="instruction" name="client_instruction" placeholder="자기소개" required="required"></textarea>
						<span class="error_next_box"></span>
						<!-- info MBTI -->
						<a class="input" target="blank" href="https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC">성격유형 검사하기</a>
						<br><br>
						<div class="info_select_box">
							<select name="Client_info" id="info">
								<option value="INTJ" selected="selected">INTJ</option>
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
								
						<!-- 회원등록 -->
						<input class="submit_button" type="button" id="submit-btn" value="회원가입하기">
					</div>
				</form>
				<div class="button_section">
					<a class="" href="find_id">아이디 찾기</a>
					<span class="hor_line">|</span>
					<a class="" href="find_password">비밀번호 찾기</a>
				</div>
				<div>
					<p>이미 회원이신가요? <a href="login">로그인하기</a> </p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="/resources/js/main.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			document.getElementById('submit-btn').onclick = function() {
				var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식
				
				
				if (document.getElementById('pswd1').value != document.getElementById('pswd2').value) {
					alert('비밀번호를 올바르게 입력하세요.');
				} else if (document.getElementById('pswd1').value == "") {
					alert('비밀번호를 올바르게 입력하세요.');
				} else if((document.getElementById('pswd1').value.length<8)){
					alert('비밀번호 길이는 8자 이상입니다.');	
				} else if (document.getElementById('id').value == "") {
					alert('아이디를 확인해주세요!');
				} else if (document.getElementById('name').value == "") {
					alert('이름을 확인해주세요!');
				} else if (document.getElementById('email').value == "") {
					alert('이메일을 확인해주세요!');
				} else if (document.getElementById('userAddress').value == "") {
					alert('주소를 확인해주세요!');
				} else if (document.getElementById('birth').value == "") {
					alert('생년월일을 확인해주세요!');
				} else if (document.getElementById('male').value == "") {
					if(document.getElementById('female').value == "") {
					alert('성별을 확인해주세요!');
					}
				} else if (document.getElementById('tall').value == "") {
					alert('키를 확인해주세요!');
				} else if (document.getElementById('instruction').value == "") {
					alert('자기소개를 확인해주세요!');
				} else if (document.getElementById('info').value == "") {
					alert('성격유형을 확인해주세요!');
				} else if(!emailRule.test($("input[id='email']").val())) {            
					alert('이메일을 확인해주세요!(정규식)');
				} else if (document.getElementById('userAddress').value == "") {
					alert('주소를 확인해주세요!');
				} else {
					document.getElementById('frm').submit();
					return false
				}
			}
		};
		function findAddr() {
			daum.postcode.load(function() {
				new daum.Postcode({
					oncomplete : function(data) {
						// 각 주소의 규칙에 따라 주소 조합
						// 가져올 변수가 없을때는 공백을 가지기 때문에 이를 참고해 분기한다고 한다
						var addr = ''; //주소 변수
						// 사용자가 선택한 주소타입(도로명/지번)에 따라 해당 값 가져오기
						// 만약 사용자가 도로명 주소를 선택했을 때
						if (data.userSelectedType == 'R') {
							addr += data.sido+" ";
							addr += data.sigungu+" ";
							addr += data.bname;
							// 만약 사용자가 구주소를 선택했을 때
						} else {
							addr += data.sido+" ";
							addr += data.sigungu+" ";
							addr += data.bname;
						}
						// 주소정보
						document.getElementById('userAddress').value = addr;
					}
				}).open();
			});
		}
	</script>
</body>
</html>