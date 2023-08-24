<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib
prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Login Page</title>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		
        <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
        <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="resources/css/login.css" rel="stylesheet" />
        <link
            rel="stylesheet"
            type="text/css"
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css"
        />
    </head>
    <body>
    	<c:if test="${ not empty alertMsg }">
			<script>
				if('${alertMsg}' == '아이디 또는 비밀번호가 일치하지 않습니다.'){
					swal('${alertMsg}');
				}
				else if('${alertMsg}' == '로그아웃 되었습니다.'){
					swal('${alertMsg}');
				}
			</script>
			<c:remove var="alertMsg" />
		</c:if>
        <script>
            
            AOS.init();
        </script>
            <div class="blackbox">&nbsp;</div>
            <div id="login-content-wrap">
                <!-- 로그인 컨텐츠 -->
                <!-- 로고 -->
                <div class="login_logo" data-aos="fade-up" data-aos-delay="250">
                    <img src="resources/images/dots_logo.png" />
                </div>
                <div id="login-content">
                    <h1><b>로그인</b></h1>
                    <div id="login-form">
                        <br />
                        <form action="${contextPath}/login.me" method="post">
                            <div id="login-width">
                                <h6 data-aos="fade-up" data-aos-delay="350">아이디</h6>
                                <div class="form-floating" data-aos="fade-up" data-aos-delay="350">
                                    <input
                                        name="userId"
                                        type="text"
                                        class="form-control login-min"
                                        placeholder="아이디를 입력해주세요"
                                        required
                                    />
                                </div>
                                <h6 data-aos="fade-up" data-aos-delay="450">비밀번호</h6>
                                <div class="form-floating" data-aos="fade-up" data-aos-delay="450">
                                    <input
                                        type="password"
                                        name="userPwd"
                                        class="form-control login-min"
                                        placeholder="비밀번호를 입력해주세요"
                                        required
                                    />
                                </div>
                                <button
                                    class="w-100 btn btn-lg btn-primary login-min"
                                    type="submit"
                                    data-aos="fade-up"
                                    data-aos-delay="550"
                                >
                                    로그인
                                </button>
                                <button
                                    class="w-100 btn btn-lg btn-secondary login-min"
                                    type="button"
                                    data-aos="fade-up"
                                    data-aos-delay="550"
                                    onclick="enroll()"
                                >
                                    회원가입
                                </button>
                            </div>
                        </form>
                        <div class="pwd_find login-min" data-aos="fade-up" data-aos-delay="650">
                            <a data-toggle="modal" data-target="#exampleModal">비밀번호를 잊어버리셨나요?</a>
                        </div>
                    </div>
                </div>
                <script>
                    function mainFeed() {
                        location.href = 'MainFeed.html';
                    }
                    function enroll() {
                        location.href = 'EnrollForm.html';
                    }
                </script>
            </div>
            <!-- 로그인 컨텐츠 끝 -->
            <!-- Modal -->
            <div
                class="modal fade"
                id="exampleModal"
                tabindex="-1"
                aria-labelledby="exampleModalLabel"
                aria-hidden="true"
                data-backdrop="static"
            >
                <div class="modal-dialog">
                    <div class="modal-content modalstyle">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
                            <button
                                type="button"
                                class="btn-close close_btn close_btn_style"
                                data-dismiss="modal"
                                aria-label="Close"
                            >
                                X
                            </button>
                        </div>
                        <div class="modal-body">
                            <h6>아이디</h6>
                            <div class="form-floating">
                                <input
                                    name="userId"
                                    type="text"
                                    class="form-control"
                                    placeholder="아이디를 입력해주세요"
                                    required
                                />
                            </div>
                            <h6>이메일</h6>
                            <div class="form-floating">
                                <input
                                    name="userEmail"
                                    type="text"
                                    class="form-control"
                                    placeholder="가입한 이메일을 입력해주세요"
                                    required
                                />
                                <br />
                                <button id="btncolor" type="button" class="btn btn-secondary" onclick="sendKey();">
                                    인증키 받기
                                </button>
                            </div>
                            <br />
                            <h6>인증번호</h6>
                            <div class="form-floating">
                                <input
                                    name="userEmail"
                                    type="text"
                                    class="form-control"
                                    placeholder="가입한 이메일을 입력해주세요"
                                    required
                                    readonly
                                />
                                <br />
                                <button id="btncolor" type="button" class="btn btn-secondary" onclick="checkKey();">
                                    인증키 확인
                                </button>
                            </div>
                        </div>
                        <div class="modal-footer modal-bottom">
                            <button type="button" class="btn btn-primary" onclick="checkEmail();">완료</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                        </div>
                    </div>
                </div>
            </div>

            <!--========================================= 모달창 끝 ======================================================-->
            <span id="leaf01" class="leaf">
                <img src="resources/images/star3.png" alt="" />
            </span>
            <span id="leaf02" class="leaf">
                <img src="resources/images/star4.png" alt="" />
            </span>
            <span id="leaf03" class="leaf">
                <img src="resources/images/star2.png" alt="" />
            </span>
            <span id="leaf04" class="leaf">
                <img src="resources/images/star3.png" alt="" />
            </span>
            <span id="leaf05" class="leaf">
                <img src="resources/images/star2.png" alt="" />
            </span>
            <span id="leaf06" class="leaf">
                <img src="resources/images/star3.png" alt="" />
            </span>
            <span id="leaf07" class="leaf">
                <img src="resources/images/star2.png" alt="" />
            </span>
            <span id="leaf08" class="leaf">
                <img src="resources/images/star4.png" alt="" />
            </span>
            <span id="leaf09" class="leaf">
                <img src="resources/images/star2.png" alt="" />
            </span>
            <span id="leaf10" class="leaf">
                <img src="resources/images/star3.png" alt="" />
            </span>
            <span id="leaf11" class="leaf">
                <img src="resources/images/star4.png" alt="" />
            </span>
            <span id="leaf12" class="leaf">
                <img src="resources/images/star2.png" alt="" />
            </span>
            <span id="leaf13" class="leaf">
                <img src="resources/images/star2.png" alt="" />
            </span>
            <span id="leaf14" class="leaf">
                <img src="resources/images/star3.png" alt="" />
            </span>
        </div>
    </body>
</html>
