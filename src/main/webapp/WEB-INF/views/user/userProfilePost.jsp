<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    
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
    <link rel="stylesheet" href="resources/css/profile/profile__post.css" />
    <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

</head>

<body>
    <jsp:include page="../common/mainMenu.jsp"/>
      <section class="visual__section">
        <div class="inner">
          <div class="visual__left">
            <div class="avatar"><c:choose>
                <c:when test= "${empty pUser.userAvatar}">
                	<img src="resources/assets/profile.png">
                </c:when>
                <c:otherwise>
                	<img src= "${pUser.userAvatar }" alt="logo">
                </c:otherwise>
              </c:choose>
                
            </div>
            <div>
              <div class="main__info">
	              <input type="hidden" name="email" value="${pUser.email }" id="main-info-email" />
	              <input type="hidden" class="userNo" name="uno" value="${pUser.userNo }" id="main-info-userno" />
	              <input type="hidden" class="loginUser" value="${loginUser.userNo}">
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
        		onclick='location.href="list.ap?userNo=${pUser.userNo}"'>지원이력</button>
        </div>
      </section>

      <main class="content__section">
          <div class="inner">
            <!-- profile, post, list -->
              <div class="section__title">
                  <ul>
                      <li onclick='location.href="profile.me?userNo=${pUser.userNo}" '>PROFILE</li>
                      <li  onclick='location.href="profilePost.us?userNo=${pUser.userNo}" '>POST</li>
                      <li onClick='location.href="initFollowing.us?userNo=${pUser.userNo}"'>LIKE</li>
                  </ul>
              </div>
            <!-- profile, post, list -->
			<c:forEach var = "p" items="${plist}">
            <div class="content__wrapper">
              <div class="section__content__title">
              <input type="hidden" class="pno"  value="${p.postNo}">
              <c:choose>
                <c:when test= "${empty p.userAvatar}">
                <img class="circle" src="resources/assets/conn.png" alt="PROFILE">
                </c:when>
                <c:otherwise>
                <img class="circle" src="${p.userAvatar}" alt="PROFILE">
                </c:otherwise>
              </c:choose>
                <div class="content__introduce">
                  <strong>${p.userName}</strong>
                  <p>${p.userComp }</p>
                </div>
                    <div class="content__editandDelete">
                      <c:if test = "${loginUser.userNo == p.userNo }">
	                      <button class="btn-green">EDIT</button>
	                      <button class="btn-red">DELETE</button>
                      </c:if>
                    </div>
                   
              </div>
              <div class="sysdate">${p.updatedAt}</div>
              <div class="just__text__dv">
              <!-- 수정시 보여질 form  --> 
                   <form  style= "display:none" action="postUpdate.us" method="post" class="post_form">
		              <textarea name="postContent" id="">${p.postContent}</textarea>
		              <input type="hidden"  name="postNo" value="${p.postNo}">
		              <input type="hidden" name="userNo" value="${pUser.userNo}">
		              <div class="post_form-btn-wrapper">
		                <button type="submit" class="btn btn-blue">수정</button>
		              </div>
		            </form>
                <span class="just__text">
                 ${p.postContent}
                </span>
                </div>
                <div class="content__comment">
                  <span class="icono-comment" ></span><p style="color:rgb(226, 229, 255)">COMMENT</p> 
                </div>
			<c:choose>
				<c:when test = "${p.isFollowing==0}">
                <div class="section__content__right">
                  <i class="fas fa-heart"></i>&nbsp;  <span>${p.isLiked}</span>
                </div>
                </c:when>
                <c:otherwise>
                <div class="section__content__right">
                  <i class="fas fa-heart" style="color:rgb(216, 92, 92)"></i>&nbsp;  <span>${p.isLiked}</span>
                </div>
                </c:otherwise>
            </c:choose>
            <ul class="post__comment_box">

            </ul>
            </div>

			</c:forEach>
			
			
	</div>
	</main>
        


 <script defer src="resources/js/profile/userProfilePost.js"></script>
 <script>
 
 </script>
</body>

</html>