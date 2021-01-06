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
        <div class="chat-list">
          <div class="chat-info__wrapper">
            <div class="img-wrapper">
              <img src="resources/assets/elon.jpg" alt="">
            </div>
            <div class="chat-info">
              <strong>홍길동</strong>
              <span>대표님, 3억짜리 프로젝...</span>
            </div>
            <div class="chat-date">
              <span>2020.11.11</span>
            </div>
          </div><!--chat-info__wrapper-->
          <div class="chat-info__wrapper">
            <div class="img-wrapper">
              <img src="resources/assets/elon.jpg" alt="">
            </div>
            <div class="chat-info">
              <strong>홍길동</strong>
              <span>대표님, 3억짜리 프로젝...</span>
            </div>
            <div class="chat-date">
              <span>2020.11.11</span>
            </div>
          </div><!--chat-info__wrapper-->
          <div class="chat-info__wrapper">
            <div class="img-wrapper">
              <img src="resources/assets/elon.jpg" alt="">
            </div>
            <div class="chat-info">
              <strong>홍길동</strong>
              <span>대표님, 3억짜리 프로젝...</span>
            </div>
            <div class="chat-date">
              <span>2020.11.11</span>
            </div>
          </div><!--chat-info__wrapper-->
          <div class="chat-info__wrapper">
            <div class="img-wrapper">
              <img src="resources/assets/elon.jpg" alt="">
            </div>
            <div class="chat-info">
              <strong>홍길동</strong>
              <span>대표님, 3억짜리 프로젝...</span>
            </div>
            <div class="chat-date">
              <span>2020.11.11</span>
            </div>
          </div><!--chat-info__wrapper-->
          
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
          <img src="resources/assets/conn.png" alt="">
        </div>
        <div class="profile-info">
          <strong>Conn</strong>
          <span>MIT DeepLearning Lab</span>
          <span>@Nuka-cola Inc.(2020.11 ~)</span>
        </div>
      </div><!--chatroom-search__right-section-->
    </div>
  </main>

  <jsp:include page="../common/footer.jsp"/>
</body>
</html>