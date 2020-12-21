<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
    <link rel="stylesheet" href="resources/css/profile/profile(script-company).css" />
    <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
     <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
                <strong>방글이</strong>
                <span>Apple.Inc</span>
                <span>Front-end Amazone AWS, github에 관심</span>
              </div>
              <ul class="people__info">
                <li>팔로잉 <strong>102</strong></li>
                <li>팔로워 <strong>502</strong></li>
                <li>연결 <strong>102</strong></li>
              </ul>
            </div>
          </div>
          <button id="popup_open_btn" class="btn visual__right">지원이력</button>
        </div>
      </section>

      <main class="content__section">
          <div class="inner">
              <div class="section__title">
                  <ul>
                      <li>PROFILE</li>
                      <li>POST</li>
                      <li class="nav-active">LIKE</li>
                  </ul>
              </div>
              
              <div class="main__main__section">
                <div class="main__section__left">
                    <div class="content__wrapper">
                      <ul class="left__info">
                        <li>TOP</li>
                        <li>팔로잉</li>
                        <li>팔로워</li>
                        <li>북마크</li>
                        <li onClick='location.href="insert.sub?uno=${loginUser.userNo}"'>구독기업</li>
                        <li>좋아요게시물</li>
                        <li>연결</li>
                      </ul>
                    </div>
                </div>
                <div class="main__section__right">
                    
                    
                  <div class="content__wrapper">
                    <div class="section__content__title">
                        <strong>구독기업</strong>
                      </div><br>
                          <span class="following__much">&nbsp;
                            <strong>${csCount}</strong>개의 공고
                          </span>
                    <br><br>
                    	<c:forEach var="cs" items="${cslist}">
                          <div class="script__company__box" onclick='location.href="profileMain.co?cno=${cs.compNo}"'>
                            <div class="company__box__left">
                                <div class="company__img__box">
                                <img src="resources/assets/${cs.compLogo}" alt="">
                                </div>
                                <ul>
                                    <li class="company__info__title">${cs.compName}<span>구성원수[${cs.compHeadcount}]&nbsp;&nbsp;Sinece${cs.compBirth}</span> </li>
                                    <li>${cs.compInfo}</li>
                                </ul>
                            </div>
                            <div class="company__box__right">
                                <span onclick= "CSdeleteBtn(${cs.compNo},${cs.userNo});">삭제</span>
                            </div>

                          </div>

                   	 </c:forEach>
                   	<c:if test="${empty cslist}">
						
	                </c:if>
	                <c:if test="${!empty cslist && csCount>pi.boardLimit}}">
						<div class="more">
		                  <button class="btn" id="moreBtn" onclick="moreList(${loginUser.userNo},${pi.currentPage});">more</button>
		                </div>
	                </c:if>




                   </div>
                </div>
              </div>
            </div>


            <script der>
            
            
            
            if(${pi.currentPage== pi.maxPage}){
  			let moreBtn = document.querySelector('#moreBtn');
  			moreBtn.setAttribute('disabled',true);
  				
  		    }

            function CSdeleteBtn(cs,uno){
           	 console.log(cs);
           	 console.log(uno);
           	 axios.get('delete.sub',{
           		 params:{
           			 userNo:uno,
           			 compNo:cs,
           		 }
           	 })
           	 .then(function(){
           		 alert("구독이 취소 되었습니다.");
           		 location.href="list.sub?uno="+uno;
           	 })
           	 
           }


            </script>

          </main>
          
          <jsp:include page="../common/footer.jsp"/>
</body>
</html>