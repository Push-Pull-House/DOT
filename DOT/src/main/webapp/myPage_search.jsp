<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage_search</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="resources/css/Dot_Main.css" rel="stylesheet" />
<link href="resources/css/Dot_myPage_search.css" rel="stylesheet" />
<link href="resources/css/Dot_Alarm.css" rel="stylesheet" />

<link rel="stylesheet" 
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<script src="resources/js/sidebar.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="logo">
				<a> <img src="resources/img/DotLogo.png.png" />
				</a>
			</div>
			<div class="header-tools">
				<div class="search-tool">
					<input type="checkbox" id="search" /> <label for="search">
						<form action="/dot/mypage_search" method="post">
							<input type="text" class="search-input"
								placeholder="검색할 항목을 입력하세요" />
						</form>
					</label> <span class="material-symbols-outlined"> search </span>
				</div>

				<div class="alert-tool">
					<span class="material-symbols-outlined" data-bs-toggle="modal"
						data-bs-target="#exampleModal"> notifications </span>
					<p></p>
				</div>
				<div class="dm-tool">
					<span class="material-symbols-outlined"> mail </span>
					<p></p>
				</div>
				<div class="profile">
					<div class="profile-img">
						<img src="resources/img/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
					</div>
					<div class="profile-name">
						<p>dasdfsdffsdfsasda</p>
					</div>
				</div>
			</div>
		</div>
		<div class="contents">
			<div class="sidebar-wrap">
				<input type="checkbox" id="menuicon"> <label for="menuicon">
					<span></span> <span></span> <span></span>
				</label>
				<div class="sidebar">
					<!-- <div class="sidebar-logo">
                        <img src="resources/img/DotLogo.png" />
                    </div> -->
					<div class="side-content">
						<div class="tools br-bottom">
							<dl>
								<dt>
									<a class="material-symbols-outlined"> home <span>홈</span>
									</a>
								</dt>
								<dt>
									<a class="material-symbols-outlined"> search <span>탐색</span>
									</a>
								</dt>
								<dt>
									<a class="material-symbols-outlined"> notifications <span>알림</span>
									</a>
								</dt>
								<dt>
									<a class="material-symbols-outlined"> mail <span>메세지</span>
									</a>
								</dt>
								<dt>
									<a class="material-symbols-outlined"> add_box <span>스토어</span>
									</a>
								</dt>
								<dt>
									<a class="material-symbols-outlined"> group <span>팔로워</span>
									</a>
								</dt>
							</dl>
						</div>
						<div class="friends br-bottom">
							<span>팔로우</span>
							<div class="friends-list">
								<a class="friend-profile">
									<div class="profile-img">
										<img
											src="resources/img/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
									</div>
									<div class="profile-name">
										<span>dasdasda</span>
									</div> <label></label>
								</a> <a class="friend-profile">
									<div class="profile-img">
										<img
											src="resources/img/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
									</div>
									<div class="profile-name">
										<span>dasdasda</span>
									</div> <label></label>
								</a> <a class="friend-profile">
									<div class="profile-img">
										<img
											src="resources/img/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
									</div>
									<div class="profile-name">
										<span>dasdasda</span>
									</div> <label></label>
								</a> <a class="friend-profile">
									<div class="profile-img">
										<img
											src="resources/img/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
									</div>
									<div class="profile-name">
										<span>dasdasda</span>
									</div> <label></label>
								</a> <a class="friend-profile">
									<div class="profile-img">
										<img
											src="resources/img/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
									</div>
									<div class="profile-name">
										<span>dasdasda</span>
									</div> <label></label>
								</a> <a class="friend-profile">
									<div class="profile-img">
										<img
											src="resources/img/KakaoTalk_Photo_2020-12-19-23-39-15.jpg" />
									</div>
									<div class="profile-name">
										<span>dasdasda</span>
									</div> <label></label>
								</a>
								<div class="friend-profile more-friends">
									<span>더보기</span> <span class="material-symbols-outlined">
										add </span>
								</div>
							</div>
						</div>
						<div class="tools br-bottom">
							<dl>
								<dt>
									<a class="material-symbols-outlined" data-toggle="modal"
										data-target="#exampleModal"> password <span>비밀번호변경</span>
									</a>
								</dt>
								<dt>
									<a class="material-symbols-outlined openPopup">
										person_remove <span>회원탈퇴</span>
									</a>
								</dt>
							</dl>
						</div>
						<div class="tools br-bottom">
							<dl>
								<dt>
									<a class="material-symbols-outlined"> logout <span>로그아웃</span>
									</a>
								</dt>
							</dl>
						</div>
						<div class="footer">
							<span> 회사소개 | 이용약관 | 개인정보처리방침 | 운영정책 | 청소년보호정책 | 권리침해신고안내
								| 공지사항 </span>
							<div>
								<p>&copy; 2023 Dot. All rights reserved.</p>
								<p>Connect with friends and share your moments with our SNS
									platform. Join us today!</p>
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
								<a class="material-symbols-outlined"> add_box </a>
								<h5>스토어</h5>
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

			<!-- 탐색 콘텐츠 영역 -->
			<div class="search-content-wrap">
				<div class="search-inputs-wrap">
					<div class="search-inputs">
						<a> <img class="back-icon" src="resources/img/back-icon.png">
						</a> <label for="search">
							<form>
								<input type="text" class="search-input-text"
									placeholder="   무엇을 찾고 싶나요?" />
							</form>
						</label>
					</div>
				</div>

				<div class="searchTag-box-wrap">
					<div class="searchTag-box">
						<span>#노티드</span> <span>#도넛</span> <span>#knotted</span> <span>#cream</span>
						<span>#doughnut</span> <span>#컵케익</span> <span>#노티드우유</span>
					</div>
				</div>

				<!-- 검색아래 피드파트-->
				<div class="feed-content-wrap">
					<div class="feed-content-wrap1">
						<div class="feed-content1">
							<a href=""> <img src="resources/img/photo1.jpg">
							</a>
						</div>
						<div class="feed-content2">
							<a href=""> <img src="resources/img/photo4.png">
							</a>
						</div>
						<div class="feed-content3">
							<a href=""> <img src="resources/img/photo3.jpg">
							</a>
						</div>
					</div>

					<div class="feed-content-wrap2">
						<div class="feed-content5">
							<a href=""> <img src="resources/img/photo5.jpg">
							</a>
						</div>
						<div class="feed-content6">
							<a href=""> <img src="resources/img/photo1.jpg">
							</a>
						</div>
						<div class="feed-content8">
							<a href=""> <img src="resources/img/photo4.png">
							</a>
						</div>
					</div>

					<div class="feed-content-wrap3">
						<div class="feed-content5">
							<a href=""> <img src="resources/img/photo2.jpg">
							</a>
						</div>
						<div class="feed-content6">
							<a href=""> <img src="resources/img/photo1.jpg">
							</a>
						</div>
						<div class="feed-content8">
							<a href=""> <img src="resources/img/photo4.png">
							</a>
						</div>
					</div>
				</div>
			</div>

			<div class="sub-content">
				<div class="sub-wrap">
					<div class="sub-container">
						<div class="sub-recommand">
							<div class="sub-title">
								<span>회원님을 위한 추천</span>
							</div>
							<div class="result-content-area">
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/profile1.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/profile2.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/profile3.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/profile4.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/profile5.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/profile6.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/profile7.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/knotted-logo2.png">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/knotted_image.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
								<div class="result-content">
									<dl class="follow-list">
										<dt class="follow-img">
											<img src="resources/img/profile8.jpg">
										</dt>
										<dt class="follow-id">
											<div class="user-id">
												<span>xeesoxee </span>
											</div>
											<div class="user-nickname">
												<span>회원님을 팔로우합니다</span>
											</div>
										</dt>
										<dt class="follow-btn">
											<button>팔로우</button>
										</dt>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">
					<div class="modal-body modal-backgound" style="height: 30%;">
						<div class="modal-box">
							<div class="alarm-all-btn">
								<a> 모두보기 </a>
							</div>
							<div class="modal-profile-icon">
								<label> <a> <img src="resources/img/profile1.jpg" />
								</a>
								</label>
								<div class="modal-alarm-contents">
									<div class="modal-alarm-user">im_Zzang_gu_da</div>
									<div class="modal-alarm-content">im_Zzang_gu_da님이 회원님을
										팔로우하기 시작했습니다.</div>
								</div>
							</div>
							<div class="modal-profile-icon">
								<label> <a> <img src="resources/img/profile2.jpg" />
								</a>
								</label>
								<div class="modal-alarm-contents">
									<div class="modal-alarm-user">i_want_to_be_a_Gamani</div>
									<div class="modal-alarm-content">i_want_to_be_a_Gamani님이
										댓글을 남겼습니다 : "나는야 진정한 가마니가 될꺼야>_0!!"</div>
								</div>
							</div>
							<div class="modal-profile-icon">
								<label> <a> <img src="resources/img/profile3.jpg" />
								</a>
								</label>
								<div class="modal-alarm-contents">
									<div class="modal-alarm-user">im_Danbi</div>
									<div class="modal-alarm-content">im_Danbi님이 회원님의 사진을
										좋아요💗 눌렀습니다.</div>
								</div>
							</div>
							<div class="modal-profile-icon">
								<label> <a> <img src="resources/img/profile4.jpg" />
								</a>
								</label>
								<div class="modal-alarm-contents">
									<div class="modal-alarm-user">im_so_Sad</div>
									<div class="modal-alarm-content">im_so_Sad님이 댓글을 남겼습니다 :
										"희미한 과거만 바라보다 선명한 현재를 놓치지 말자"</div>
								</div>
							</div>
							<div class="modal-profile-icon">
								<label> <a> <img src="resources/img/profile5.jpg" />
								</a>
								</label>
								<div class="modal-alarm-contents">
									<div class="modal-alarm-user">im_so_famous_spongeBob</div>
									<div class="modal-alarm-content">
										im_so_famous_spongeBob님이 댓글을 남겼습니다 : "사실 집게리아 패티는 중국산이야 ㅠ.ㅠ"</div>
								</div>
							</div>
							<div class="modal-profile-icon">
								<label> <a> <img src="resources/img/profile6.jpg" />
								</a>
								</label>
								<div class="modal-alarm-contents">
									<div class="modal-alarm-user">im_so_4rory_ya</div>
									<div class="modal-alarm-content">im_so_4rory_ya님이 회원님을
										팔로우하기 시작했습니다.</div>
								</div>
							</div>
							<div class="modal-profile-icon">
								<label> <a> <img src="resources/img/profile7.jpg" />
								</a>
								</label>
								<div class="modal-alarm-contents">
									<div class="modal-alarm-user">Cute_cat</div>
									<div class="modal-alarm-content">Cute_cat님이 회원님의 사진을
										좋아요💗 눌렀습니다.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- 모달 끝 -->
</body>
</html>