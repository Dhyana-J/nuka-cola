<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>chatRooView</title>
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
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/chatRoomView.css" />
  </head>
  <body>
	<jsp:include page="../common/mainMenu.jsp" />
	
	<c:if test="${!empty alertMsg }">
	      <script>
	        alert("${alertMsg}");
	      </script>
	      <c:remove var="alertMsg" scope="session" />
	</c:if>

    <!-- 컨텐츠 -->
    <main class="content__section">
      <div class="inner">
        <div class="section__left">
          <div class="section__left__messageInfo">
            <div class="left__messageTitle">
              <strong>메세지</strong>
            </div>
            <div class="left__messageIcon">
				<img class="circle" src="resources/assets/conn.png" alt="img">
            </div>
          </div>
          <div class="section__left__userInfos">
            <div class="section__left__userInfo">
              <div class="left__userIcon">
               <c:choose>
				 <c:when test="${loginUser.userAvatar eq null }">
					<img class="circle" src="resources/assets/conn.png" alt="img">
				 </c:when>
			 	 <c:otherwise>
				 	<img class="circle" src="${pageContext.request.contextPath}/${following.userAvatar} " alt="img">
				 </c:otherwise>
			   </c:choose>
              </div>
              <div class="left__userDetailInfo">
                <div class="left__userName">
                  <strong>정길동</strong>
                </div>
                <div class="left__userChat">
                  <div class="left__userChat-sum">
                    <span>알겠습니다. 다음번에는...</span>
                  </div>
                  <div class="left__userChat-time">
                    <span>20.12.25</span>
                  </div>
                </div>
              </div>
            </div>

           

            <div class="section__left__userInfo">
              <div class="left__userIcon">
                <img src="../../assets/avatar.png" alt="" />
              </div>
              <div class="left__userDetailInfo">
                <div class="left__userName">
                  <strong>정길동</strong>
                </div>
                <div class="left__userChat">
                  <div class="left__userChat-sum">
                    <span>알겠습니다. 다음번에는...</span>
                  </div>
                  <div class="left__userChat-time">
                    <span>20.12.25</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="section__mid">
          <div class="section__mid__time">
            <strong>2020.11월.25수요일</strong>
          </div>
          <div class="section__mid__message-multiBox">


            <div class="mid__right-messageBox">
              <div class="right-messageBox-text">
                저 팀있어요 죄송합니다. 담에 같이해요
              </div>
              <div class="right-messageBox-date">
                <span>오후 1:25</span>
              </div>
            </div>

              <div class="mid__left-messageBox">
                <div class="left-messageBox-date">
                    <span>오후 1:25</span>
                  </div>
                <div class="left-messageBox-text">
                  저 팀있어요 죄송합니다. 담에 같이해요
                </div>

              </div>

              <div class="mid__right-messageBox">
                <div class="right-messageBox-text">
                  저 팀있어요 죄송합니다. 담에 같이해요
                </div>
                <div class="right-messageBox-date">
                  <span>오후 1:25</span>
                </div>
              </div>

              <div class="mid__left-messageBox">
                <div class="left-messageBox-date">
                    <span>오후 1:25</span>
                  </div>
                <div class="left-messageBox-text">
                  저 팀있어요 죄송합니다. 담에 같이해요
                </div>

              </div>

              <div class="mid__right-messageBox">
                <div class="right-messageBox-text">
                  저 팀있어요 죄송합니다. 담에 같이해요
                </div>
                <div class="right-messageBox-date">
                  <span>오후 1:25</span>
                </div>
              </div>


            </div>
            <div class="section__mid__message-writingBox">
                <textarea class="mid__message-writingBox">내용을 입력해주세요</textarea>
            </div>
            <div class="section__mid__mesage-sendBtn">
                <button class="btn">보내기</button>
            </div>
          </div>
          <div class="section__right">
              <div class="section__right__userProfile">
                  <div class="right__userProfile-img">
                      <img src="../../assets/avatar.png" alt="">
                  </div>
                  <div class="right__userProfile__name">
                      <strong>정길동</strong>
                  </div>
                  <div class="right__userProfile__school">
                      <strong>서울대학교 컴퓨터공학부 전공</strong>
                  </div>
                  <div class="right__userProfile__carrer">
                      <strong>Google입사(2001.09~)</strong>
                  </div>
              </div>
          </div>
        </div>
        
      </div>
    </main>
  </body>
</html>
