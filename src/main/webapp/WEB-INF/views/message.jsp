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
					<!-- room 반복 -->
					<div class="S-mcP">
						<div class="AjEzM ">
							<div class="">
								<img
									src="${pageContext.request.contextPath}/resources/img/logo.jpg"
									onclick="location.href='/starting/userProfile'"
									style="cursor: pointer; border-radius: 30px; width: 35px; height: 35px;">
							</div>
							<div class="m7ETg">
								<div class="" style="width: 100%;">
									<button class="" type="button">
										<div class="" style="width: 100%;">
											<div class="lf6L3">
												<div onclick="location.href='/starting/userProfile?${1}'"
													style="cursor: pointer;"
													class="">{client_id }</div>
											</div>
											<div class="">
											</div>
										</div>
									</button>
								</div>
							</div>
							<div class="">
								<button type="button"
									style="cursor: pointer;">
									<div>
										<svg aria-label="새로운 메시지"color="#262626"
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
					</div>
					<ul>
					<div>
						<li>
							<div class="profile">
								<img
									src="${pageContext.request.contextPath}/resources/img/person.png">
							</div>
							<div class="info">
								<c:forEach var="room" items="${list}">
									<div class="nick">
										<a href="/chat/room?id=${client.client_id }">${room.roomid}</a>
										<div class="lf6L3">
												<div onclick="location.href='/starting/userProfile?${1}'"
													style="cursor: pointer;"
													class="">{client_id }</div>
											</div>
									<form action="room" method="post">
										<input type="hidden" name="id" class="form-control" value="${client.client_id }">
										<button class="btn btn-secondary btn-create">방</button>
									</form>
									</div>
								</c:forEach>
							</div>
						</li>
					</div>
				</ul>
			</div>
			<div class="right_main">
				<div id="message">
					<div class="chat_header">
						<div class="image_box">
							<div class="image_table">
								<img onclick="location.href='client_id?${1}'"
									src="${pageContext.request.contextPath}/resources/img/person.png">
							</div>
						</div>
						<div class="profile-of-article">
										<input type="hidden" value="whiteboard_client_id">
										<h3 class="userID main-id point-span" style="margin-top: 8px;">${client.client_id}</h3>
										<h4 class="userID main-id point-span" style="margin-top: 8px;">${client.client_name}</h4>
									</div>
					</div>
					<div class="chat_description" id="chatContent">
						<c:forEach items="${roomlist }" var="chat">
							<div class="col-6">
								<c:if test="${chat.writer eq client.client_id }">
									<div class="alert alert-secondary">
								</c:if>
								<c:if test="${chat.writer ne client.client_id }">
									<div class="alert alert-warning">
								</c:if>
								<b>${chat.writer } : ${chat.message}</b>
							</div>
					</div>
					</c:forEach>
				</div>
			</div>
			<div id="footer_input" class="chat_footer">
				<div class="input-group mb-3">
					<input type="text" id="msg" class="form-control"
						style="width: 580px">
					<div class="input-group-append">
						<input type="hidden" id="roomid"
							value="${roomlist.get(0).getRoomid() }"> <input
							type="hidden" id="id" value="${client.client_id }">
						<button class="btn btn-outline-secondary" type="button"
							id="button-send">전송</button>
					</div>
				</div>

			</div>
		</div>
		</div>
	</main>
</body>
</html>