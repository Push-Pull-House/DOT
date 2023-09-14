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
	
	 <!--  웹소켓 -->
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
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
                	<input type="hidden" value="${loginUser.userNo }" id="myUserNo"/>
                    <div class="search-inputs">
	                    <form action="${contextPath}/searchList.se" method="get">
	                        <input type="text" value="${keyword}" name="keyword" class="search-input-text input-style-search" placeholder="무엇을 찾고 싶나요?"/>
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
                    </div>
                </div>

                <!-- 검색아래 피드파트-->
                 <div class="feed-content-wrap">
                    <div class="feed-content-wrap1">
                    	<c:forEach var="s" items="${slist}" begin="0" end="${slist.size()}" step="1" >
                        	<div class="feed-content2" data-bs-toggle="modal" data-bs-target="#MyDetailFeed" onclick="feedNo(event , ${s.fileFno})">
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
	                               <span class="bi">${s.likeCount}</span>
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
	                                                <div class="user-id">
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
         const socketFollow5 = new SockJS("http://localhost:8083${contextPath}/websocket"); //URL에 대한 WebSocket 연결을 설정
        const stompFollow5 = Stomp.over(socketFollow5); //WebSocket을 통해 Stomp 클라이언트를 생성
        function follow(e,no){
        	const myNo = $('#myUserNo').val();
        	const userNo = $('#f-btn2_'+no).val();
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
 			console.log(userNo);
	        stompClient.send("/app/updateFollowStatus", {}, JSON.stringify({
	        	userNo: userNo,
	        	userNo2 : myNo
	        }));
	    };
		
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
		       <div class="modal-dialog modal-xl" style="margin-top:110px;">
		           <div class="modal-content">
		               <div class="modal-header modal-backgound">
		                   <div class="modal-title" id="exampleModalLabel">
		                       <div class="feed-header modal-feed-header">
		                           <div class="modal-user-profile">
				                          <div style="width:585px;" id="myChoiceModal">
			                               </div>
		                                   <span class="material-symbols-outlined modal-toggle-button" style="font-weight:bold"> more_horiz </span>
		                                   <div class="modal-more-options">
		                                       <div>
		                                           <dl>
		                                               <dt id="check-store" class="clickable-svg-store1">
	                                                 
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
		                   <button type="button" class="modal-close" data-bs-dismiss="modal" aria-label="Close">Ⅹ</button>
		               </div>
		               <div class="modal-body modal-backgound">
		                   <div class="modal-feed-body">
		                       <div class="feed-img" id="feed-img">
		                       </div>
		                       <div class="body-bottom">
		                            <div class="feed-tools">
		                               <div class="clickable-svg clickable-svg-heart">
		                                   
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
		                               <div class="clickable-svg clickable-svg-store clickable-svg-store1">
		                                   
		                               </div>
		                           </div>
		                           <div class="feed-text">
		                               <span id="modal-likeCount2"></span>
		                               <br />
		                               <span id="modal-content2"></span>
		                               <br />
		                               <span id="modal-hash2"></span>
		                               <br />
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
	       const hearticon = $('.clickable-svg-heart');
	       const storeicon = $('.clickable-svg-store');
	       const checkstore = $('#check-store');
	       const checkfollow = $('#check-follow');
	       const feedContent = $('#modal-content2');
	       const feedhash = $('#modal-hash2');
	       jb1.ajax({
	           url: '${contextPath}/detail.myfeed',
	           data: { imgNo : imgNo },
	           success: function (result) {
	        	   console.log(result);
	        	   value6="";
	        	   value7="";
	        	   value5="";
	        	   value4="";
	        	   value3="";
	        	   value2="";
	        	   value ="";
	        	   var setting= result[0].feedHashtag.split("#");
	        	   value6 += "<b>"+result[0].userNick+"</b> " + result[0].feedContent;
	     		   for(let i=1 ; i<setting.length ; i++ ){
	           			value7 += "<a class='hashTag-modal' href='${contextPath}/searchList.se?keyword="+setting[i]+"'>#"+setting[i]+"</a>";
	           	   }
	        	   let html = "<div class='fileNum' style='display:none'>"+result[0].fileFno+"</div>"
           	   	   html += "<div id='slick_feed'>";
		           	   for(let img of result){
		      		   	if(img.changeName != "DotLogo_D.png" && img.fileLevel != 1){
				        	html += "<div>"
							html += "<img src=${contextPath}/"+img.filePath+"/"+img.changeName+">"
							html += "</div>"
		      	   		}
		              }
		           	html += "</div>"
		            jb1(".feed-img").html(html);
		           	
           			value += "회원님의 게시글을 "+result[0].likeCount+"명이 좋아합니다."
           			
           			value2 += "<img src=${contextPath}/"+result[0].filePath+"/"+result[0].changeName+">"+
     				  "<span style='margin-left: 20px;'>"+result[0].userNick+"</span>";	
		     		if(result[0].likeFno == 0){
		         		value3 += "<input type='hidden' id='myfeedchoicemodal' value='" + result[1].fileFno + "'>"+
		         				  "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='currentColor' class='bi bi-heart' viewBox='0 0 16 16'>"+
		                        "<path d='m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z'/>"+
		                  	  "</svg>";	  
		     		}else{
		              value3 += "<input type='hidden' id='myfeedchoicemodal' value=" + result[1].fileFno + ">"+
		              		  "<svg xmlns='http://www.w3.org/2000/svg' width='25' height='25' fill='red' class='bi bi-heart-fill animate__animated animate__rubberBand' viewBox='0 0 16 16'>"+
		                        "<path fill-rule='evenodd' d='M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z'/>"+
		                  	  "</svg>";
		     		}
		     		if(result[0].choiceFno == 0){
		         		value4 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-plus-square' viewBox='0 0 16 16'>"+
		                        "<path d='M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>"+
		                        "<path d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/>"+
		                  	  "</svg>";	  
		     		}else{
		     			value4 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-check-square-fill animate__animated animate__flipInY' viewBox='0 0 16 16'>"+
		     	                  "<path d='M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z'/>"+
		                    	  "</svg>";	  
		     		}
		     		if(result[0].choiceFno == 0){
		     			value5 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-plus-square' viewBox='0 0 16 16'>"+
		                        "<path d='M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z'/>"+
		                        "<path d='M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z'/>"+
		        	  			  "</svg>"+
		              		  "<a>저장하기</a>";
		     		}else{
		     			value5 += "<svg xmlns='http://www.w3.org/2000/svg' width='20' height='20' fill='currentColor' class='bi bi-check-square-fill animate__animated animate__flipInY' viewBox='0 0 16 16'>"+
					              "<path d='M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm10.03 4.97a.75.75 0 0 1 .011 1.05l-3.992 4.99a.75.75 0 0 1-1.08.02L4.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093 3.473-4.425a.75.75 0 0 1 1.08-.022z'/>"+
			    			      "</svg>"+   
								  "<a>저장됨</a>";
		     		}
		     		
		         	jb1("#modal-likeCount2").html(value);
		         	jb1("#myChoiceModal").html(value2);
		         	hearticon.empty();
		         	storeicon.empty();
		         	checkstore.empty();
		        	feedContent.empty();
		           	feedhash.empty();
		         	hearticon.append(value3);
		         	storeicon.append(value4);
		         	checkstore.append(value5);
		         	feedContent.append(value6);
		           	feedhash.append(value7);
           			if (result.length > 1) {
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
	       	   }
	        });
	   }
   </script>
   <script>
	   const likeCount = (feedNo) => {
		    $.ajax({
		        url: '${contextPath}/mainFeed/likeCount',
		        data: { feedNo: feedNo },
		        method: 'post',
		        success: function (count) {
		        	 if (Array.isArray(count) && count.length > 0) {
		                 const likeCountValue = count[0].likeCount;
	
		                 let html = "회원님의 게시글을 " + likeCountValue + "명이 좋아합니다.";
		                 $("#modal-likeCount2").html(html);
		        }
		        }
		    });
		}; 
   
	   $(".clickable-svg-heart").click(function(){
	       if($(this).find('.bi-heart').length == 0){
	          var feedNo = $('#myfeedchoicemodal').val();
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
	    	  var feedNo = $('#myfeedchoicemodal').val();
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
	       }
	    })  
	    
	    $(".clickable-svg-store1").click(function(e){
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
		    var parentContainer = $('.clickable-svg-store1');
		    const svgElement = parentContainer.find("svg");
		    const aElement = parentContainer.find('a');
			    
           if($(this).find('.bi-check-square-fill').length != 0){
        	   var feedNo = $('#myfeedchoicemodal').val();	
           	 
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
        	   var feedNo = $('#myfeedchoicemodal').val();
               
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
   </script>
			   
</body>
</html>