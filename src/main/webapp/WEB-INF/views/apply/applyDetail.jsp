<%--
  Created by IntelliJ IDEA.
  User: yhg03
  Date: 2021-01-03
  Time: 오후 6:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>recruit-interview</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
            integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
            crossorigin="anonymous"
    />
    <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/recruit/apply-detail.css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<body>

<jsp:include page="../common/mainMenu.jsp"/>
<main class="content__section">
    <div class="inner">
        <h5><strong>${a.userName}님</strong> 의 <strong>${a.recruitTitle}공고</strong> 지원정보</h5>
        <div class="main__section">
            <div class="main__section__right">
                <div class="progress__wrap">
                    <c:if test="${loginUser.userNo ne a.manager1No and loginUser.userNo ne a.manager2No}">
                        <ol class="progress progress--large">
                            <c:choose>
                                <c:when test="${a.applyProg eq 0}">
                                    <li class="is-active" data-step="1" >서류접수</li>
                                    <li class="" data-step="2"  >서류합격</li>
                                    <li class="" data-step="3">팀합류</li>
                                    <li data-step="4" class="">탈락</li>
                                </c:when>
                                <c:when test="${a.applyProg eq 1}">
                                    <li class="is-complete" data-step="1" >서류접수</li>
                                    <li class="is-active" data-step="2" >서류합격</li>
                                    <li class="" data-step="3">팀합류</li>
                                    <li data-step="4" class="">탈락</li>
                                </c:when>
                                <c:when test="${a.applyProg eq 2}">
                                    <li class="is-complete" data-step="1" >서류접수</li>
                                    <li class="is-complete" data-step="2" >서류합격</li>
                                    <li class="is-active" data-step="3">팀합류</li>
                                    <li data-step="4" class="">탈락</li>
                                </c:when>
                                <c:when test="${a.applyProg eq 3}">
                                    <li class="is-failed1" data-step="1" >서류접수</li>
                                    <li class="is-failed1" data-step="2">서류합격</li>
                                    <li class="is-failed1" data-step="3">팀합류</li>
                                    <li data-step="4" class="is-failed">탈락</li>
                                </c:when>
                            </c:choose>
                        </ol>
                    </c:if>
                    <c:if test="${not empty loginUser}">
                        <c:if test="${loginUser.userNo eq a.manager1No or loginUser.userNo eq a.manager2No}">
                            <ol class="progress progress--large">
                                <c:choose>
                                    <c:when test="${a.applyProg eq 0}">
                                        <li class="is-active" data-step="1" onclick="onChangeProgress(0)">서류접수</li>
                                        <li class="" data-step="2"  onclick="onChangeProgress(1)">서류합격</li>
                                        <li class="" data-step="3" onclick="onChangeProgress(2)">팀합류</li>
                                        <li data-step="4" class="" onclick="onChangeProgress(3)">탈락</li>
                                    </c:when>
                                    <c:when test="${a.applyProg eq 1}">
                                        <li class="is-complete" data-step="1" onclick="onChangeProgress(0)">서류접수</li>
                                        <li class="is-active" data-step="2" onclick="onChangeProgress(1)">서류합격</li>
                                        <li class="" data-step="3" onclick="onChangeProgress(2)">팀합류</li>
                                        <li data-step="4" class="" onclick="onChangeProgress(3)">탈락</li>
                                    </c:when>
                                    <c:when test="${a.applyProg eq 2}">
                                        <li class="is-complete" data-step="1" onclick="onChangeProgress(0)">서류접수</li>
                                        <li class="is-complete" data-step="2" onclick="onChangeProgress(1)">서류합격</li>
                                        <li class="is-active" data-step="3" onclick="onChangeProgress(2)">팀합류</li>
                                        <li data-step="4" class="" onclick="onChangeProgress(3)">탈락</li>
                                    </c:when>
                                    <c:when test="${a.applyProg eq 3}">
                                        <li class="is-failed1" data-step="1" onclick="onChangeProgress(0)">서류접수</li>
                                        <li class="is-failed1" data-step="2" onclick="onChangeProgress(1)">서류합격</li>
                                        <li class="is-failed1" data-step="3" onclick="onChangeProgress(2)">팀합류</li>
                                        <li data-step="4" class="is-failed" onclick="onChangeProgress(3)">탈락</li>
                                    </c:when>
                                </c:choose>
                            </ol>
                            <p>클릭시 단계가 바뀝니다.</p>
                        </c:if>
                    </c:if>
                </div>

                <div class="content__wrap">
                    <strong>취업을 위한 한마디</strong>
                    <div class="content__edu-detail">
                        <span>${a.applyComment}</span>
                    </div>
                </div>

                <div class="content__wrap">
                    <strong>경력</strong>
                </div>

                <div class="content__wrap">
                    <strong>학력</strong>
                    <div class="content__edu-detail">
                        <span>${a.userEdu}</span>
                    </div>
                </div>

                <div class="content__wrap">
                    <strong>활동 분야</strong>
                    <ul class="content__usigTech-list">
                        <c:forEach var="i" items="#{s}">
                            <li>${i.skillName}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="main__section__left">
                <div class="chat">
                    <div class="chat-header clearfix">
                        <div class="chat-about">
                            <div class="chat-with">채용상담</div>
                        </div>
                    </div>
                    <!-- end chat-header -->

                    <div class="chat-history">
                    
						<ul id="chat-all">
						
						</ul>
						
                    </div>
                    <!-- end chat-history -->

                    <div class="chat-message clearfix">
                <textarea
                        name="message-to-send"
                        id="message-to-send"
                        placeholder="메시지를 입력해 주세요"
                        rows="3"
                ></textarea>

                        <button type="button" id="send-btn">Send</button>
                    </div>
                    <!-- end chat-message -->
                </div>
                <!-- end chat -->
            </div>
        </div>
    </div>
