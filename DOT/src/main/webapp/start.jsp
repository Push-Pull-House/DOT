<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="resources/css/Dot_StartPage.css" />
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,200,0,0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="resources/js/Dot_StartPage.js"></script>



    <title>Dot.</title>
</head>

<body>
    <div class="wrap">
        <!-- <div class="start-wrap">
        </div> -->
        <div class="header">
            <div class="logo">
                <a>
                    <img src="resources/images/DotLogo.png" />
                </a>
            </div>
            <div class="header-form">
                <a href="${contextPath}/login.me">Log in</a>
                <a href="${contextPath}/enrollForm.me">Sign in</a>
            </div>
        </div>
        <div class="section-container">
            <div class="section1-wrap">
                <div class="sec1-header">
                    <div class="sec1-t1">Digits connect us,</div>
                    <div class="sec1-t2">Online realm, endless and bright,</div>
                    <div class="sec1-t3">Together we thrive.</div>
                </div>
            </div>
            <div class="section2-wrap">
                <div class="sec2-header">
                    <div class="sec2-t">
                        Digits connect us, Online realm, endless and bright, Together we thrive.
                    </div>
                </div>
                <div class="sec2-body">
                    <div class="sec2-container">
                        <div class="left-description">
                            <div class="left-t1 hide-text">
                                <div class="t1-head">
                                	Explore What's New
                                </div>
                                <div class="t1-body">
                                	지속적으로 발전하는 기능을 통해 여러분은 <br> 새로운 방식으로 자신을 표현할 수 있습니다.
                                </div>
                                <div class="t1-foot">
                                </div>
                            </div>
                            <div class="left-t2 hide-text">
                                description 2
                            </div>
                            <div class="left-t3 hide-text">
                                description 3
                            </div>
                        </div>
                        <div class="right-description">
                            <div class="right-img1">
                                <div class="img-box">
                                    <img src="${contextPath }/resources/images/sns_image.jpeg">
                                </div>
                            </div>
                            <div class="right-img2">
                                <div class="img-box">
                                    <img src="resources/img/karina3.jpeg">
                                </div>
                            </div>
                            <div class="right-img3">
                                <div class="img-box">
                                    <img src="resources/img/karina1.jpeg">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section3-wrap">
            </div>
            <div class="section4-wrap">
            	<div class="section4-container">
            		<img alt="" src="${contextPath }/resources/images/sns_image3.jpeg">
            		<div class="sec4-txt">
            			<div>
            			</div>
            			<a>시작하기</a>
            		</div>
            	</div>
            </div>
        </div>
    </div>
</body>

</html>