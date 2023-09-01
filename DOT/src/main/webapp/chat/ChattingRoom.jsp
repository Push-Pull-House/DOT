<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class="room-wrap">
	<div class="room-header">
		<div class="header-wrap">
			<img src="resources/img/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
			<span class="user-id"> 
				<a>${map.joinRoom[0].title}</a>
				<input type="hidden" name="chatRoomNo" value="${map.joinRoom[0].chatRoomNo }" />
			</span> 
			<span class="status">접속중</span> 
			<label></label>
		</div>
	</div>
	<div class="room-body">
		<ul class="display-chatting">
			<c:if test="${empty map.msgList }">
				<span>채팅 내역이 없습니다.</span>
			</c:if>
			<c:forEach var="msg" items="${map.msgList }">
				<c:if test="${msg.userNo == loginUser.userNo }">
					<li class="myChat">
						<span class="chatDate">${msg.enrollDate }</span>
						<p class="chat">${msg.message }</p>
					</li>
				</c:if>
				<c:if test="${msg.userNo ne loginUser.userNo }">
					<li class="otherChat">
						<div>
							<img class="img" src="resources/img/karina1.jpeg" /> <b>${msg.userNick }</b>
						</div>
						<div>
							<p class="chat">${msg.message }</p>
							<span class="chatDate">${msg.enrollDate }</span>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ul>
	</div>
	<div class="room-footer">
		<div class="chat-input">
			<textarea id="inputChatting" placeholder="전송하실 메세지를 입력하세요."></textarea>
		</div>
		<div class="chat-tool">
			<input type="file" class="upload-file" /> <span
				class="material-symbols-outlined add_box"> attach_file </span>
			<button id="chatSend">전송</button>
		</div>
	</div>
</div>

<script>
	userNo = "${loginUser.userNo}";
	userNick = "${loginUser.userNick}";
	chatRoomNo = "${map.joinRoom[0].chatRoomNo}";
</script>


<script src="../resources/js/Dot_SendChat.js"></script>





