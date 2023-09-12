<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/Dot_Search.css"/>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/slick.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script type="text/javascript" src="${contextPath}/resources/js/Dot_Search.js"></script>

    <title>Dot.</title>
</head>

<body>
    <div class="wrap">
       		<jsp:include page="/common/Header.jsp" />
        <div class="contents">
            <jsp:include page="/common/Sidebar.jsp" />
        	<!-- 탐색 콘텐츠 영역 -->
            <div class="search-content-wrap">
                <div class="search-inputs-wrap">
                    <div class="search-inputs">
	                    <form action="${contextPath}/searchList.se" method="get">
	                        <input type="text" name="keyword" class="search-input-text input-style-search" placeholder="무엇을 찾고 싶나요?"/>
	               			<button type="submit" class="search-btn">Search</button>
	                    </form>
                    </div>                  
                </div>

                <script>
                function getSearchList(){
                    location.href="/search.jsp";
                }
                </script>

                <div class="searchTag-box-wrap">
                    <div class="searchTag-box">
                        <div id="SearchList"></div>
                        <h3 id="selected"></h3>
                        <%-- <c:if test="${empty slist}">
                        	<span>검색하신 태그가 존재하지 않습니다.</span>
                        </c:if>
                        <c:forEach items="${slist}">
                        	<span onclick="getSearchList(${param.keyword});"></span>
							<span>${param.keyword}</span>
						</c:forEach> --%>   
						                     
                        <!-- <span>#노티드</span> 
                        <span>#도넛</span> 
                        <span>#knotted</span> 
                        <span>#cream</span>
                        <span>#doughnut</span>
                        <span>#컵케익</span>
                        <span>#노티드우유</span> -->
                    </div>
                </div>

                <!-- 검색아래 피드파트-->
                 <div class="feed-content-wrap">
                    <div class="feed-content-wrap1">
                    	<c:forEach var="s" items="${slist}" begin="0" end="${slist.size()}" step="1" >
                        	<div class="feed-content2" data-bs-toggle="modal" data-bs-target="#MyDetailFeed" onclick="feedNo(event , ${s.fileNo})">
                        		<div>
                                <img src="${contextPath}/${s.filePath}/${s.changeName}">
                                <div class="like">
	                               <svg
	                                   xmlns="http://www.w3.org/2000/svg"
	                                   width="16"
	                                   height="16"
	                                   fill="currentColor"
	                                   class="bi bi-heart-fill"
	                                   viewBox="0 0 16 16"
	                               >
	                                   <path
	                                       fill-rule="evenodd"
	                                       d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"
	                                   />
	                               </svg>
	                               <span class="bi">444</span>
	                               <svg
	                                   xmlns="http://www.w3.org/2000/svg"
	                                   width="16"
	                                   height="16"
	                                   fill="currentColor"
	                                   class="bi bi-chat-left-fill"
	                                   viewBox="0 0 16 16"
	                               >
	                                   <path
	                                       d="M2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
	                                   />
	                               </svg>
	                               <span class="bi">44</span>
	                           </div>
	                           </div>
                        	</div>
                        </c:forEach>
                    </div>
                </div>   
            </div>
			<!-- 실시간 바 -->
             <div class="sub-content">
                 <div class="sub-wrap">
                     <div class="sub-container">
                         <div class="sub-recommand">
                             <div class="sub-title">
                                 <span>회원님을 위한 추천</span>
                             </div>
                              <div class="result-content-area">
                                <c:if test="${rf ne null }">
                          		  <c:forEach var ="i" items="${rf}">
                                  <div class="result-content">
                                      <dl class="follow-list">
                                          <dt class="follow-img">
                                              <img src='${contextPath}/${i.filePath}/${i.changeName}' /> 
                                          </dt>
                                          <dt class="follow-id">
                                              <div class="user-id" style="color:white;">
                                                  <span>${i.userNick }</span>
                                              </div>
                                              <div class="user-nickname">
                                                  <span>${i.userName }</span>
                                              </div>
                                          </dt>
                                          <dt class="follow-btn1">
                                              <button class="follow-btn10 follower-btn" id="f-btn1_${i.userNo}" onclick="follow(event,${i.userNo})" value="${i.userNo}"><h6>팔로우</h6></button>
                                              <button class="follow-btn10 follower-btn" id="f-btn2_${i.userNo}" onclick="unfollow(event,${i.userNo})" value="${i.userNo}" style="display:none; color:white;"><h6>팔로잉</h6></button>
                                          </dt>
                                      </dl>
                                  </div>
                           		  </c:forEach> 
                           		  </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
        //사이드바 친구추천
        function follow(e,no){
        	console.log(e,no);
            const userNo = $('#f-btn1_'+no).val();
			const clickbtn = $('#f-btn1_'+no);
			const clickbtn2 = $('#f-btn2_'+no);

            $.ajax({
                url: '${contextPath}/follow/followlist/addfollow',
                data: { userNo: userNo },
                method: 'post',
                success(result) {
                    // 처리 로직
                    clickbtn.css("display", "none");
                    clickbtn2.css("display","block");
                }
            });
        }
		
        function unfollow(e,no){
        	console.log(e,no);
        	const userNo = $('#f-btn2_'+no).val();
 			const clickbtn = $('#f-btn1_'+no);
 			const clickbtn2 = $('#f-btn2_'+no);
		    $.ajax({
		        url: '${contextPath}/follow/followlist/unfollow',
		        data: { userNo: userNo },
		        method: 'post',
		        success(result) {
		            // AJAX 요청 성공 처리
		        	clickbtn.css("display", "block");
                    clickbtn2.css("display","none");
		        }
		    });
        }
        </script>
   		 <!-- Modal1 -->
		<div class="modal fade" id="MyDetailFeed" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-xl">
		        <div class="modal-content">
		            <div class="modal-header modal-backgound">
		                <div class="modal-title" id="exampleModalLabel">
		                    <div class="feed-header modal-feed-header">
		                        <div class="modal-user-profile">
		                            <img src="${contextPath}/${profileImg.filePath}/${profileImg.changeName}" />
		                            <span>${loginUser.userNick}</span>
		                            <div class="line-div">
		                                <span class="material-symbols-outlined modal-toggle-button"> more_horiz </span>
		                                <div class="modal-more-options">
		                                    <div>
		                                        <dl>
		                                            <dt onclick="location.href='My_Feed_Edit.html'">
		                                                <span class="material-symbols-outlined"> edit </span>
		                                                <a>수정하기</a>
		                                            </dt>
		                                            <dt>
		                                                <span class="material-symbols-outlined"> add_box </span>
		                                                <a>저장하기</a>
		                                            </dt>
		                                            <dt>
		                                                <span class="material-symbols-outlined"> person_remove </span>
		                                                <a>팔로우 취소</a>
		                                            </dt>
		                                            <dt>
		                                                <span class="material-symbols-outlined"> report </span>
		                                                <a>신고하기</a>
		                                            </dt>
		                                        </dl>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		                <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">Ⅹ</button>
		            </div>
		            <div class="modal-body modal-backgound">
		                <div class="modal-feed-body">
		                    <div class="feed-img" id="feed-img">
		                     <%--  <div>
		                      	<img src="${contextPath}/resources/images/dog1.gif">
		                      </div>
		                      <div>
		                      	<img src="${contextPath}/resources/images/dog2.gif">
		                      </div> --%>
		                    </div>
		                    <div class="body-bottom">
		                        <div class="feed-tools">
		                            <div class="clickable-svg">
		                                <svg
		                                    xmlns="http://www.w3.org/2000/svg"
		                                    width="20"
		                                    height="20"
		                                    fill="currentColor"
		                                    class="bi bi-heart"
		                                    viewBox="0 0 16 16"
		                                >
		                                    <path
		                                        d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"
		                                    />
		                                </svg>
		                            </div>
		                            <div class="clickable-svg">
		                                <svg
		                                    xmlns="http://www.w3.org/2000/svg"
		                                    width="25"
		                                    height="25"
		                                    fill="currentColor"
		                                    class="bi bi-share"
		                                    viewBox="0 0 16 16"
		                                >
		                                    <path
		                                        d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z"
		                                    />
		                                </svg>
		                            </div>
		                            <div class="clickable-svg">
		                                <svg
		                                    xmlns="http://www.w3.org/2000/svg"
		                                    width="28"
		                                    height="28"
		                                    fill="currentColor"
		                                    class="bi bi-plus-square"
		                                    viewBox="0 0 16 16"
		                                >
		                                    <path
		                                        d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"
		                                    />
		                                    <path
		                                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"
		                                    />
		                                </svg>
		                            </div>
		                        </div>
		                        <div class="feed-text">
		                            <span> 회원님의 게시글을 1,024명이 좋아합니다. </span>
		                            <br />
		                            <span>
		                                <b>dasdas</b>
		                                다 여러분들 덕분에 제가 이렇게 되었습니다 ㅎㅎ 여러분 만나서 반갑숩니다 ㅎㅎ껄껄
		                            </span>
		                        </div>
		                    </div>
		                </div>
		                <div class="modal-feed-footer">
		                    <div class="reply-wrap">
		                        <div class="reply-middle">
		                            <dl>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
		                                    <div class="reply-list">
		                                        <span>dasdasda</span>
		                                        <span>와 오창정 폼 미쳐따이</span>
		                                    </div>
		                                </dt>
		                                <dt>
		                                    <img src="img/parksujun.jpg" />
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
		<script>
		const  slick2 = () => {
   	    	jb1("#MyDetailFeed .slick-dots li").eq(0).click();
   		}    
	   function feedNo(e , no){
		   //e.stopPropagation();
		   console.log(no);
	       const imgNo = no;
	       jb1.ajax({
	           url: '${contextPath}/detail.myfeed',
	           data: { imgNo : imgNo },
	           success: function (result) {
	        	   console.log(result);
	               let html = "<div id='slick_feed'>";
	               
	           	   for(let img of result){
		           		html += "<div>"
							html += "<img src=${contextPath}/"+img.filePath+"/"+img.changeName+">"
						html += "</div>"
	               }
	           		html += "</div>"
	           		
	           	   	jb1(".feed-img").html(html);
			       jb1('#slick_feed').slick({
			    	   	// Slick configuration options
			    	   	slidesToShow: 1,
			    	   	slidesToScroll: 1,
			    	   	arrows : true,
			    	   	dots:true
			    	   	// Add more options as needed
			    	 });
			       	 slick2();
	       	   }
	        });
	   }
   </script>
			   
</body>
</html>