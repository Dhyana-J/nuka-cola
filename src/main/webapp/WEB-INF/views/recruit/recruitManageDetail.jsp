<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Recruit</title>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="resources/css/recruit/recruit-manage-detail.css"/>
    <!-- bootstrap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

	 <jsp:include page="../common/mainMenu.jsp"/>
	 
    <!-- 메뉴바 끝 -->

    <main class="recruit__manage-detail__main-wrapper">
      <div class="inner">

        <div class="recruit-title">

          <strong>${manageList[0].recruitTitle}</strong>

        </div>

        <div class="recruit__contents-wrapper">

          <div class="recruit__sidebar">
            <div class="sidebar__item item1 color-stress">
              <span>지원자 (${ appliesCount })</span>
            </div>
            <div class="sidebar__item item2">
              <ul>           
                <li>서류 접수(${submitState})</li>
                <li>서류 합격(${passState})</li>
                <li>팀 합류(${joinState})</li>
                <li>탈락(${failState})</li>
              </ul>
            </div>
            <div class="sidebar__item item3">
              <span>북마크한 사람(${bookmarkCount})</span>
            </div>
            <div class="sidebar__item item4">
              <span>추천 인재(0)</span>
            </div>
            <div class="sidebar__item item5">
              <span>채용정보 확인</span>
            </div>
            <div class="sidebar__item item6">
              <span>채용정보 수정</span>
            </div>
          </div>
          <div class="recruit__content">
			
            <div class="recruit__content-title">
              <span>${manageList[0].recruitTitle}의 지원자는 총 ${ appliesCount }명 입니다</span>
            </div>
            <div class="recruit__applier-list"><!--flex column-->
            <c:forEach var="r" items="${ manageList }">
              <div class="recruit__applier-info"><!--flex row-->
                <div class="recruit__applier-profile">
                  <div class="applier-img">
                    <img src="resources/assets/juckerbug.jpg" alt="image">
                  </div>
                  <div class="applier-name">
                    <span>${r.userName }</span>
                  </div>
                </div>
                <div class="recruit__applier-state">
                
                 <c:choose>
                  	<c:when test="${r.applyProg eq 0}">
                  <div class="recruit-stage">
                    <span class="state-sign submit-state"></span>
                    <span>서류접수</span>
                  </div>
                  	</c:when>
                  	
                  	<c:when test="${r.applyProg eq 1}">
                  <div class="recruit-stage">
                    <span class="state-sign pass-state"></span>
                    <span>서류합격</span>
                  </div>
                  	</c:when>
                  	
                  	<c:when test="${r.applyProg eq 2}">
                  <div class="recruit-stage">
                    <span class="state-sign join-state"></span>
                    <span>팀 합류</span>
                  </div>
                  	</c:when>
                  	
                  	<c:when test="${r.applyProg eq 3}">
                  <div class="recruit-stage">
                    <span class="state-sign fail-state"></span>
                    <span>탈락</span>
                  </div>
                  	</c:when>
                  </c:choose>
                  
                  <div class="recruit__expire">
                    <span>${ r.recruitDl }일 후 마감</span>
                  </div>
                  <div class="recruit__apply-date">
                    <span>${ r.appliedAt } 지원</span>
                  </div>
                </div> 
              </div><!--applier-info 끝-->
              </c:forEach>
            </div><!--applier-list 끝-->
          </div>

        </div>

      </div><!--inner 끝-->
    </main>
    <footer class="common__footer">
      <div class="footer__left-area">
        <div class="footer__logo">
            <img src="../../assets/footer-logo.PNG" alt="logo">
        </div>
        <div class="footer__inc-info">
          <span>상호명 : 누카콜라</span>
          <span>공동대표 : 정찬복 유원근 손지원 성수지 배진원 이준호</span>
          <span>사업자등록번호 : 999-99-88282</span>
          <span>주소 : MountainView, CA, USA. Santa Clara Country</span>
          <span>이메일 : devcat123@gmail.com</span>
        </div>
      </div>
      <div class="footer__right-area">
        <div class="footer__icons">
          <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i>
          <i class="fa fa-instagram fa-2x" aria-hidden="true"></i>
          <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
        </div>
      </div>
    </footer>
	
</body>
</html>