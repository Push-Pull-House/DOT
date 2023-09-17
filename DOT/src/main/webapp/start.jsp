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
        <div class="start-wrap">
        </div>
        <div class="header">
            <div class="logo">
                <a>
                    <img src="resources/images/DotLogo.png" />
                </a>
            </div>
            <div class="header-form">
                <a href="${contextPath}/login.me">Log in</a>
                <a href="#">Sign in</a>
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
                        <div class="left-description" style="text-align:center;">
                            <div class="left-t1 hide-text">
                                당신의 일상을 기록하세요!
                            </div>
                            <div class="left-t2 hide-text">
                                상대방과 자유롭게 <br> 
                                소통할 수 있어요
                            </div>
                            <div class="left-t3 hide-text">
                                재미있게 <br>
                                대화를 나누세요
                            </div>
                        </div>
                        <div class="right-description" style="display: table;">
                            <div class="right-img1">
                                <div class="img-box" style="display: table-cell;">
                                    <img src="resources/images/start_sample1.jpg" style="width: 1000px; height:1500px; max-height:1400px;">
                                </div>
                            </div>
                            <div class="right-img2">
                                <div class="img-box" style="display: table-cell;">
                                    <img src="resources/images/start_sample2.jpg" style="width: 1000px; height:1500px;max-height:1400px;">
                                </div>
                            </div>
                            <div class="right-img3">
                                <div class="img-box" style="display: table-cell;">
                                    <img src="resources/images/start_sample3.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="section3-wrap">
                <div class="divide_content">
                    <div class="divide_ctn">
                        <div class="splitview skewed">
                            <div class="panel bottom1">
                                <div class="content">
                                    <div class="description">
                                        <h1>The original image.</h1>
                                        <p>This is how the image looks like before applying a duotone effect.</p>
                                    </div>

                                    <img src="https://cdn.ibos.kr/design/upload_file/__HTMLEDITOR__/mystyxn/d74462fd1229b0d74e0b2932199c1644_16887163229279.jpg"
                                        alt="Original">
                                </div>
                            </div>

                            <div class="panel top1">
                                <div class="content">
                                    <div class="description">
                                        <h1>The duotone image.</h1>
                                        <p>This is how the image looks like after applying a duotone effect.</p>
                                    </div>

                                    <img src="https://nimage.newsway.co.kr/photo/2023/07/07/20230707000038_0700.jpg"
                                        alt="Duotone">
                                </div>
                            </div>

                            <div class="handle1"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>