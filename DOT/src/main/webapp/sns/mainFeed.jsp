<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/MainFeed2.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick.css" />
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script type="text/javascript" src="${contextPath}/resources/js/MainFeed2.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    
    <!--  웹소켓 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/Header.jsp" />
		<div class="contents">
			<jsp:include page="../common/Sidebar.jsp" />
			<div class="main-content">
				<div class="main-wrap">
				<input type="hidden" value="${loginUser.userNo }" id="myUserNo"/>
					<div class="feed-list">
						<dl>
						<c:forEach var="i" items="${fd}">
							<c:forEach var="u" items="${mem}">
								<c:if test="${i.feedWriter == u.userNo}">
									<dt>
										<div class="feed-wrap">
											<div class="feed-header">
												<div class="user-profile">
													<div class="profile-content">
														<img src="${contextPath}/${u.filePath}/${u.changeName}" />
														<span>${u.userNick}</span>
													</div>
													<c:if test="${i.feedWriter ne m.userNo}">
													<span class="material-symbols-outlined toggle-button"
								                          id="more-options-icon"> more_horiz </span>
								                     </c:if>
													<div class="more-options">
														<div>
															<dl>
																<dt>
																<c:choose>
																	<c:when test="${i.feedWriter eq m.userNo}">
																        <c:set var="div4"></c:set>
																	</c:when>
																	<c:otherwise>
																		<c:set var="div4">
																			<div class="choice-control-js">
																				<div class="initial-choice">
																					<svg xmlns="http://www.w3.org/2000/svg" width="20"
																						height="20" fill="currentColor"
																						class="bi bi-plus-square" viewBox="0 0 16 16">
	                                                       							<path
																						d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
	                                                       							<path
																						d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
	                                                   								</svg>
																					<a>저장하기</a>
																				</div>
																				<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedNo}" />
																			</div>
																		</c:set>
																		<c:forEach var="c" items="${ci}">
																			<c:if test="${i.feedNo == c.choiceFno}">
																			<c:set var="div4">
																				<div class="choice-control-js">
																					<div class="clicked-choice">
																						<svg xmlns="http://www.w3.org/2000/svg"
																							width="20" height="20" fill="currentColor"
																							class="bi bi-check-square-fill animate__animated animate__flipInY"
																							viewBox="0 0 16 16">
																				        <path
																							d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z" />
																		    			</svg>
																						<a>저장됨</a>
																					</div>
																					<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedNo}" />
																				</div>
																			</c:set>
																			</c:if>
																		</c:forEach>
																	</c:otherwise>
																</c:choose>
																<c:out value="${div4}" escapeXml="false" />
																</dt>
																<dt>
																	<c:if test="${i.feedWriter eq m.userNo}">
																		<c:set var="div5">
																		</c:set>
																	</c:if>
																	<c:forEach var="fr" items="${fr}">
																		<c:forEach var="fw" items="${fw}">
																			<c:if test="${i.feedWriter eq fr.friendUser1 && i.feedWriter eq fw.friendUser2}">
																				<c:set var="div5">
																					<div class="follow-control-js">
																						<div class="remove-follow">
																							<span class="material-symbols-outlined">person_remove</span>
																							<a>팔로우 취소</a>
																						</div>
																						<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedWriter}" />
																					</div>
																				</c:set>
																			</c:if>
																			<c:if test="${i.feedWriter eq fr.friendUser1}">
																				<c:set var="div5">
																					<div class="follow-control-js">
																						<div class="remove-follow">
																							<span class="material-symbols-outlined">person_remove</span>
																							<a>팔로우 취소</a>
																						</div>
																						<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedWriter}" />
																					</div>
																				</c:set>
																			</c:if>
																			<c:if test="${i.feedWriter eq fw.friendUser2}">
																				<c:set var="div5">
																					<div class="follow-control-js">
																						<div class="add-follow">
																							<span class="material-symbols-outlined">person_add</span>
																							<a>팔로우 추가</a>
																						</div>
																						<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedWriter}" />
																					</div>
																				</c:set>
																			</c:if>
																		</c:forEach>
																	</c:forEach>
																	<c:out value="${div5}" escapeXml="false" />
																</dt>
																<dt>
																	<span class="material-symbols-outlined"> report</span>
																	<a>신고하기</a>
																</dt>
															</dl>
														</div>
													</div>
												</div>
											</div>
											<div class="feed-body">
												<div class="feed-img">
													<c:forEach var="l" items="${fi}">
														<c:if test="${i.feedNo==l.fileFno}">
															<div>
																<img src="${contextPath}/${l.filePath}/${l.changeName}" />
															</div>
														</c:if>
													</c:forEach>
												</div>
												<div class="body-bottom">
													<div class="feed-tools">
														<c:set var="div2">
															<div class="feed-control-js">
																<div class="clickable-svg initial-heart">
																	<svg xmlns="http://www.w3.org/2000/svg" width="25"
																		height="25" fill="currentColor" class="bi bi-heart"
																		viewBox="0 0 16 16">
													                <path
																		d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
													           		</svg>
																</div>
																<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedNo}" />
															</div>
														</c:set>
														<c:forEach var="o" items="${lk}">
															<c:if test="${i.feedNo == o.likeFno}">
																<c:if test="${o.likeStatus eq 'Y'}">
																	<c:set var="div2">
																		<div class="feed-control-js">
																			<div class="clickable-svg clicked-heart">
																				<svg xmlns="http://www.w3.org/2000/svg" width="25"
																					height="25" fill="currentColor"
																					class="bi bi-heart-fill" viewBox="0 0 16 16">
																                <path
																						d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
																            	</svg>
																			</div>
																			<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedNo}" />
																		</div>
																	</c:set>
																</c:if>
															</c:if>
														</c:forEach>
														<c:if test="${i.feedWriter ne m.userNo}">
															<c:out value="${div2}" escapeXml="false" />
														</c:if>
														<div class="clickable-svg" data-bs-toggle="modal"
															data-bs-target="#shareTool">
															<svg xmlns="http://www.w3.org/2000/svg" width="20"
																height="20" fill="currentColor" class="bi bi-share"
																viewBox="0 0 16 16">
                                                        <path
															d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                                                    	</svg>	
														</div>
														<div class="clickable-svg">
														<c:choose>
															<c:when test="${i.feedWriter eq m.userNo}">
																<c:set var="div3"></c:set>
															</c:when>
															<c:otherwise>
																<c:set var="div3">
																<div class="choice-control-js">
																	<div class="initial-choice">
																		<svg xmlns="http://www.w3.org/2000/svg" width="20"
																			height="20" fill="currentColor"
																			class="bi bi-plus-square" viewBox="0 0 16 16">
	                                                       				<path
																			d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
	                                                      				<path
																			d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
	                                                   					</svg>
																	</div>
																	<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedNo}" />
																</div>
																</c:set>
																<c:forEach var="c" items="${ci}">
																	<c:if test="${i.feedNo == c.choiceFno}">
																		<c:set var="div3">
																			<div class="choice-control-js">
																				<div class="clicked-choice">
																					<svg xmlns="http://www.w3.org/2000/svg"
																						width="20" height="20" fill="currentColor"
																						class="bi bi-check-square-fill animate__animated animate__flipInY"
																						viewBox="0 0 16 16">
																			        <path
																						d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z" />
																		    		</svg>		
																				</div>
																				<input type="hidden" id="feedNo_${i.feedNo}" value="${i.feedNo}" />
																			</div>
																		</c:set>
																	</c:if>
																</c:forEach>
															</c:otherwise>
														</c:choose>
														<c:out value="${div3}" escapeXml="false" />
														</div>
													</div>
													<div class="feed-text feed-text_${i.feedNo} ">
														<span> 해당 게시글을 ${i.likeCount}명이 좋아합니다. </span> <br>
													</div>
													<div class="feed-content">
														<span class="bold">
														 <c:forEach var="f" items="${pf}">
															<c:if test="${i.feedWriter==f.userNo}">
																<b>${f.userNick}</b>
															</c:if>
														</c:forEach> ${i.feedContent}
														</span> <br>
														 <span> <a>${i.feedHashtag} </a> </span>
													</div>
												</div>
											</div>
											<div class="feed-footer">
												<div class="reply-wrap">
													<div class="reply-top">
														<button data-bs-toggle="modal" data-bs-target="#feedDetail">댓글 더보기</button>
													</div>
													<div class="reply-middle">
														<dl id="reply-output_${i.feedNo}">
															<c:forEach var="n" items="${rp}">
																<c:if test="${i.feedNo==n.replyFno}">
																	<dt class="output output_${i.feedNo }">
																		<img src="${contextPath}/${n.filePath}/${n.changeName}" />
																		<div class="reply-list">
																			<span>${n.userNick }</span>
																			<span>${n.replyContent }</span>
																		</div>
																	</dt>
																</c:if>
															</c:forEach>
														</dl>
													</div>
													<input class="feedNo" type="hidden" value="${i.feedNo}" />
													<div class="reply-bottom">
														<input type="text" placeholder="댓글을 입력하세요." />
														<button class="reply_input" value="${i.feedNo}">답글</button>
													</div>
												</div>
											</div>
										</div>
									</dt>
								</c:if>
							</c:forEach>
						</c:forEach>
					</dl>
				</div>
			</div>
		</div>
		<script>
		$('.reply_input').click(function () {
		    const parentContainer = $(this).closest('.reply-bottom');
		    const inputElement = parentContainer.find('input');
		    const replyContent = inputElement.val();
		    const feedNo = $(this).val(); 
		    
		    $.ajax({
		        url: '${contextPath}/mainFeed/insertReply',
		        data: {
		            replyContent: replyContent,
		            replyFno: feedNo
		        },
		        method: 'post',
		        success: function (result) {
		        	selectReplyList(feedNo);
		        },
		        complete: function (result) {
		            inputElement.val('');
		        }
		    });
		});
		
		const selectReplyList = (feedNo) => {
			$.ajax({
				url : '${contextPath}/mainFeed/selectReplyList',
				data: {bno : feedNo },
				method : 'get',
				success : function(replyList){
					let html= "";
					for(let reply of replyList){
					html= 
						"<dt class=output output_"+reply.feedNo+">"+
						"<img src='" + '${contextPath}/' + reply.filePath + '/' + reply.changeName + "' />" +
		                "<div class='reply-list'>" +
						"<span>" + reply.userNick +"</span><span>"+ reply.replyContent + "</span>"+
						"</div>"+
						"</dt>";
					}
					$("#reply-output_"+feedNo).html(html);
				}
			})
		}; 
		
		
	         
	      const likeCount = (feedNo) => {
			    $.ajax({
			        url: '${contextPath}/mainFeed/likeCount',
			        data: { feedNo: feedNo },
			        method: 'post',
			        success: function (count) {
			        	 if (Array.isArray(count) && count.length > 0) {
			                 const likeCountValue = count[0].likeCount;

			                 let html = "<span> 해당 게시글을 " + likeCountValue + "명이 좋아합니다. </span> <br>";
			                 $(".feed-text_" + feedNo).html(html);
			        }
			        }
			    });
			}; 
			
			 $(".choice-control-js").click(function(e){
				 /* const target = $(e.currentTarget);
				 console.log(target) */
				 var storeSVG =
					    `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
					    fill="currentColor" class="bi bi-plus-square animate__animated animate__flipInY"
					    viewBox="0 0 16 16">
					    <path
					        d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
					    <path
					        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
					    </svg>`;

					var storeFillSVG =
					    `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-check-square-fill animate__animated animate__flipInY" viewBox="0 0 16 16">
					        <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z"/>
					    </svg>`;
					    
					    

			    var currentBoxSVG = $(this).find("svg");
			    var parentContainer = $(this).closest('.feed-wrap').find('.choice-control-js');
			    const svgElement = parentContainer.find("svg");
			    const aElement = parentContainer.find('a');
				    
	            if($(this).find('.bi-check-square-fill').length != 0){
	            	 const feedNo = $(this).find('input').val();
	            	 
		             $.ajax({
	                    url: '${contextPath}/mainFeed/removeChoice',
	                    data: { feedNo: feedNo },
	                    method: 'post',
	                    success: function(result) {
	                    	 currentBoxSVG.replaceWith(storeSVG);
	                    	 svgElement.replaceWith(storeSVG);
	                    	 aElement.replaceWith('<a>저장하기</a>');
	                    	
	                    },
	                    error: function(xhr, status, error) {
	                        // 오류 발생 시 실행할 코드
	                        console.error('오류 발생:', error);
	                    }
	                });
	            }else{
	               const feedNo = $(this).find('input').val();
	                
	                $.ajax({
	                    url: '${contextPath}/mainFeed/addChoice',
	                    data: { feedNo: feedNo },
	                    method: 'post',
	                    success: function(result) {
	                    	currentBoxSVG.replaceWith(storeFillSVG);
	                    	svgElement.replaceWith(storeFillSVG);
	                    	aElement.replaceWith('<a>저장됨</a>');
	                    },
	                    error: function(xhr, status, error) {
	                        // 오류 발생 시 실행할 코드
	                        console.error('오류 발생:', error);
	                    }
	                });
	            }
	            
	         });    

				 $(".follow-control-js").click(function(){
				 var followDIV = $(this).find("div");
				 var addfollow = `<div class="add-follow">
	                 <span class="material-symbols-outlined">person_add</span> 
	                 <a>팔로우 추가</a>
	             </div>`;
	             var removefollow = `<div class="remove-follow">
	                 <span class="material-symbols-outlined">person_remove</span> 
	                 <a>팔로우 취소</a>
	             </div>`;
            
			            if($(this).find('.remove-follow').length != 0){
			               const userNo = $(this).find('input').val();
			                
			                $.ajax({
			                    url: '${contextPath}/mainFeed/unfollow',
			                    data: { userNo: userNo },
			                    method: 'post',
			                    success: function(result) {
			                    	followDIV.replaceWith(addfollow);
			                    },
			                    error: function(xhr, status, error) {
			                        console.error('오류 발생:', error);
			                    }
			                });
			            }else{
			               const userNo = $(this).find('input').val();
			                
			                $.ajax({
			                    url: '${contextPath}/mainFeed/addfollow',
			                    data: { userNo: userNo },
			                    method: 'post',
			                    success: function(result) {
			                    	followDIV.replaceWith(removefollow);
			                    },
			                    error: function(xhr, status, error) {
			                        console.error('오류 발생:', error);
			                    }
			                });
			            }
			         });         
		</script>
        <div class="sub-content">
        	<div class="sub-wrap">
               <div class="sub-container">
                  <div>
                    <div class="Ranking">
                      <h1 class="Rangking_Title" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="150">나의 검색기록</h1>
                      	<c:forEach var="my" items="${history}">
                        <br>
                          <div class="Ranking_Article">
                             <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="250">
                                <div class="Ranking_Text">
                                   <div class="Ranking_Num"><b>-</b>&nbsp;&nbsp;<b>${my.searchKeyword}</b></div>
                                 </div>
                              </div>
                           </div>
                          </c:forEach>
                        </div>
                     </div>
                  </div>
              </div>
           </div>
        </div>
    </div>


    <!-- FeedDetail Modal -->
    <div class="modal fade" id="feedDetail" tabindex="-1" aria-bs-labelledby="feedDetailLabel" aria-bs-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header modal-backgound">
                    <div class="modal-title" id="feedDetail">
                        <div class="feed-header modal-feed-header">
                            <div class="modal-user-profile">
                                <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                <span>dasdasda</span>
                                <span class="material-symbols-outlined modal-toggle-button">
                                    more_horiz
                                </span>
                                <div class="modal-more-options">
                                    <div>
                                        <dl>
                                            <dt>
                                                <span class="material-symbols-outlined">
                                                    edit
                                                </span>
                                                <a>수정하기</a>
                                            </dt>
                                            <dt>
                                                <span class="material-symbols-outlined">
                                                    add_box
                                                </span>
                                                <a>저장하기</a>
                                            </dt>
                                            <dt>
                                                <span class="material-symbols-outlined">
                                                    person_add
                                                </span>
                                                <a>팔로우 하기

                                                </a>
                                            </dt>
                                            <dt>
                                                <span class="material-symbols-outlined">
                                                    person_remove
                                                </span>
                                                <a>팔로우 취소</a>
                                            </dt>
                                            <dt>
                                                <span class="material-symbols-outlined">
                                                    report
                                                </span>
                                                <a>신고하기</a>
                                            </dt>
                                        </dl>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">Ⅹ</button>
                </div>
                <div class="modal-body modal-backgound">
                    <div class="modal-feed-body">
                        <div class="feed-img">
                            <div>
                                <img src="${contextPath}/resources/images/karina2.jpeg" />
                            </div>
                            <div>
                                <img src="${contextPath}/resources/images/karina3.jpeg" />
                            </div>
                            <div>
                                <img src="${contextPath}/resources/images/karina1.jpeg" />
                            </div>
                            <div>
                                <img src="${contextPath}/resources/images/—Pngtree—user icon_5097430.png" />
                            </div>
                        </div>
                        <div class="body-bottom">
                            <div class="feed-tools">
                                <div class="clickable-svg">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                        class="bi bi-heart" viewBox="0 0 16 16">
                                        <path
                                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                    </svg>
                                </div>
                                <div class="clickable-svg" data-bs-toggle="modal" data-bs-target="#shareTool">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                        class="bi bi-share" viewBox="0 0 16 16">
                                        <path
                                            d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                                    </svg>
                                </div>
                                <div class="clickable-svg">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor"
                                        class="bi bi-plus-square" viewBox="0 0 16 16">
                                        <path
                                            d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                        <path
                                            d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                    </svg>
                                </div>
                            </div>
                            <div class="feed-text">
                                <span>
                                    회원님의 게시글을 1,024명이 좋아합니다.
                                </span>
                                <br>
                                <span>
                                    <b>dasdas</b>
                                    다 여러분들 덕분에 제가 이렇게 되었습니다 ㅎㅎ 여러분 만나서 반갑숩니다 ㅎㅎ껄껄
                                </span>
                                <br>
                                <span>
                                    <a>#카리나</a> <a>#안녕하세요</a> <a>#맞팔</a>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="modal-feed-footer">
                        <div class="reply-wrap">
                            <div class="reply-middle">
                                <dl>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
										<img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="${contextPath}/resources/images/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                </dl>
                            </div>
                            <div class="reply-bottom">
                                <input type="text" placeholder="댓글을 입력하세요." />
                                <button>답글</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Share Modal -->
    <div class="modal fade" id="shareTool" tabindex="-1" aria-labelledby="shareToolLabe" aria-hidden="true">
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
                            <span class="followBtn focus-btn">팔로워</span>
                            <span class="chatBtn">채팅방</span>
                        </div>
                        <div class="lists">
                            <div class="follower-list">
                                <div>
                                    <dl>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                    </dl>
                                </div>
                            </div>
                            <div class="chatting-list">
                                <div>
                                    <dl>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
                                        <dt>
                                            <img src="${contextPath}/resources/images/karina2.jpeg" />
                                            <span>karina_1211</span>
                                            <input type="checkbox" />
                                        </dt>
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
          AOS.init();
    </script>
     <script>
		 	//웹소켓 연결(웹 브라우저에서 실행)
		    const socketLike = new SockJS("http://localhost:8083${contextPath}/websocket"); //URL에 대한 WebSocket 연결을 설정
		    const stompLike = Stomp.over(socketLike); //WebSocket을 통해 Stomp 클라이언트를 생성
		    $(".feed-control-js").click(function(){
	            if($(this).find('.bi-heart').length != 0){
	               const feedNo = $(this).find('input').val();
	                
	                $.ajax({
	                    url: '${contextPath}/mainFeed/removeLike',
	                    data: { feedNo: feedNo },
	                    method: 'post',
	                    success: function(result) {
	                    	likeCount(feedNo);
	                    },
	                    error: function(xhr, status, error) {
	                        // 오류 발생 시 실행할 코드
	                        console.error('오류 발생:', error);
	                    }
	                });
	            }else{
	               const feedNo = $(this).find('input').val();
	                
	                $.ajax({
	                    url: '${contextPath}/mainFeed/addLike',
	                    data: { feedNo: feedNo },
	                    method: 'post',
	                    success: function(result) {
	                   		 likeCount(feedNo);
	                    },
	                    error: function(xhr, status, error) {
	                        console.error('오류 발생:', error);
	                    }
	                });
	               	const myNo = $('#myUserNo').val();
	            	const userNo = feedNo;
	                stompClient.send("/app/updateLikeStatus", {}, JSON.stringify({
	    	        	userNo: userNo,
	    	        	userNo2 : myNo
	    	        }));
	                
	            }
	         })         
		 
    	
      </script> 
   
      
      
</body>
</html>