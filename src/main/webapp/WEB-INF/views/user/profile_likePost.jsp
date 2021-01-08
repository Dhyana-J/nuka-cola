<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

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
    <link rel="stylesheet" href="resources/css/profile/profile__follow.css" />
    <link
      rel="stylesheet"
      href="resources/css/profile/profile__likePost.css"/>
      <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css" />
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-latest.js"
    ></script>
</head>
<body>
  <jsp:include page="../common/mainMenu.jsp"/> 
    <section class="visual__section">
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="../../assets/profile.png" alt="logo" />
          </div>
          <div>
            <div class="main__info">
               <input type="hidden" name="email" value="${pUser.email }" id="main-info-email" />
	           <input type="hidden" name="uno" value="${pUser.userNo }" id="main-info-userno" />
	           <strong>${ pUser.userName }</strong> <span>${ pUser.userComp }</span>
	           <span>Front-end Amazone AWS, github에 관심</span>
            </div>
            <ul class="people__info">
              <li>팔로잉 <strong>${ countFollowers ne null ? countFollowers : 0 }</strong></li>
              <li>팔로워 <strong>${ countFollowings ne null ? countFollowings : 0 }</strong></li>
              <li>연결 <strong>${ countConnections ne null ? countConnections : 0 }</strong></li>
            </ul>
          </div>
        </div>
        <button id="popup_open_btn"
        		class="btn visual__right"
        		onclick='location.href="list.ap?userNo=${pUsers.userNo}"'>지원이력</button>
      </div>
    </section>

    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li onclick='location.href="profile.me?userNo=${pUser.userNo}" '>PROFILE</li>
            <li  onclick='location.href="profilePost.us?userNo=${pUser.userNo}" '>POST</li>
            <li onClick='location.href="initFollowing.us?userNo=${pUser.userNo}"'>LIKE</li>
          </ul>
        </div>

        <div class="main__main__section">
          <div class="main__section__left">
            <div class="content__wrapper">
              <ul class="left__info">
                <li>TOP</li>
			    <li><a href="initFollowing.us?userNo=${loginUser.userNo }">팔로잉</a></li>
                <li><a href="initFollower.us?userNo=${loginUser.userNo }">팔로워</a></li>
                <li><a href="list.bk?userNo=${loginUser.userNo}">북마크</a></li>
                <li><a href="list.sub?userNo=${loginUser.userNo}">구독기업</a></li>
                <li><a href="profileLikePost.us?userNo=${loginUser.userNo }">좋아요게시물</a></li>
                <li><a href="initConnect.us?userNo=${loginUser.userNo }">연결</a></li>
              </ul>
            </div>
          </div>
          <div class="main__section__right">
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>좋아요 목록</strong>
              </div>
              <br />
              <span class="following__much"
                >&nbsp; <!-- <strong>3</strong> 개의 게시글-->
              </span>
              <div class="like__item-container">
                <!-- 아이템 -->
                <c:forEach var = "p" items="${plist}">
	                <div class="item__box">
	                  <div class="user_profile">
	                    <div class="user__avatar">
	                    	<c:choose>
			                <c:when test="${p.userAvatar eq null }">
	                      		<img src="../../assets/wonbin.jpeg" alt="" />
			                </c:when>
			                <c:otherwise>
				                <img src="${p.userAvatar }" alt="">
			                </c:otherwise>
			             </c:choose>
	                    </div>
	                    <div class="user__info">
	                      <b>${p.userName}</b>
							<c:choose>
								<c:when test="${p.compName eq null}">
									<span>소속없음</span>
								</c:when>
								<c:otherwise>
	                      			<span>${p.compName} @ CEO</span>
								</c:otherwise>
							</c:choose>                      
	                    </div>
	                  </div>
	                  <div class="img__wrapper">
	                  	 <c:choose>
			                <c:when test="${p.postImg eq null }">
	                    		<img src="../../assets/loginImage.jpg" alt="" />
			                </c:when>
			                <c:otherwise>
				                <img src="${p.postImg }" alt="">
			                </c:otherwise>
			             </c:choose>
	                  </div>
	                  <div class="content__box">
	                    <p>
	                      ${p.postContent}
	                    </p>
	                    <span>삭제</span>
	                  </div>
	                </div>
	             </c:forEach>
                
               
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    
   	
  </body>
</html>