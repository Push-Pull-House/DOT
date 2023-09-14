<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!-- FeedDetail Modal -->
<!-- <div class="modal fade" id="feedDetail" tabindex="-1"
		aria-bs-labelledby="feedDetailLabel" aria-bs-hidden="true"> -->
<div class="modal-dialog modal-xl">
	<div class="modal-content">
		<div class="modal-header modal-backgound">
			<div class="modal-title" id="feedDetail">
				<div class="feed-header modal-feed-header">
					<div class="modal-user-profile">
						<img
							src="${contextPath }${feedWriter.filePath}/${feedWriter.changeName}" />
						<span>${feedWriter.userNick }</span> <span
							class="material-symbols-outlined modal-toggle-button">
							more_horiz </span>
						<div class="modal-more-options">
							<div>
								<dl>
									<dt>
										<span class="material-symbols-outlined"> edit </span> <a>수정하기</a>
									</dt>
									<dt>
										<span class="material-symbols-outlined"> add_box </span> <a>저장하기</a>
									</dt>
									<dt>
										<span class="material-symbols-outlined"> person_add </span> <a>팔로우
											하기 </a>
									</dt>
									<dt>
										<span class="material-symbols-outlined"> person_remove
										</span> <a>팔로우 취소</a>
									</dt>
									<dt>
										<span class="material-symbols-outlined"> report </span> <a>신고하기</a>
									</dt>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button type="button" class="modal-close" data-bs-dismiss="modal"
				aria-label="Close">Ⅹ</button>
		</div>
		<div class="modal-body modal-backgound">
			<div class="modal-feed-body">
				<div class="feed-img">
					<c:forEach var="img" items="${img }">
						<div>
							<img src="${contextPath }/${img.filePath}/${img.changeName}" />
						</div>
					</c:forEach>
				</div>
				<div class="body-bottom">
					<div class="feed-tools">
						<div class="clickable-svg">
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                        <path
									d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                    </svg>
						</div>
						<div class="clickable-svg shareFeed" data-bs-toggle="modal"
							data-bs-target="#shareTool">
							<input type="hidden" name="feedNo" value="${feed.feedNo }"/>
							<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
								fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
                                        <path
									d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                                    </svg>
						</div>
						<div class="clickable-svg">
							<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28"
								fill="currentColor" class="bi bi-plus-square"
								viewBox="0 0 16 16">
                                        <path
									d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                        <path
									d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                    </svg>
						</div>
					</div>
					<div class="feed-text">
						<span> 해당 게시글을 ${feed.likeCount }명이 좋아합니다. </span> <br> <span>
							<b>${feedWriter.userNick }</b> ${feed.feedContent }
						</span> <br> <span> <a>#${feed.feedHashtag }</a>
						</span>
					</div>
				</div>
			</div>
			<div class="modal-feed-footer">
				<div class="reply-wrap">
					<div class="reply-middle">
						<dl>
							<c:if test="${empty reply }">
								<div class="noReply">
									<span>현재 댓글이 존재하지 않습니다.</span>
								</div>
							</c:if>
							<c:if test="${!empty reply }">
								<c:forEach var="reply" items="${reply }">
									<dt class="output output_${reply.replyFno }">
										<img src="${contextPath }${reply.filePath}/${reply.changeName}" />
										<div class="reply-list">
											<span>${reply.userNick }</span> <span>${reply.replyContent }</span>
										</div>
									</dt>
								</c:forEach>
							</c:if>
						</dl>
					</div>
					<div class="reply-bottom">
						<input type="text" class="insertReply" placeholder="댓글을 입력하세요." />
						<button class="reply_input" value="${feed.feedNo}">답글</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- </div> -->

	<!-- Share Modal -->
	<div class="modal fade" id="shareTool" tabindex="-1"
		aria-labelledby="shareToolLabe" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<form>
					<div class="modal-header">
						<h5 class="modal-title" id="shareToolLabe">공유하기</h5>
						<form>
							<input type="search" class="friends-search" id="friends-search"
								placeholder="검색할 팔로워를 입력하세요." />
						</form>
					</div>
					<div class="modal-body">
						<div class="list-btn">
							<span class="followBtn focus-btn">팔로워</span> <span
								class="chatBtn">채팅방</span>
						</div>
						<div class="lists">
							<div class="follower-list">
								<div>
									<dl>
										<c:if test="${empty follow }">
											<dt>
												<span>존재하는 팔로우가 없습니다.</span>
											</dt>
										</c:if>
										<c:forEach var="f" items="${follow }">
											<dt>
												<div>
													<img src="${contextPath}${f.filePath}/${f.changeName}" />
													<span>${f.userNick }</span>
												</div>
												<input type="checkbox" id="addFriend1" name="userNo"
													value="${f.userNo }" />
											</dt>
										</c:forEach>
									</dl>
								</div>
							</div>
							<div class="chatting-list">
								<div>
									<dl>
										<c:if test="${empty chatRoomList }">
											<dt>
												<span>존재하는 채팅방이 없습니다.</span>
											</dt>
										</c:if>
										<c:forEach var="chatRoom" items="${chatRoomList }">
											<dt>
												<div>
													<div class="userCount">
														<c:forEach var="chatImage" items="${chatRoomImage }"
															varStatus="loop">
															<c:if
																test="${chatRoom.chatRoomNo == chatImage.chatRoomNo }">
																<c:if test="${loop.index == 0 }">
																	<img
																		src="${contextPath}${chatImage.filePath }/${chatImage.changeName}">
																</c:if>
																<c:if test="${loop.index == 1 }">
																	<img
																		src="${contextPath}${chatImage.filePath }/${chatImage.changeName}">
																</c:if>
																<c:if test="${loop.index >= 2 }">
																	<img
																		src="${contextPath}${chatImage.filePath }/${chatImage.changeName}">
																</c:if>
															</c:if>
														</c:forEach>
													</div>
													<div class="titleWrap">
														<span class="roomTitle">${chatRoom.title }</span>
													</div>
												</div>
												<input type="checkbox" name="shareRoom"
													value="${chatRoom.chatRoomNo }" class="shareCheck" />
											</dt>
										</c:forEach>
									</dl>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="share-close" data-bs-dismiss="modal">나가기</button>
						<button type="submit" class="share-add">공유하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<script>
	$(function() {
		 (
		    function(){
		       const display = $(".reply-middle>dl")[0];
		       
		       if(display != null){
		          display.scrollTop = display.scrollHeight;
		       }
		    }
		 )();
		
		 $('.reply_input').on('click', function () {
			    sendReply($(this));
		 });

		 $('.insertReply').on('keydown', function (event) {
		     if (event.which === 13) { // 엔터 키(키 코드 13)를 눌렀을 때
		         sendReply($(this));
		     }
	 	});
		
		 function sendReply(button) {
		    const parentContainer = button.closest('.reply-bottom');
		    const inputElement = parentContainer.find('input');
		    const replyContent = inputElement.val();
		    const feedNo = parentContainer.find(".reply_input").val(); 
		    
		    $.ajax({
		        url: '${contextPath}/mainFeed/insertReply',
		        data: {
		            replyContent: replyContent,
		            replyFno: feedNo
		        },
		        method: 'post',
		        success: function (result) {
		        	if(result > 0) {
		        		selectReplyList(feedNo);
		        	}  else {
		        		alert("답글 달기 실패");
		        	}
		        },
		        complete: function (result) {
		            inputElement.val('');
		        }
		    });
		};
		
		const selectReplyList = (feedNo) => {
			$.ajax({
				url : '${contextPath}/mainFeed/selectReplyList',
				data: {bno : feedNo },
				method : 'get',
				success : function(replyList){
					let html = "";
					let lastReply = replyList.pop();
					html = 
						"<dt class='output'>" +
						"<img src='" + '${contextPath}' + lastReply.filePath + '/' + lastReply.changeName + "' />" +
		                "<div class='reply-list'>" +
						"<span>" + lastReply.userNick +"</span><span>"+ lastReply.replyContent + "</span>"+
						"</div>" +
						"</dt>";
						
					$(".output_"+feedNo).parent().prepend(html);
				}
			})
		};
		
		$("#friends-search").on("keyup", () => {
		
		    let follow = $("#friends-search").val();
		
		    $.ajax({
		        url: "/dot/chat/searchFollowList",
		        data: { follow : follow },
		        method: "post",
		        success: (data) => {
		            
		            console.log(data);
		            
		            $(".output-list").empty();
		            $(".output-list").html(data);
		            
		        },
		        error: console.log
		    });
		});
	})
	$(function() {
    	
	    const socket = new SockJS('http://localhost:8083/dot/ws');
		const stompClient = Stomp.over(socket);
		
		stompClient.connect({}, frame => {
		    console.log('Connected: ' + frame);
		   	
		    let shareUserList = [];
		    let shareRoomList = [];
		    let feedNo;
		    
		    $(".shareFeed").on('click', () => {
		    	
		    	console.log("hi");
		    	
		    	feedNo = $(this).find("input[name='feedNo']").val();
		    	
		    	console.log(feedNo);
		    })
		    
		    $(".share-add").on('click', () => {
		    	
		    	
		    	$("input[name='userNo']:checked").each(function() {
		    	    shareUserList.push($(this).val());
		    	});
		
		    	$("input[name='shareRoom']:checked").each(function() {
		    	    shareRoomList.push($(this).val());
		    	});
	
		    	console.log("shareUserList: " + JSON.stringify(shareUserList));
		    	console.log("shareRoomList: " + JSON.stringify(shareRoomList));
	
		    	const shareList = {
		    			"feedNo" : feedNo,
		    			"userNo" : ${loginUser.userNo},
		    			"shareUserList" : shareUserList,
		    			"shareRoomList" : shareRoomList
		    			};
			    console.log(shareList);
		    	
			    stompClient.send('/chat/shareFeed/', {}, JSON.stringify(shareList));
			    stompClient.disconnect();
			    
			    $(".share-close").click();
			    $("input[name='userNo']:checked").prop("checked", false);
			    $("input[name='shareRoom']:checked").prop("checked", false);
			    shareUserList = [];
			    shareRoomList = [];
		    });
		    
		    
		});
    })
	var followBtn = $('.followBtn');
    var chatBtn = $('.chatBtn');

    var followerList = $('.follower-list');
    var chattingList = $('.chatting-list');

    chattingList.css("display","none");

    followBtn.click(() => {
        followBtn.addClass('focus-btn');
        chatBtn.removeClass('focus-btn');

        followerList.css('display','block');
        chattingList.css("display","none");
    });

    chatBtn.click(() => {
        followBtn.removeClass('focus-btn');
        chatBtn.addClass('focus-btn');

        followerList.css('display','none');
        chattingList.css("display","block");
    });
</script>

<!-- <script src="../resources/js/Dot_ChatSlick.js"></script> -->