</main>
</body>
<script defer>
	
	/* 메세지 보낸 사람 */
	let sendingUser = "";
	/* 메세지의 상태 */
	let stateNo = 0;
	
	
	
    const onChangeProgress = (number)=>{
        console.log(number)
        location.href = 'changeprog.ap?rno=${a.applyNo}&number='+number

    }
    
	let sock = new SockJS("http://localhost:8888/nukacola/echo/");
	
	// 메시지 전송
	let sendMessage = ()=>{
		
		let sendingMessage = document.querySelector("#message-to-send").value;
		
		if(${loginUser.userNo eq a.userNo}){
		
			sendingUser = ${a.userNo};
			
			insertingMessage(sendingUser, stateNo, sendingMessage);	
			
			
			
		}else if(${loginUser.userNo eq a.manager1No}) {
		
			sendingUser = ${a.manager1No};
			
			stateNo = 1;
			
			insertingMessage(sendingUser, stateNo, sendingMessage);	
			
		}else if(${loginUser.userNo eq a.manager2No}) {
			
			sendingUser = ${a.manager2No};
			
			stateNo = 1;
			
			insertingMessage(sendingUser, stateNo, sendingMessage);	
		}
		
	}
	
	// 서버로부터 메시지를 받았을 때
	let onMessage = (msg)=>{
	    let data = msg.data;
	    //document.querySelector('#chat-history').innerHTML+=data+"<br/>";
	    console.log(msg);
	    console.log(msg.data);
	}
	
	// 서버와 연결을 끊었을 때
	let onClose = (evt)=>{
	    //document.querySelector('#messageArea').append('연결 끊김');
	    console.log("끊어짐");
	}
	
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	
	document.querySelector('#send-btn').addEventListener('click',()=>{
		
		sendMessage();

	})
	

    const insertingMessage = (sendingUser, stateNo, sendingMessage) => {
		
		axios.get("insertingMessage.ap",{
			params:{
				applyNo : ${a.applyNo},
				counselUser : sendingUser,
				counselState : stateNo,
				counselContent : sendingMessage
			}
		})
		   .then(function(response){
			   console.log(response);
			   
			   document.querySelector("#message-to-send").value = "";
			   
			   selectMessageList();
			   
			   sock.send(selectMessageList());
			   
		   })
		   .catch(function(error) {
			   console.log(error)
		   })
	}
    
    
    const selectMessageList = () => {
    	
    	axios.get("selectMessageList.ap",{
    		params : {
    			applyNo : ${a.applyNo}
    		}
    	})
    		.then(function(response){
    			console.log(response.data);	
    			
    			let messageList = response.data;
    			
    			
    			for(var i in messageList) {
    				
    				if(messageList[i].counselState == 1) {
    					
    					
    					leftMessage(messageList[i].counselContent,messageList[i].createdAt,messageList[i].userName);
    					
    					
    					
    				}else {
    					
    					rightMessage(messageList[i].counselContent,messageList[i].createdAt,messageList[i].userName);
    					
    				
    				}
    			}
    			
    			
    			
    			
    			
    		})
    		.catch(function(error){
    			console.log(error);
    		})
    }
    
    selectMessageList();
    
    
    
    const rightMessage = (counselContent, createdAt,userName,messagesAll) =>{
    	/* li생성 */
    	let rightLi = document.createElement("li");
    	/* 클래스 이름 추가 */
    	rightLi.className = "clearfix";
    	
    	/* li 자식요소가 될div1 생성 */
    	let rightDiv1 = document.createElement("div");
    	rightDiv1.className = "message-data align-right";
    	
    	/*div1의 자식요소가 될 span1 생성  */
    	let timeSpan = document.createElement("span");
    	timeSpan.className = "message-data-time";
    	timeSpan.innerHTML = createdAt + "&nbsp; &nbsp;";
    	
    	/*div1의 자식요소가 될 span2 생성  */
    	let nameSpan = document.createElement("span");
    	nameSpan.className = "message-data-name";
    	nameSpan.innerText = userName;
	
    	/*div1에 자식요소 span 추가  */
    	rightDiv1.appendChild(timeSpan);
    	rightDiv1.appendChild(nameSpan);

    	/* li 자식요소가 될div2 생성 */
    	let rightDiv2 = document.createElement("div");
    	rightDiv2.className = "message other-message float-right";
    	rightDiv2.innerText = counselContent;
    	
    	/* li요소에 div자식으로 추가 */
    	rightLi.appendChild(rightDiv1);
    	rightLi.appendChild(rightDiv2);
    	
    	
    	document.getElementById("chat-all").appendChild(rightLi);
    	
    	
    }
    
    const leftMessage = (counselContent, createdAt,userName,messagesAll) => {
    	
    	/* li생성 */
    	let leftLi = document.createElement("li");
  	
    	/* li 자식요소가 될div1 생성 */
    	let leftDiv1 = document.createElement("div");
    	leftDiv1.className = "message-data";
    	
    	/*div1의 자식요소가 될 span1 생성  */
    	let timeSpan = document.createElement("span");
    	timeSpan.className = "message-data-time";
    	timeSpan.innerText = createdAt;
    	
    	/*div1의 자식요소가 될 span2 생성  */
    	let nameSpan = document.createElement("span");
    	nameSpan.className = "message-data-name	";
    	nameSpan.innerText = userName;
	
    	/*div1에 자식요소 span 추가  */
    	leftDiv1.appendChild(nameSpan);
    	leftDiv1.appendChild(timeSpan);

    	/* li 자식요소가 될div2 생성 */
    	let leftDiv2 = document.createElement("div");
    	leftDiv2.className = "message my-message";
    	leftDiv2.innerText = counselContent;
    	
    	/* li요소에 div자식으로 추가 */
    	leftLi.appendChild(leftDiv1);
    	leftLi.appendChild(leftDiv2);
    	
    	document.getElementById("chat-all").appendChild(leftLi);
    	
    	
    }
    

</script>
</html>
