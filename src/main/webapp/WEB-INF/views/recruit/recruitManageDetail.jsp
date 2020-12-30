<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="resources/css/partner/partner.css"/>
    <!-- bootstrap -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>

	 <jsp:include page="../common/mainMenu.jsp"/>
	 
	 <header>
      <div class="inner">
        <div class="left__header">
          <div class="logo">
            <img src="../../assets/logo.png" alt="logo" />
          </div>
          <ul class="header__nav">
            <li class="header__nav-item">PARTNER</li>
            <li class="header__nav-item">COMPANY</li>
            <li class="header__nav-item">EMPLOYMENT</li>
          </ul>
        </div>
        <div class="right__header">
          <i class="material-icons">menu</i>
          <span>MENU</span>
        </div>
      </div>
    </header>
    <!-- 메뉴바 끝 -->

    <main class="recruit__manage-detail__main-wrapper">
      <div class="inner">

        <div class="recruit-title">
          <strong>데브캣 개발자 모집</strong>
        </div>

        <div class="recruit__contents-wrapper">

          <div class="recruit__sidebar">
            <div class="sidebar__item item1 color-stress">
              <span>지원자 (${ appliesCount })</span>
            </div>
            <div class="sidebar__item item2">
              <ul>
                <li>서류 접수(${a.applyProg})</li>
                <li>서류 합격(${a.applyProg})</li>
                <li>팀 합류(${a.applyProg})</li>
                <li>탈락(${a.applyProg})</li>
              </ul>
            </div>
            <div class="sidebar__item item3">
              <span>북마크한 사람(0)</span>
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
              <span>지원자 ${ applyCount }</span>
            </div>
            <div class="recruit__applier-list"><!--flex column-->
              <div class="recruit__applier-info"><!--flex row-->
                <div class="recruit__applier-profile">
                  <div class="applier-img">
                    <img src="../../assets/juckerbug.jpg" alt="image">
                  </div>
                  <div class="applier-name">
                    <span>Mark</span>
                  </div>
                </div>
                <div class="recruit__applier-state">
                  <div class="recruit__stage">
                    <span class="state-sign fail-state"></span>
                    <span id="applyProg">${a.applyProg}</span>
                  </div>
                  <div class="recruit__expire">
                    <span>${ r.recruitDl }에 만료됩니다.</span>
                  </div>
                  <div class="recruit__apply-date">
                    <span>${ a.createdAt }지원</span>
                  </div>
                </div> 
              </div><!--applier-info 끝-->
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