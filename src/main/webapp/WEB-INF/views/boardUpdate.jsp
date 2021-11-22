<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>인스타</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="fragments/header.jsp"></jsp:include>
	<main>
		<div class="modal">
			<div class="modal_body">
				<div class="modal_body2">
					<div class=" modal_body3"></div>
				</div>
			</div>
			<div class="modal_main">
				<div class="modal_main2">
					<article class="modal_main3">
						<div class="modal_main4">
							<div class="modal_left1" style="height: 630px; overflow: auto;">
								<div class="single-item">
									<div class="">
										<ul class="image_list single-item">
										<li file="${list.whiteboard_img1 }"><img class="item_img"
											src="/img/${list.whiteboard_img1 }"> <a href="#"
											class="cvf_delete_image" title="Cancel"> <img
												class="delete-btn" src="img/delete.png"></a></li>
										<li file="${list.whiteboard_img2 }"><img class="item_img"
											src="/img/${list.whiteboard_img2 }"> <a href="#"
											class="cvf_delete_image" title="Cancel"> <img
												class="delete-btn" src="img/delete.png"></a></li>
										<li file="${list.whiteboard_img3 }"><img class="item_img"
											src="/img/${list.whiteboard_img3 }"> <a href="#"
											class="cvf_delete_image" title="Cancel"> <img
												class="delete-btn" src="img/delete.png"></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="modal_right1">
								<header>
									<div class="profile-of-article">
										<img class="img-profile1 pic" src="/resources/img/logo.jpg"> <input
											type="hidden" value="whiteboard_client_id">
										<h3 class="userID main-id point-span" style="margin-top: 8px;">${list.whiteboard_client_id}</h3>
										<h4 class="userID main-id point-span" style="margin-top: 8px;">${client.client_name}</h4>
									</div>
									<img class="icon-react icon-more"
										src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png"
										alt="more">
								</header>
								<div>
									<div class="EtaWk">
										<ul class="pXf-y ">
											<div role="button" class="ZyFrc" tabindex="0">
												<li class="gElp9 rUo9f  PpGvg " role="menuitem"><div
														class="P9YgZ">
														<div class="C7I1f X7jCj">
															<div class="Jv7Aj mArmR   pZp3x">
																<div class="RR-M-  TKzGu  " role="button" tabindex="-1">
																	<canvas class="CfWVH" height="53" width="53"
																		style="position: absolute; top: -5px; left: -5px; width: 42px; height: 42px;"></canvas>
																</div>
															</div>
															<form action="save" method="post"
																enctype="multipart/form-data">
																<div class="regist_box">
																	<div class="">
																		<dl class="regist_image_dl" id="images_box">
																			<dt>
																				<span
																					style="color: rgb(0, 0, 0); font-weight: 600; margin-left: 15px;">사진올리기</span>
																				<span
																					style="color: rgb(0, 0, 0); font-weight: 600; margin-left: 15px;">(최소
																					1개 등록)</span>
																			</dt>
																			<dd>
																				<div class="container-fluid">
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="input_img1"> 
																								<img style="width: 100px; height: 100px; display: flex;"
																								src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png">
																							</label>
																							 	<input type="file" name="whiteboard_img1" id="input_img1" class=" user_picked_files"
																								accept="image/*" required />
																							<label for="input_img2"> 
																								<img
																								style="width: 100px; height: 100px; display: flex;"
																								src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png">
																							</label> 
																								<input type="file" name="whiteboard_img2"
																								id="input_img2" class=" user_picked_files"
																								accept="image/*" />
																							<label for="input_img3">
																								<img
																								style="width: 100px; height: 100px; display: flex;"
																								src="https://ccimage.hellomarket.com/web/2018/auto/img_car_pic_basic.png">
																							</label>
																								<input type="file" name="whiteboard_img3"
																								id="input_img3" class=" user_picked_files"
																								accept="image/*" />
																						</div>
																						<ul class="cvf_uploaded_files"></ul>
																					</div>
																				</div>

																			</dd>
																		</dl>
																		<dl id="content">
																			<dt style="margin-bottom: 10px;">
																				<span
																					style="color: rgb(0, 0, 0); font-weight: 600; margin-left: 15px;">설명</span>
																			</dt>
																			<dd>
																				<textarea rows="5" class="introduce"
																					style="margin: 0px; width: 440px; height: 241px;"
																					name="whiteboard__content" placeholder="내용을 입력해주세요">${list.whiteboard_content }</textarea>
																			</dd>
																		</dl>
																	</div>
																</div>
																<div class="item_submit_box">
																	<div class="item_area_submit_box">
																		<a href="userProfile">
																			<button class="btn_item_cancel" type="button">취소</button>
																		</a> <input class="btn_item_submit" type="submit"
																			value="게시물 등록">
																	</div>
																</div>
															</form>

														</div>
													</div></li>
											</div>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</article>
				</div>
			</div>
			<div></div>
		</div>

	</main>
	<script type="text/javascript" src="/js/imgUpload.js"></script>
</body>
</html>