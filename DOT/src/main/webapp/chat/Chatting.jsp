<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link rel="stylesheet" href="../resources/css/Dot_Chatting.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<title>Dot.</title>
</head>

<body>
	<div class="wrap">
		<jsp:include page="../common/Header.jsp" />
		<div class="contents">
			<jsp:include page="../common/Sidebar.jsp" />
			<div class="chat-list-wrap">
				<div class="chat-wrap">
					<div class="chat-header">
						<span>Message</span> <input type="checkbox" id="chat-search" />
						<form>
							<label for="chat-search"> <input id="input-search-chat"
								name="keyword" type="search" placeholder="검색할 항목을 입력해주세요." /> <label
								for="input-search-chat"></label>
							</label>
						</form>
						<span class="material-symbols-outlined search_list"> search
						</span> <span class="material-symbols-outlined add_box toggle-button">
							add </span>
						<div class="more-options">
							<div>
								<dl>
									<dt id="addBtn" data-bs-toggle="modal"
										data-bs-target="#createChatRoom">
										<span class="material-symbols-outlined"> chat_add_on </span> <span>채팅방
											생성</span>
									</dt>
									<dt id="deleteBtn">
										<span class="material-symbols-outlined"> logout </span> <span>채팅방
											나가기</span>
									</dt>
								</dl>
							</div>
						</div>
					</div>
					<form>
						<div class="chat-list">
							<c:choose>
								<c:when test="${empty chatRoomList }">
									<dl>
										<dt>
											<div class="list-info-wrap">
												<div class="list-info">
													<span>조회된 채팅방이 없습니다.</span>
												</div>
											</div>
										</dt>
									</dl>
								</c:when>
								<c:otherwise>
									<dl>
										<c:forEach var="chatRoom" items="${chatRoomList }">
											<dt class="joinChatRoom">
												<input type="hidden" name="chatRoom"
													value="${chatRoom.chatRoomNo }">
												<div class="list-info-wrap">
													<div class="list-info">
														<img
															src="../resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg">
														<div class="list-text">
															<div class="list-top">
																<span>${chatRoom.title }</span> <span>8월 17일</span>
															</div>
															<div class="list-bot">
																<span>밥은 먹엇냐</span>
															</div>
														</div>
													</div>
												</div>
											</dt>
										</c:forEach>
									</dl>
								</c:otherwise>
							</c:choose>
						</div>
					</form>
				</div>
			</div>
			<div class="chat-room-wrap">
				<div class="room-wrap"></div>
			</div>
			<div class="sub-content"></div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="createChatRoom" tabindex="-1"
		aria-labelledby="createChatRoomLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content create-room-content">
				<div class="modal-header create-room-header">
					<h5 class="modal-title" id="createChatRoomLabel">채팅방 생성하기</h5>
					<form>
						<input type="text" class="friends-search" id="friends-search"
							placeholder="검색할 팔로워를 입력하세요." />
					</form>
				</div>
				<form id="openChatRoomForm"
					action="${contextPath }/chat/openChatRoom" method="post">
					<div class="modal-body create-room-body">
						<span>팔로워</span>
						<div class="follower-list">
							<div>
								<dl class="output-list">
									<%-- <c:forEach var="" items=""> --%>
										<dt>
											<div>
												<img src="resources/img/karina2.jpeg" /> <label
													for="addFriend1">karina_1211</label>
											</div>
											<input type="checkbox" id="addFriend1" name="userId" value="2" />
										</dt>
									<%-- </c:forEach> --%>
								</dl>
							</div>
						</div>
					</div>
					<div class="modal-footer create-room-body">
						<button type="button" class="create-close" data-bs-dismiss="modal">나가기</button>
						<button type="submit" class="create-add">생성하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
	let userNo;
	let userNick;
	let chatRoomNo;
	</script>



<script src="../resources/js/Dot_Chatting.js"></script>

</body>

</html>