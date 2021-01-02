<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply</title>
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
    <link rel="stylesheet" href="resources/css/recruit/apply-history.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../css/footer.css">
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

  <main class="apply-history__main-wrapper">
    <div class="inner">
      <div class="apply-history__title">
        <strong>지원 내역 조회</strong>
      </div>
      <div class="apply-history__contents">
        <div class="apply-history__left-sidebar">
          <div class="left-sidebar__item">
            <a href="#" class="left-sideber__viewing">진행 중인 지원정보 (${ applyCount })</a>
          </div>
          <div class="left-sidebar__item">
            <ul>
              <li><a href="#">서류 접수 (5)</a></li>
              <li><a href="#">서류 합격 (1)</a></li>
            </ul>
          </div>
          <div class="left-sidebar__item">
            <a href="#">마감된 채용 정보 (0)</a>
          </div>
              <div class="left-sidebar__item">
                <ul>
                  <li><a href="#">팀 합류 (0)</a></li>
                  <li><a href="#">탈락 (0)</a></li>
                </ul>
              </div>
        </div>
        <div class="apply-history__right-content">
          <div class="apply-history__sub-title">
            	진행 중인 지원정보 (${ applyCount })
          </div>
          <div class="apply-history__list">
         
           <c:forEach var="a" items="${applyList}">
            <div class="apply-info">
              <div class="apply-info__content">
                <div class="apply-info__recruit-info">
                  <span>${ a.recruitTitle }</span>
                
                <!-- 채용조건에 따른 조건문 -->  
                  <c:choose>
                  	<c:when test="${a.recruitRequ eq 0 }">
                  		<span>신입</span>
                  	</c:when>
                  	<c:when test="${a.recruitRequ eq 1 }">
                  		<span>경력</span>
                  	</c:when>
                  	<c:when test="${a.recruitRequ eq 2 }">
                  		<span>신입, 경력</span>
                  	</c:when>
                  </c:choose>
                  
                  <span>${ a.createdAt} 부터 채용을 시작했어요 </span>
                </div>
                
                <!-- 채용단계에 따른 조건문 -->
                <div class="apply-info__apply-state">
                  <c:choose>
                  	<c:when test="${a.applyProg eq 0}">
                  <div class="recruit-stage">
                    <span class="state-sign submit-state"></span>
                    <span>서류접수</span>
                  </div>
                  	</c:when>
                  	<c:when test="${a.applyProg eq 1}">
                  <div class="recruit-stage">
                    <span class="state-sign pass-state"></span>
                    <span>서류합격</span>
                  </div>
                  	</c:when>
                  	<c:when test="${a.applyProg eq 2}">
                  <div class="recruit-stage">
                    <span class="state-sign join-state"></span>
                    <span>팀 합류</span>
                  </div>
                  	</c:when>
                  	<c:when test="${a.applyProg eq 3}">
                  <div class="recruit-stage">
                    <span class="state-sign fail-state"></span>
                    <span>탈락</span>
                  </div>
                  	</c:when>
                  </c:choose>
                  
                  <span>${a.recruitDl} 에 채용 마감</span>
                  <span class="apply-state__apply-date">${a.appliedAt} 에 지원했어요</span>
                </div>
              </div>
              <div class="apply-info__btn">
                <form action="">
                  <input class="recruit-no" type="hidden" name="recruitNo" value="${a.recruitNo}">
                  <button type="submit" class="apply-cancel__btn">지원 취소</button>
                </form>
                <button type="button" class="apply-detail__btn"onclick="location.href='./recruit-detail.html'">
                  채용 정보 확인
                </button>
              </div>
            </div><!--apply-info-->
          </c:forEach>
            

          </div><!--apply-history__list-->
        </div>
      </div>
    </div><!--보라끝-->
  </main><!--빨강끝-->
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
	
  <script defer>
  
  // 지원취소 버튼 요청시 실행할 Axios
  document.querySelectorAll('.apply-cancel__btn').forEach((v,i)=>{
      console.log(v);
          v.addEventListener('click',()=>{

               let item = v.parentNode.parentNode;
               let rno = item.querySelector('.recruit-no').value;
               
               axios.get('delete.ap',{
                 params:{
                   userNo:${a.userNo},
                   recruitNo:rno
                 }
              })
              .then(function(){
              });
               let applyCount= document.querySelector('.apply-history__sub-title');
                let applyCountNum = applyCount.querySelector('div').innerText;
                applyCountNum=parseInt(applyCountNum);
                console.log(applyCountNum);
                applyCountNum = --applyCountNum;
                applyCountNum.innerText = applyCountNum;
                applyCount.querySelector('div').innerText = applyCountNum;
               item.remove(); 

            });
         });
  
  </script>
	
	
</body>
</html>