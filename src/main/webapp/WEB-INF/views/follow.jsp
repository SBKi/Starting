<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Starting</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/follow.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body style="background-color: #fafafa;">
	<jsp:include page="fragments/header.jsp"></jsp:include>
	<main>
		<div class="follow_body">
			<div class="follow_title">
				<h4 class="title">추천</h4>
			</div>
			<div class="follows_body">
				<div class="follow_list">
					<div class="follow_lists">
						<div class="follow_list_user">
							<div class="follow_list_img">
								<div class="img_box">
									<div>
										<a>
											<img style="width: 60px;" alt="" src="${pageContext.request.contextPath}/resources/img/person.png">
										</a>
									</div>
								</div>
							</div>
							<div class="follow_list_name">
								<div class="user_id">
									<div>
										<span>
											<a>client_id</a>
										</span>
									</div>
								</div>
								<div class="user_name">
									<div>
										<span>client_name</span>
									</div>
								</div>
								<div class="user_info">
									<div >
										<div>
											<span>client_info</span>
										</div>
									</div>
								</div>
							</div>
							<div class="follow_list_button">
								<button class="follow_list_button">팔로우</button>
							</div>
						</div>
					</div>
					<div class="follow_lists">
						<div class="follow_list_user">
							<div class="follow_list_img">
								<div class="img_box">
									<div>
										<a>
											<img style="width: 60px;" alt="" src="${pageContext.request.contextPath}/resources/img/person.png">
										</a>
									</div>
								</div>
							</div>
							<div class="follow_list_name">
								<div class="user_id">
									<div>
										<span>
											<a>client_id</a>
										</span>
									</div>
								</div>
								<div class="user_name">
									<div>
										<span>client_name</span>
									</div>
								</div>
								<div class="user_info">
									<div >
										<div>
											<span>client_info</span>
										</div>
									</div>
								</div>
							</div>
							<div class="follow_list_button">
								<button type="button" class="follow_list_button">팔로우</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>


</body>


</html>