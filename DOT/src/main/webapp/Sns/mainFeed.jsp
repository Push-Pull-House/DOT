<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/MainFeed.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,300,0,0" />
        
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript" src="resources/js/MainFeed.js"></script>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="resources/css/slick.css" />
</head>
<body>
	<div class="wrap">
        <div class="header">
            <div class="logo">
                <a>
                    <img src="resources/images/dot_logo.png" />
                </a>
            </div>
            <div class="header-tools">
                <div class="search-tool">
                    <input type="checkbox" id="search" />
                    <label for="search">
                        <form action="" method="get">
                            <input type="text" class="search-input" placeholder="검색할 항목을 입력하세요" />
                        </form>
                    </label>
                    <span class="material-symbols-outlined">
                        search
                    </span>
                </div>
                <div class="alert-tool">
                    <span class="material-symbols-outlined">
                        notifications
                    </span>
                    <p></p>
                </div>
                <div class="dm-tool">
                    <span class="material-symbols-outlined">
                        mail
                    </span>
                    <p></p>
                </div>
                <div class="profile">
                    <div class="profile-img" onclick="location.href='My_Feed.html';">
                        <img src="resources/images/sampe_img1.jpg" />
                    </div>
                    <div class="profile-name" onclick="location.href='My_Feed.html';">
                        <p>dasdfsdffsdfsasda</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="contents">
            <div class="sidebar-wrap">
                <input type="checkbox" id="menuicon">
                <label for="menuicon">
                    <span></span>
                    <span></span>
                    <span></span>
                </label>
                <div class="sidebar">
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
                                        add_box
                                        <span>스토어</span>
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
                                        <img src="resources/images/sampe_img1.jpg" />
                                    </div>
                                    <div class="profile-name">
                                        <span>dasdasda</span>
                                    </div>
                                    <label></label>
                                </a>
                                <a class="friend-profile">
                                    <div class="profile-img">
                                        <img src="resources/images/sampe_img1.jpg" />
                                    </div>
                                    <div class="profile-name">
                                        <span>dasdasda</span>
                                    </div>
                                    <label></label>
                                </a>
                                <a class="friend-profile">
                                    <div class="profile-img">
                                        <img src="resources/images/sampe_img1.jpg" />
                                    </div>
                                    <div class="profile-name">
                                        <span>dasdasda</span>
                                    </div>
                                    <label></label>
                                </a>
                                <a class="friend-profile">
                                    <div class="profile-img">
                                        <img src="resources/images/sampe_img1.jpg" />
                                    </div>
                                    <div class="profile-name">
                                        <span>dasdasda</span>
                                    </div>
                                    <label></label>
                                </a>
                                <a class="friend-profile">
                                    <div class="profile-img">
                                        <img src="resources/images/sampe_img1.jpg" />
                                    </div>
                                    <div class="profile-name">
                                        <span>dasdasda</span>
                                    </div>
                                    <label></label>
                                </a>
                                <a class="friend-profile">
                                    <div class="profile-img">
                                        <img src="resources/images/sampe_img1.jpg" />
                                    </div>
                                    <div class="profile-name">
                                        <span>dasdasda</span>
                                    </div>
                                    <label></label>
                                </a>
                                <div class="friend-profile more-friends">
                                    <span>더보기</span>
                                    <span class="material-symbols-outlined">
                                        add
                                    </span>
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
                                        logout
                                        <span>로그아웃</span>
                                    </a>
                                </dt>
                            </dl>
                        </div>
                        <div class="footer">
                            <span>
                                회사소개 | 이용약관 | 개인정보처리방침 | 운영정책 | 청소년보호정책 | 권리침해신고안내 | 공지사항
                            </span>
                            <div>
                                <p>&copy; 2023 Dot. All rights reserved.</p>
                                <p>Connect with friends and share your moments with our SNS platform. Join us today!</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-shortcuts">
                    <div class="shortcuts-wrap">
                        <dl>
                            <dt>
                                <a class="material-symbols-outlined">
                                    home
                                </a>
                                <h5>홈</h5>
                            </dt>
                            <dt>
                                <a class="material-symbols-outlined">
                                    search
                                </a>
                                <h5>탐색하기</h5>
                            </dt>
                            <dt>
                                <a class="material-symbols-outlined">
                                    add_box
                                </a>
                                <h5>스토어</h5>
                            </dt>
                            <dt>
                                <a class="material-symbols-outlined">
                                    group
                                </a>
                                <h5>친구</h5>
                            </dt>
                        </dl>
                        <dl>
                            <dt>
                                <a class="material-symbols-outlined" href="${contextPath}/logout.me ">
                                    logout
                                </a>
                                <h5>로그아웃</h5>
                            </dt>
                        </dl>
                    </div>
                </div>
            </div>
            <div class="main-content">
                <div class="main-wrap">
                    <div class="feed-list">
                        <dl>
                            <dt>
                                <div class="feed-wrap">
                                    <div class="feed-header">
                                        <div class="user-profile">
                                            <img src="resources/images/sampe_img1.jpg" />
                                            <span>dasdasda</span>
                                            <span class="material-symbols-outlined toggle-button"
                                                id="more-options-icon">
                                                more_horiz
                                            </span>
                                            <div class="more-options">
                                                <div>
                                                    <dl>
                                                        <dt>
                                                            <span class="material-symbols-outlined" onclick="location.href='My_Feed_Edit.html'">
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
                                    <div class="feed-body">
                                        <div class="feed-img">
                                            <div>
                                                <img src="resources/images/IU.jfif" />
                                            </div>
                                            <div>
                                                <img src="resources/images/sampe_img2.jpg" />
                                            </div>
                                            <div>
                                                <img src="resources/images/sample_img3.gif" />
                                            </div>
                                            <div>
                                                <img src="resources/images/sample_img14.gif" />
                                            </div>
                                        </div>
                                        <div class="body-bottom">
                                            <div class="feed-tools">
                                                <div class="clickable-svg">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                                        class="bi bi-heart" viewBox="0 0 16 16">
                                                        <path
                                                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                                    </svg>
                                                </div>
                                                <div class="clickable-svg">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                        fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
                                                        <path
                                                            d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                                                    </svg>
                                                </div>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor"
                                                    class="bi bi-plus-square" viewBox="0 0 16 16">
                                                    <path
                                                        d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                                    <path
                                                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                                </svg>
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-footer">
                                        <div class="reply-wrap">
                                            <div class="reply-top">
                                                <button data-bs-toggle="modal" data-bs-target="#exampleModal">댓글
                                                    더보기</button>
                                            </div>
                                            <div class="reply-middle">
                                                <dl>
                                                    <dt>
                                                        <img
                                                            src="resources/images/parksujun.jpg" />
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
                            </dt>
                            <dt>
                                <div class="feed-wrap">
                                    <div class="feed-header">
                                        <div class="user-profile">
                                            <img src="img/sampe_img1.jpg" />
                                            <span>dasdasda</span>
                                            <span class="material-symbols-outlined toggle-button"
                                                id="more-options-icon">
                                                more_horiz
                                            </span>
                                            <div class="more-options">
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
                                    <div class="feed-body">
                                        <div class="feed-img">
                                            <div>
                                                <img src="resources/images/dog5.gif" />
                                            </div>
                                            <div>
                                                <img src="resources/images/dog2.gif" />
                                            </div>
                                            <div>
                                                <img src="resources/images/dog3.gif" />
                                            </div>
                                            <div>
                                                <img src="resources/images/dog4.gif" />
                                            </div>
                                        </div>
                                        <div class="body-bottom">
                                            <div class="feed-tools">
                                                <div class="clickable-svg">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                                        class="bi bi-heart" viewBox="0 0 16 16">
                                                        <path
                                                            d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
                                                    </svg>
                                                </div>
                                                <div class="clickable-svg">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                                        fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
                                                        <path
                                                            d="M13.5 1a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zM11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.499 2.499 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5zm-8.5 4a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3zm11 5.5a1.5 1.5 0 1 0 0 3 1.5 1.5 0 0 0 0-3z" />
                                                    </svg>
                                                </div>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor"
                                                    class="bi bi-plus-square" viewBox="0 0 16 16">
                                                    <path
                                                        d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
                                                    <path
                                                        d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                                                </svg>
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="feed-footer">
                                        <div class="reply-wrap">
                                            <div class="reply-top">
                                                <button data-bs-toggle="modal" data-bs-target="#exampleModal">댓글
                                                    더보기</button>
                                            </div>
                                            <div class="reply-middle">
                                                <dl>
                                                    <dt>
                                                        <img
                                                            src="resources/images/parksujun.jpg" />
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
                            </dt>
                           

                        </dl>
                    </div>
                </div>
            </div>
            <div class="sub-content">
                <div class="sub-wrap">
                    <div class="sub-container">
                        <div>
                            <div class="Ranking">
                                <h1 class="Rangking_Title" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="150">실시간 랭킹</h1>
                                <br>
                                <div class="Ranking_Article">
                                    <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="250">
                                        <div class="num">1위</div>
                                        <div class="Ranking_Text">
                                            <div class="Ranking_Num"><b>수진님 담주에는 오나?</b></div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                
                                <div class="Ranking_Article">
                                    <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="350">
                                        <div class="num">2위</div>
                                        <div class="Ranking_Text">
                                            <div class="Ranking_Num"><b>서현역 칼부림</b></div>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <div class="Ranking_Article">
                                    <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="450">
                                        <div class="num">3위</div>
                                        <div class="Ranking_Text">
                                            <div class="Ranking_Num"><b>유토피아 콘크리트</b></div>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <div class="Ranking_Article">
                                    <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="550">
                                        <div class="num">4위</div>
                                        <div class="Ranking_Text">
                                            <div class="Ranking_Num"><b>김소연 다리 그만떨어</b></div>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <div class="Ranking_Article">
                                    <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="650">
                                        <div class="num">5위</div>
                                        <div class="Ranking_Text">
                                            <div class="Ranking_Num"><b>집에 가고싶다..</b></div>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <div class="Ranking_Article">
                                    <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="750">
                                        <div class="num">6위</div>
                                        <div class="Ranking_Text">
                                            <div class="Ranking_Num"><b>박보영 졸귀</b></div>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <div class="Ranking_Article">
                                    <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="850">
                                        <div class="num">7위</div>
                                        <div class="Ranking_Text">
                                            <div class="Ranking_Num"><b>마이페이지</b></div>
                                        </div>
                                    </div>
                                </div>
                                <br>

                                <div class="Ranking_Article">
                                    <div class="Ranking_Content" data-aos="fade-left" data-aos-anchor="top-top" data-aos-delay="950">
                                        <div class="num">8위</div>
                                        <div class="Ranking_Text">
                                            <div class="Ranking_Num"><b>오창정 프신..</b></div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header modal-backgound">
                    <div class="modal-title" id="exampleModalLabel">
                        <div class="feed-header modal-feed-header">
                            <div class="modal-user-profile">
                                <img src="resources/images/sampe_img1.jpg" />
                                <span>dasdasda</span>
                                <div class="line-div">
                                    <span class="material-symbols-outlined modal-toggle-button">
                                        more_horiz
                                    </span>
                                    <div class="modal-more-options">
                                        <div>
                                            <dl>
                                                <dt onclick="location.href='My_Feed_Edit.html'">
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
                    </div>
                    <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">Ⅹ</button>
                </div>
                <div class="modal-body modal-backgound">
                    <div class="modal-feed-body">
                        <div class="feed-img2">
                            <div>
                                <img src="resources/images/IU.jfif" />
                            </div>
                            <div>
                                <img src="resources/images/sampe_img2.jpg" />
                            </div>
                            <div>
                                <img src="resources/images/sample_img14.gif" />
                            </div>
                            <div>
                                <img src="resources/images/sample_img3.gif" />
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
                                <div class="clickable-svg">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
                                        fill="currentColor" class="bi bi-share" viewBox="0 0 16 16">
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
                            </div>
                        </div>
                    </div>
                    <div class="modal-feed-footer">
                        <div class="reply-wrap">
                            <div class="reply-middle">
                                <dl>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
                                        <div class="reply-list">
                                            <span>dasdasda</span>
                                            <span>와 오창정 폼 미쳐따이</span>
                                        </div>
                                    </dt>
                                    <dt>
                                        <img src="resources/images/parksujun.jpg" />
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
          AOS.init();
    </script>
</body>
</html>