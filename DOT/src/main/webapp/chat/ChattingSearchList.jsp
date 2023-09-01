<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />


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

<script>
$(".joinChatRoom").on("click", (e) => { // 클래스 선택자 사용
    const focus = $(e.currentTarget);
    const chatRoomNo = focus.find("[name=chatRoom]").val();

    console.log(chatRoomNo);

    $.ajax({
        url: "/dot/chat/joinChatRoom",
        data: { chatRoomNo: chatRoomNo },
        method: "post",
        success: (data) => {
        	
        	$(".chat-room-wrap").empty();
            $(".chat-room-wrap").html(data);
        },
        error: (error) => {
            console.error(error);
        }
    });
});
</script>
