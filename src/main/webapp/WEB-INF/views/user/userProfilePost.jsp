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
            <div class="avatar">
                <img src= "../../assets/profile.png" alt="logo">
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
            <!-- profile, post, list -->
              <div class="section__title">
                  <ul>
                      <li onclick='location.href="profile.me?userNo=${pUser.userNo}" '>PROFILE</li>
                      <li  onclick='location.href="profilePost.us?userNo=${pUser.userNo}" '>POST</li>
                      <li onClick='location.href="initFollowing.us?userNo=${pUser.userNo}"'>LIKE</li>
                  </ul>
              </div>
            <!-- profile, post, list -->

            <div class="content__wrapper">
              <div class="section__content__title">
                <img class="circle" src="../../assets/profile.png" alt="PROFILE">
                <div class="content__introduce">
                  <strong>방글이</strong>
                  <p>TESLA, SPACE X @ CEO</p>
                </div>
                    <div class="content__editandDelete">
                      <button class="btn-green">EDIT</button>
                      <button class="btn-red">DELETE</button>
                    </div>
              </div>
              <div class="sysdate">2020-10-20</div>
              <div class="just__text__dv">
                <span class="just__text">
                    누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다.
                     다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 
                     국가가 변호인을 붙인다.
                    모든 국민은 보건에 관하여 국가의 보호를 받는다. 
                    대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 
                    위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.
                    대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 
                    위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.
                  </span>
                </div>
                <div class="content__comment">
                  <span class="icono-comment"></span> <p>COMMENT</p>
                </div>

                <div class="section__content__right">
                  <i class="fas fa-heart"></i>&nbsp;  1
                </div>
            </div>

            <div class="content__wrapper">
              <div class="section__content__title">
                <img class="circle" src="../../assets/profile.png" alt="PROFILE">
                <div class="content__introduce">
                  <strong>방글이</strong>
                  <p>TESLA, SPACE X @ CEO</p>
                </div>
                    <div class="content__editandDelete">
                      <button class="btn-green">EDIT</button>
                      <button class="btn-red">DELETE</button>
                    </div>
              </div>
              <div class="sysdate">2020-10-20</div>
              <div class="just__text__dv">
                <span class="just__text">
                    누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다.
                     다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 
                     국가가 변호인을 붙인다.
                    모든 국민은 보건에 관하여 국가의 보호를 받는다. 
                    대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 
                    위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.
                    대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 
                    위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.
                  </span>
                </div>
                <div class="content__comment">
                  <span class="icono-comment"></span> <p>COMMENT</p>
                </div>

                <div class="section__content__right">
                  <i class="fas fa-heart"></i>&nbsp;  1
                </div>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <img class="circle" src="../../assets/profile.png" alt="PROFILE">
                <div class="content__introduce">
                  <strong>방글이</strong>
                  <p>TESLA, SPACE X @ CEO</p>
                </div>
                    <div class="content__editandDelete">
                      <button class="btn-green">EDIT</button>
                      <button class="btn-red">DELETE</button>
                    </div>
              </div>
              <div class="sysdate">2020-10-20</div>
              <div class="just__text__dv">
                <span class="just__text">
                    누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다.
                     다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 
                     국가가 변호인을 붙인다.
                    모든 국민은 보건에 관하여 국가의 보호를 받는다. 
                    대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 
                    위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.
                    대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 
                    위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.
                  </span>
                </div>
                <div class="content__comment">
                  <span class="icono-comment"></span> <p>COMMENT</p>
                </div>

                <div class="section__content__right">
                  <i class="fas fa-heart"></i>&nbsp;  1
                </div>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <img class="circle" src="../../assets/profile.png" alt="PROFILE">
                <div class="content__introduce">
                  <strong>방글이</strong>
                  <p>TESLA, SPACE X @ CEO</p>
                </div>
                    <div class="content__editandDelete">
                      <button class="btn-green">EDIT</button>
                      <button class="btn-red">DELETE</button>
                    </div>
              </div>
              <div class="sysdate">2020-10-20</div>
              <div class="just__text__dv">
                <span class="just__text">
                    누구든지 체포 또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다.
                     다만, 형사피고인이 스스로 변호인을 구할 수 없을 때에는 법률이 정하는 바에 의하여 
                     국가가 변호인을 붙인다.
                    모든 국민은 보건에 관하여 국가의 보호를 받는다. 
                    대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 
                    위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.
                    대통령은 법률에서 구체적으로 범위를 정하여 위임받은 사항과 법률을 집행하기 
                    위하여 필요한 사항에 관하여 대통령령을 발할 수 있다.
                  </span>
                </div>
                <div class="content__comment">
                  <span class="icono-comment"></span> <p>COMMENT</p>
                </div>

                <div class="section__content__right">
                  <i class="fas fa-heart"></i>&nbsp;  1
                </div>
            </div>


        </div>
        
 <jsp:include page="../common/footer.jsp"/>


</body>
</html>