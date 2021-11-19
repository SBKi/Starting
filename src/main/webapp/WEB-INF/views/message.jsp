<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Starting</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/message.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="fragments/header.jsp"></jsp:include>
	<main>
		<div class="main_area">
			<div class="left_main">
				<div class="left_main_header">
				</div>
				<ul>
					<!-- room 반복 -->
					<div class="S-mcP">
						<div class="AjEzM ">
							<div class="_2NzhO xkdid">
								<img src="${pageContext.request.contextPath}/resources/img/logo.jpg"
						onclick="location.href='/starting/userProfile'"
						style="cursor: pointer;border-radius: 30px;width: 35px;
    height: 35px;">
							</div>
							<div class="m7ETg">
								<div class="             qF0y9          Igw0E     IwRSH      eGOV_         _4EzTm                                                                                                              "
									style="width: 100%;">
									<button class="sqdOP yWX7d    y3zKF     " 
										type="button">
										<div
											class="             qF0y9          Igw0E   rBNOH          YBx95   ybXk5    _4EzTm                                                                                                              "
											style="width: 100%;">
											<div class="lf6L3">
												<div onclick="location.href='/starting/userProfile'" style="cursor: pointer;"
													class="_7UhW9    vy6Bb      qyrsm KV-D4              fDxYl    T0kll ">coug_96</div>
											</div> 
											<div 
												class="             qF0y9          Igw0E     IwRSH      eGOV_         _4EzTm                                                                                 lC6p0            HVWg4                 ">
												<span
													style="display: inline-block; transform: rotate(180deg);"><svg 
														aria-label="아래쪽 V자형 아이콘" class="_8-yf5 " color="#262626"
														fill="#262626" height="45" role="img" viewBox="0 0 24 24"
														width="45">
														<path 
															d="M21 17.502a.997.997 0 01-.707-.293L12 8.913l-8.293 8.296a1 1 0 11-1.414-1.414l9-9.004a1.03 1.03 0 011.414 0l9 9.004A1 1 0 0121 17.502z"></path></svg></span>
											</div>
										</div>
									</button>
								</div>
							</div>
							<div class="_2NzhO EQ1Mr">
								<button class="wpO6b ZQScA " type="button" style="cursor: pointer; " >
									<div class="QBdPU ">
										<svg aria-label="새로운 메시지" class="_8-yf5 " color="#262626"
											fill="#262626" height="24" role="img" viewBox="0 0 24 24"
											width="24">
											<path
												d="M12.202 3.203H5.25a3 3 0 00-3 3V18.75a3 3 0 003 3h12.547a3 3 0 003-3v-6.952"
												fill="none" stroke="currentColor" stroke-linecap="round"
												stroke-linejoin="round" stroke-width="2"></path>
											<path
												d="M10.002 17.226H6.774v-3.228L18.607 2.165a1.417 1.417 0 012.004 0l1.224 1.225a1.417 1.417 0 010 2.004z"
												fill="none" stroke="currentColor" stroke-linecap="round"
												stroke-linejoin="round" stroke-width="2"></path>
											<line fill="none" stroke="currentColor"
												stroke-linecap="round" stroke-linejoin="round"
												stroke-width="2" x1="16.848" x2="20.076" y1="3.924"
												y2="7.153"></line></svg>
									</div>
								</button>
							</div>
						</div>
					</div>
					<div class="card_box active"
						onclick="getMailList('12jang123','rmawhd123','12')">
						<li>
							<div class="profile">
								<img src="${pageContext.request.contextPath}/resources/img/person.png">
							</div>
							<div class="info">
								<div class="nick">홍길동</div>
								<div class="description size_limite">문자내용~~</div>
								<span class="description size_limite">시간~~~</span>
							</div>
						</li>
					</div>


				</ul>
			</div>
			<div class="right_main">
				<div id="message"></div>
				<div id="footer_input" class="chat_footer"></div>
			</div>
		</div>
	</main>
</body>
</html>