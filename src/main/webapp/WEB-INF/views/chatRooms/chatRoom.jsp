<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CHATROOMVIEW-SEARCH</title>
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
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      />
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/chatRoom/chatRoomView.css">
</head>
<body>
  <!-- 메뉴바 -->
  <jsp:include page="../common/mainMenu.jsp"/>

  <main class="chatroom-search__wrapper">

    <div class="chatroom_search__directory">
      <span>홈 / 메세지</span>
    </div>
    <div class="inner">
      <div class="chatroom-search__left-section">

        <div class="left-section__header">
          <strong>메세지</strong>
        </div>
        <!-- 채팅 메세지하는 사람들 리스트 -->
        <div class="chat-list">
        
			
          
        </div>
      </div><!--chatroom-search__left-section-->

      <div class="chatroom-search__mid-section">


        <div class="searching-box hidden-box">

          <div class="mid-section__header">
            <strong>대화 상대 검색</strong>
            <div class="search-bar__wrapper">
              <span class="material-icons">search</span>
              <input type="text">
            </div>
          </div>
          <div class="search-list">
            <div class="user-info__wrapper">
              <div class="img-wrapper">
                <img src="resources/assets/elon.jpg" alt="">
              </div>
              <div class="user-info">
                <strong>홍길동</strong>
                <span>MIT DeepLearning Lab</span>
                <span>@Tesla Inc.</span>
              </div>
            </div>
            <div class="user-info__wrapper">
              <div class="img-wrapper">
                <img src="resources/assets/elon.jpg" alt="">
              </div>
              <div class="user-info">
                <strong>홍길동</strong>
                <span>MIT DeepLearning Lab</span>
                <span>@Tesla Inc.</span>
              </div>
            </div>
            <div class="user-info__wrapper">
              <div class="img-wrapper">
                <img src="resources/assets/elon.jpg" alt="">
              </div>
              <div class="user-info">
                <strong>홍길동</strong>
                <span>MIT DeepLearning Lab</span>
                <span>@Tesla Inc.</span>
              </div>
            </div>
            <div class="user-info__wrapper">
              <div class="img-wrapper">
                <img src="resources/assets/elon.jpg" alt="">
              </div>
              <div class="user-info">
                <strong>홍길동</strong>
                <span>MIT DeepLearning Lab</span>
                <span>@Tesla Inc.</span>
              </div>
            </div>
            <div class="user-info__wrapper">
              <div class="img-wrapper">
                <img src="resources/assets/elon.jpg" alt="">
              </div>
              <div class="user-info">
                <strong>홍길동</strong>
                <span>MIT DeepLearning Lab</span>
                <span>@Tesla Inc.</span>
              </div>
            </div>
          </div><!--search-list-->

        </div><!--searching-box-->



        <div class="chatting-box ">

          <div class="main__section__left">
            <div class="chat">
                <div class="chat-header clearfix">
                    <div class="chat-about">
                        <div class="chat-with">대화</div>
                    </div>
                    <div class="search-btn">
                      <span class="material-icons">close</span>
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
          </div><!--main__section__left-->
        </div><!--chatting-box-->
       
          
      </div><!--chatroom-search__mid-section-->

      <div class="chatroom-search__right-section">
        <div class="profile-thumb">
          <img src=" ${loginUser.userAvatar eq null ? 'resources/assets/conn.png' : loginUser.userAvatar} " alt="">
        </div>
        <div class="profile-info">
          <strong>${ loginUser.userName }</strong>
          
          <c:choose>
          
               <c:when test="${loginUser.userPosi eq '0' }">
                  <span>기획자</span>
               </c:when>
               
               <c:when test="${loginUser.userPosi eq '1' }">
                   <span>개발자</span>
               </c:when>
               
		       <c:when test="${loginUser.userPosi eq '2' }">
		           <span>디자이너</span>
				</c:when>
               
           </c:choose>
     
          <span>${ loginUser.email }</span>
        </div>
      </div><!--chatroom-search__right-section-->
    </div>
  </main>

  <jsp:include page="../common/footer.jsp"/>
</body>



<script defer>


const selectChatRoomList = ()=>{
	
	axios.get("selectChatRoomList.ch", {
		params : {
			userNo : ${loginUser.userNo}
		}
	})
	.then(function(response) {
		
		console.log(response.data);
		
		let chatList = response.data;
		
		for(var i in chatList) {
			
			
			if(chatList[i].userAvatar == null) {
				
				let userAvatars = "resources/assets/conn.png";
				
				createMessages(chatList[i].chatroomNo,chatList[i].userTwo,userAvatars,chatList[i].userName,chatList[i].messageContent,chatList[i].messageCreate);
				
			}else {
				
				createMessages(chatList[i].chatroomNo,chatList[i].userTwo,chatList[i].userAvatar,chatList[i].userName,chatList[i].messageContent,chatList[i].messageCreate);
				
			}

		}
				
	})
	.catch(function(error){
		console.log(error);
		
	})
}

selectChatRoomList();


const createMessages = (chatroomNo,userTwo,userAvatar,userName,messageContent,messageCreate) => {
	/* chat-info__wrapper 클래스 div생성 */
	let chatDivW = document.createElement("div");
	chatDivW.className = "chat-info__wrapper";
	
	/* 메세지 받는 사람 번호 추가 */
	let reciverNo = document.createElement("input");
	reciverNo.setAttribute("type", "hidden");
	reciverNo.setAttribute("value", userTwo);
	reciverNo.setAttribute("name", "userTwo");
	/* 채팅방 번호 추가 */
	let chatNo = document.createElement("input");
	chatNo.setAttribute("type", "hidden");
	chatNo.setAttribute("value", chatroomNo);
	chatNo.setAttribute("name", "chatroomNo");
	/* 넣어주기 */
	
	chatDivW.appendChild(reciverNo);
	chatDivW.appendChild(chatNo);
	
	
	/* img-wrapper 클래스 div생성 */
	let imgDiv = document.createElement("div");
	imgDiv.className = "img-wrapper";
	
	/* img 만들어주고, img-wrapper div에 넣어주기*/
	let imgThumb = document.createElement("img");
	imgThumb.setAttribute("src", userAvatar);
	
	imgDiv.appendChild(imgThumb);
	
	
	/* chat-info 클래스 div생성 */
	let chatDiv = document.createElement("div");
	chatDiv.className = "chat-info";
	
	/* 이름용 strong 태그 생성 및 넣어주기 */
	let thumbName = document.createElement("strong");
	thumbName.innerText = userName;
	
	/* 최신메세지 태그 생성 후 넣어주기 */
	let lastThumbMessage = document.createElement("span");
	lastThumbMessage.innerText = messageContent;
	
	chatDiv.appendChild(thumbName);
	chatDiv.appendChild(lastThumbMessage);
	
	/* chat-date 클래스 div생성 */
	let dateDiv = document.createElement("div");
	dateDiv.className = "chat-date";
	
	/* 메세지 보낸시간 요소 넣어주기 */
	let lastMessageTime = document.createElement("span");
	lastMessageTime.innerText = messageCreate;
	
	dateDiv.appendChild(lastMessageTime);
	
	
	/* 3div chatDivW에 넣어주기 */
	chatDivW.appendChild(imgDiv);
	chatDivW.appendChild(chatDiv);
	chatDivW.appendChild(dateDiv);
	
	document.querySelector(".chat-list").appendChild(chatDivW);
	
}



</script>



</html>