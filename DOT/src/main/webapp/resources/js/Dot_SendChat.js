$(function() {
	const socket = new SockJS('http://localhost:8083/dot/ws');
	const stompClient = Stomp.over(socket);
	
	stompClient.connect({}, frame => {
	    console.log('Connected: ' + frame);
	    stompClient.subscribe('/topic/chat/' + chatRoomNo, (message) => {
	    	
	    	console.log(message);
	    	console.log(chatRoomNo);
	    
	        const chatMessage = JSON.parse(message.body);
	    });
	});

	document.getElementById("chatSend").addEventListener('click', sendMessage);
	
	document.getElementById("inputChatting").addEventListener('keydown', event => {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	        sendMessage();
	    }
	});

	function sendMessage() {

		const inputChatting = document.getElementById("inputChatting");
		
		if(inputChatting.value.trim().length == 0) {
			
			alert("입력하신 채팅이 없습니다.");
			
			inputChatting.value = "";
			inputChatrring.focus();
			
		} else {
		
			const chatMessage = {
				"userNo" : userNo,
				"userNick" : userNick,
				"chatRoomNo" : chatRoomNo,
				"message" : inputChatting.value
			}
			
			// const parsedMessage = JSON.stringify(chatMessage);
			
			
			
			
			 // 메시지 보내기
		    stompClient.send('/chatRoomList', {}, JSON.stringify(chatMessage));
	
	
	
	
	
			const li = document.createElement("li");
    
		    const p = document.createElement("p");
		    p.classList.add("chat");
		
		    // 글 내용 추가 + 개행처리
		    p.innerHTML = chatMessage.message.replace(/\\n/gm, "<br/>");
		
		    const span = document.createElement("span");
		    span.classList.add("chatDate");
		    span.innerText = currentTime(); // 날짜 추가
		
		    // 내가 쓴 채팅 , 남이 쓴 채팅
		
		    if(chatMessage.userNo == userNo) {
		
		        li.classList.add("myChat"); // 내가 쓴 글
		        li.append(span, p);
		
		    } else {
		
		        li.innerHTML = "<b>" + chatMessage.userName + "</b><br>";
		        li.append(p, span);
		    }
		
		    // 채팅창
		    const display = document.getElementsByClassName("display-chatting")[0];
		
		    // 채팅창에 내용 추가
		    display.append(li);
		    
		    // 채팅창 아래로 내리기
		    display.scrollTop = display.scrollHeight;
			
			
			// 현재 시간 출력함수
			function currentTime() {
			
			    const now = new Date();
			    let time = "";
			
			    time = now.getFullYear() + "-" + addZero(now.getMonth() + 1) + "-" + addZero(now.getDate());
			
			    return time;
			}
			 
			function addZero(time) {
			    return time < 10 ? "0" + time : time;
			}
					
			
			inputChatting.value = "";
		}
	}
	
		
});
