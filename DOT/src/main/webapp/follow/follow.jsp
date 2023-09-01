<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- alert 스타일 변경-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0"
        />
        <!--<script src="js/sidebar.js"></script>-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0"
        />
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />

        <link rel="stylesheet" href="../resources/css/Following.css" />

        <title>MyFeed</title>
        <style></style>
    </head>
    <body>
        <div class="wrap">
            <div class="header">
                <div class="logo">
                    <a>
                        <img src="img/dots_logo.png" />
                    </a>
                </div>
                <div class="header-tools">
                    <div class="search-tool">
                        <input type="checkbox" id="search" />
                        <label for="search">
                            <form>
                                <input type="text" class="search-input" placeholder="검색할 항목을 입력하세요" />
                            </form>
                        </label>
                        <span class="material-symbols-outlined"> search </span>
                    </div>
                    <div class="alert-tool">
                        <span class="material-symbols-outlined"> notifications </span>
                        <p></p>
                    </div>
                    <div class="dm-tool">
                        <span class="material-symbols-outlined"> mail </span>
                        <p></p>
                    </div>
                    <div class="profile">
                        <div class="profile-img">
                            <img src="img/dog1.gif" />
                        </div>
                        <div class="profile-name">
                            <p>dasdasda</p>
                        </div>
                        <input type="checkbox" id="my-profile" />
                        <label for="my-profile">
                            <div class="my-profile">
                                <dl>
                                    <dt>
                                        <a>마이페이지 이동</a>
                                    </dt>
                                    <dt>
                                        <a>ㅁㅁㅁ 계정에서 로그아웃</a>
                                    </dt>
                                </dl>
                            </div>
                        </label>
                        <span class="material-symbols-outlined"> more_horiz </span>
                    </div>
                </div>
            </div>
            <div class="contents">
                <div class="sidebar-wrap">
                    <input type="checkbox" id="menuicon" />
                    <label for="menuicon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </label>
                    <div class="sidebar">
                        <!-- <div class="sidebar-logo">
                        <img src="resources/img/DotLogo.png" />
                    </div> -->
                        <div class="side-content">
                            <div class="tools br-bottom">
                                <dl>
                                    <dt>
                                        <a class="material-symbols-outlined">
                                            home
                                            <span>홈</span>
                                        </a>
                                    </dt>
                                    <dt>
                                        <a class="material-symbols-outlined">
                                            search
                                            <span>탐색</span>
                                        </a>
                                    </dt>
                                    <dt>
                                        <a class="material-symbols-outlined">
                                            notifications
                                            <span>알림</span>
                                        </a>
                                    </dt>
                                    <dt>
                                        <a class="material-symbols-outlined">
                                            mail
                                            <span>메세지</span>
                                        </a>
                                    </dt>
                                    <dt>
                                        <a class="material-symbols-outlined">
                                            library_add
                                            <span>스토어</span>
                                        </a>
                                    </dt>
                                    <dt>
                                        <a class="material-symbols-outlined">
                                            favorite
                                            <span>좋아요</span>
                                        </a>
                                    </dt>
                                    <dt>
                                        <a class="material-symbols-outlined">
                                            group
                                            <span>팔로워</span>
                                        </a>
                                    </dt>
                                </dl>
                            </div>
                            <div class="friends br-bottom">
                                <span>팔로우</span>
                                <div class="friends-list">
                                    <a class="friend-profile">
                                        <div class="profile-img">
                                            <img src="img/dog2.gif" />
                                        </div>
                                        <div class="profile-name">
                                            <span>dasdasda</span>
                                        </div>
                                        <label></label>
                                    </a>
                                    <a class="friend-profile">
                                        <div class="profile-img">
                                            <img src="img/dog2.gif" />
                                        </div>
                                        <div class="profile-name">
                                            <span>dasdasda</span>
                                        </div>
                                        <label></label>
                                    </a>
                                    <a class="friend-profile">
                                        <div class="profile-img">
                                            <img src="img/dog2.gif" />
                                        </div>
                                        <div class="profile-name">
                                            <span>dasdasda</span>
                                        </div>
                                        <label></label>
                                    </a>
                                    <a class="friend-profile">
                                        <div class="profile-img">
                                            <img src="img/dog2.gif" />
                                        </div>
                                        <div class="profile-name">
                                            <span>dasdasda</span>
                                        </div>
                                        <label></label>
                                    </a>
                                    <a class="friend-profile">
                                        <div class="profile-img">
                                            <img src="img/dog2.gif" />
                                        </div>
                                        <div class="profile-name">
                                            <span>dasdasda</span>
                                        </div>
                                        <label></label>
                                    </a>
                                    <a class="friend-profile">
                                        <div class="profile-img">
                                            <img src="img/dog2.gif" />
                                        </div>
                                        <div class="profile-name">
                                            <span>dasdasda</span>
                                        </div>
                                        <label></label>
                                    </a>
                                    <div class="friend-profile more-friends">
                                        <span>더보기</span>
                                        <span class="material-symbols-outlined"> add </span>
                                    </div>
                                </div>
                            </div>
                            <div class="tools br-bottom">
                                <dl>
                                    <dt>
                                        <a class="material-symbols-outlined" href="changePwd.html">
                                            password
                                            <span>비밀번호변경</span>
                                        </a>
                                    </dt>
                                    <dt>
                                        <a class="material-symbols-outlined" href="deleteUser.html">
                                            person_remove
                                            <span>회원탈퇴</span>
                                        </a>
                                    </dt>
                                </dl>
                            </div>
                            <div class="tools br-bottom">
                                <dl>
                                    <dt>
                                        <a class="material-symbols-outlined">
                                            <b>logout</b>
                                            <span>로그아웃</span>
                                        </a>
                                    </dt>
                                </dl>
                            </div>
                            <div class="footer">
                                <span>
                                    회사소개 | 이용약관 | 개인정보처리방침 | 운영정책 | 청소년보호정책 |
                                    권리침해신고안내 | 공지사항
                                </span>
                                <div>
                                    <p>&copy; 2023 Dot. All rights reserved.</p>
                                    <p>
                                        Connect with friends and share your moments with our SNS platform. Join us
                                        today!
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-shortcuts">
                        <div class="shortcuts-wrap">
                            <dl>
                                <dt>
                                    <a class="material-symbols-outlined"> home </a>
                                    <h5>홈</h5>
                                </dt>
                                <dt>
                                    <a class="material-symbols-outlined"> search </a>
                                    <h5>탐색하기</h5>
                                </dt>
                                <dt>
                                    <a class="material-symbols-outlined"> library_add </a>
                                    <h5>스토어</h5>
                                </dt>
                                <dt>
                                    <a class="material-symbols-outlined"> favorite </a>
                                    <h5>좋아요</h5>
                                </dt>
                                <dt>
                                    <a class="material-symbols-outlined"> group </a>
                                    <h5>친구</h5>
                                </dt>
                            </dl>
                            <dl>
                                <dt>
                                    <a class="material-symbols-outlined"> logout </a>
                                    <h5>로그아웃</h5>
                                </dt>
                            </dl>
                        </div>
                    </div>
                </div>
                <!-- 메인 컨텐츠 마이페이지 -->
                <div class="main-content">
                    <div class="choice1 list1">
                        <div class="mypage-selectbox">
                            <div class="selectbox">
                                <div class="follow-content">
                                    <div class="follow">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-person-heart"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"
                                            />
                                        </svg>
                                        <h6>팔로우</h6>
                                    </div>
                                    <div class="follower">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-person-hearts"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                fill-rule="evenodd"
                                                d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566ZM9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"
                                            />
                                        </svg>
                                        <h6>팔로워</h6>
                                    </div>
                                    <div class="follwer"></div>
                                </div>
                            </div>
                        </div>
                        <div class="follow-box">
                        <c:forEach var ="i" begin="0" end="${fn:length(fw)-1}">
                            <div class="result-content-area">
                                <div class="result-content">
                                    <dl class="follow-list">
                                        <div class="follow-img">
                                            <img src='${contextPath}${fw[i].filePath}/${fw[i].changeName}' />
                                        </div>
                                        <div class="follow-id">
                                            <div class="user-id">
                                                <span>${fw[i].userId}</span>
                                            </div>
                                            <div class="user-nickname">${fw[i].userNick }</div>
                                        </div>
                                        <div class="follow-btn-box">
                                            <button class="follow-btn" name ="userNo" value="${fw[i].userNo }"><h6>삭제</h6></button>
                                        </div>
                                    </dl>
                                </div>
                            </div>
						</c:forEach>
                        </div>
                    </div>
                    <script>
	                    //const userNo = $("input[name='userNo']").val();
	                    //console.log(userNo);
						$('.follow-btn').click(function() {
						    const clickedButton = $(this);
						    const userNo = clickedButton.val(); // 버튼의 value 값 가져오기
						    
						    $.ajax({
						        url: '${contextPath}/follow/followlist/unfollow',
						        data: { userNo: userNo },
						        method: 'post',
						        success(result) {
						            // AJAX 요청 성공 처리
						            console.log(result);
						
						            clickedButton.css("background-color", "white");
						            clickedButton.css("color", "black");
						
						            // 삭제 작업이 완료되면 페이지를 새로고침
						            location.reload();
						        },
						        error() {
						            console.log("AJAX error");
						        }
						    });
						});
                  
						 $(document).ready(function() {
						$('.follower-btn2').click(function() {
						    const clickedButton = $(this);
						    const userNo = clickedButton.val(); // 버튼의 value 값 가져오기
						    console.log(userNo);
						    
						    $.ajax({
						        url: '${contextPath}/follow/followlist/unfollow',
						        data: { userNo: userNo },
						        method: 'post',
						        success(result) {
						            // AJAX 요청 성공 처리
						            console.log(result);
						
						            clickedButton.css("background-color", "black");
						            clickedButton.css("color", "white");
						            clickedButton.text("팔로우");
				                    clickedButton.css("font-size", "14px");
				                    
			                    clickedButton.click(function() {
								    const clickedButton = $(this);
								    const userNo = clickedButton.val(); // 버튼의 value 값 가져오기
								    
								    $.ajax({
								        url: '${contextPath}/follow/followlist/addfollow',
								        data: { userNo: userNo },
								        method: 'post',
								        success(result) {
								            // AJAX 요청 성공 처리
								            console.log(result);
								
								            clickedButton.css("background-color", "rgb(55,55,55)");
								            clickedButton.css("color", "white");
								            clickedButton.text("팔로잉");
						                    clickedButton.css("font-size", "14px");
								        },
								        error() {
								            console.log("AJAX error");
								        }
								    });
								});
						        },
						        error() {
						            console.log("AJAX error");
						        }
						    });
						})}) ;
                    </script>
                    <!-- 하단 선택 박스2-->
                    <div class="choice2 list2">
                        <div class="mypage-selectbox">
                            <div class="selectbox">
                                <div class="follow-content">
                                    <div class="follow">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-person-heart"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                d="M9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276Z"
                                            />
                                        </svg>
                                        <h6>팔로우</h6>
                                    </div>
                                    <div class="follower">
                                        <svg
                                            xmlns="http://www.w3.org/2000/svg"
                                            width="16"
                                            height="16"
                                            fill="currentColor"
                                            class="bi bi-person-hearts"
                                            viewBox="0 0 16 16"
                                        >
                                            <path
                                                fill-rule="evenodd"
                                                d="M11.5 1.246c.832-.855 2.913.642 0 2.566-2.913-1.924-.832-3.421 0-2.566ZM9 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h10s1 0 1-1-1-4-6-4-6 3-6 4Zm13.5-8.09c1.387-1.425 4.855 1.07 0 4.277-4.854-3.207-1.387-5.702 0-4.276ZM15 2.165c.555-.57 1.942.428 0 1.711-1.942-1.283-.555-2.281 0-1.71Z"
                                            />
                                        </svg>
                                        <h6>팔로워</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="follow-box">
							<c:forEach var ="i" begin="0" end="${fn:length(fr)-1}">
	                            <div class="result-content-area">
	                                <div class="result-content">
	                                    <dl class="follow-list">
	                                        <div class="follow-img">
	                                            <img src='${contextPath}${fr[i].filePath}/${fr[i].changeName}' />
	                                        </div>
	                                        <div class="follow-id">
	                                            <div class="user-id">
	                                                <span>
			                                        	<div>${fr[i].userNick }</div>	
													 </span>
	                                            </div>
	                                            <div class="user-nickname">
	                                                <span>회원님을 팔로우합니다</span>
	                                            </div>
	                                        </div>
	                                        <div class="follow-btn-box">
						                    	<c:set var="div2">
						                        	<button class="follow-btn follower-btn" value="${fr[i].userNo}"><h6>팔로우</h6></button>
						                        </c:set>
												<c:forEach var ="j" begin="0" end="${fn:length(fw)-1}">
													<c:if test="${fw[j].userNo eq fr[i].userNo}">
														<c:set var="div2">
								                        	<button class="follow-btn follower-btn2" value="${fr[i].userNo}" ><h6>팔로잉</h6></button>
								                        </c:set>
								                    </c:if>
		                            			</c:forEach>
		                            			<c:out value="${div2}" escapeXml="false"/>
	                                        </div>
	                                    </dl>
	                                </div>
	                            </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
               <script>
				    $(document).ready(function() {
				        $('.follower-btn').click(function() {
				            const clickedButton = $(this);
				            const userNo = clickedButton.val();
				            console.log(userNo);
				
				            $.ajax({
				                url: '${contextPath}/follow/followlist/addfollow',
				                data: { userNo: userNo },
				                method: 'post',
				                success(result) {
				                    // 처리 로직
				                    clickedButton.css("background-color", "rgb(55,55,55)");
				                    clickedButton.css("color", "white");
				                    clickedButton.text("팔로잉");
				                    clickedButton.css("font-size", "14px");
				                    
				                    clickedButton.click(function() {
				                    	
									    const clickedButton = $(this);
									    const userNo = clickedButton.val(); // 버튼의 value 값 가져오기
									    
									    $.ajax({
									        url: '${contextPath}/follow/followlist/unfollow',
									        data: { userNo: userNo },
									        method: 'post',
									        success(result) {
									            // AJAX 요청 성공 처리
									            console.log(result);
									
									            clickedButton.css("background-color", "black");
									            clickedButton.css("color", "white");
									            clickedButton.text("팔로우");
							                    clickedButton.css("font-size", "14px");
									        },
									        error() {
									            console.log("AJAX error");
									        }
									    });
									});
							        },
				                error() {
				                    console.log("AJAX error");
				                }
				            });
				        });
				    });
					
				    //사이드바 친구추천
				    $(document).ready(function() {
				        $('.follower-btn1').click(function() {
				            const clickedButton = $(this);
				            const userNo = clickedButton.val();
				            console.log(userNo);
				
				            $.ajax({
				                url: '${contextPath}/follow/followlist/addfollow',
				                data: { userNo: userNo },
				                method: 'post',
				                success(result) {
				                    // 처리 로직
				                    clickedButton.css("border", "0px !important");
				                    clickedButton.css("color", "white");
				                    clickedButton.text("팔로잉");
				                    clickedButton.css("font-size", "14px");
				                
 									clickedButton.click(function() {
				                    	
									    const clickedButton = $(this);
									    const userNo = clickedButton.val(); // 버튼의 value 값 가져오기
									    
									    $.ajax({
									        url: '${contextPath}/follow/followlist/unfollow',
									        data: { userNo: userNo },
									        method: 'post',
									        success(result) {
									            // AJAX 요청 성공 처리
									            console.log(result);
									
									            clickedButton.css("color", "#0095f6");
									            clickedButton.text("팔로우");
							                    clickedButton.css("font-size", "14px");
									        },
									        error() {
									            console.log("AJAX error");
									        }
									    });
									});
							        },
				                error() {
				                    console.log("AJAX error");
				                }
				            });
				        });
				    });
				</script>
                <!-- 실시간 바 -->
                <div class="sub-content">
                    <div class="sub-wrap">
                        <div class="sub-container">
                            <div class="sub-recommand">
                                <div class="sub-title">
                                    <span>회원님을 위한 추천</span>
                                </div>
	                                <div class="result-content-area">
                             		  <c:forEach var ="i" begin="0" end="${fn:length(rf)-1}">
	                                    <div class="result-content">
	                                        <dl class="follow-list">
	                                            <dt class="follow-img">
	                                                <img src='${contextPath}${rf[i].filePath}/${rf[i].changeName}' /> 
	                                            </dt>
	                                            <dt class="follow-id">
	                                                <div class="user-id">
	                                                    <span>${rf[i].userId }</span>
	                                                </div>
	                                                <div class="user-nickname">
	                                                    <span>${rf[i].userNick }</span>
	                                                </div>
	                                            </dt>
	                                            <dt class="follow-btn1">
	                                                <button class="follower-btn1" value="${rf[i].userNo}"><h6>팔로우<h6></button>
	                                            </dt>
	                                        </dl>
	                                    </div>
                              		  </c:forEach> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                <script>
                
                $(".follow").click(()  => {
                    $(".list1").css("display","block");
                    $(".list2").css("display","none");
                    location.reload();
                })
                $(".follower").click(() =>  {
                    $(".list2").css("display","block");
                    $(".list1").css("display","none");
                });
                </script>
        <script>
            function toMyFeed() {
                location.href = 'My_Feed.html';
            }
            $(document).ready(function () {
                const choice1 = $('.list1');
                const choice2 = $('.list2');
                const span1 = $('#pro-span3');
                choice1.removeClass('choice1');
                choice2.addClass('choice2');
                span1.css('color', 'black');
                
            });
            /* 선택 */
            function toggleFollow() {}
        </script>
    </body>
</html>
