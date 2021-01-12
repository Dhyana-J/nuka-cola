<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>COMPANY PROFILE</title>
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
    <link rel="stylesheet" href="resources/css/profile/profile(member).css" />
    <link rel="stylesheet" href="resources/css/profile/profile(member-modal).css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script defer src="resources/js/company/load-more-member.js"></script>
    <script defer src="resources/js/company/search-comp-member.js"></script>
  </head>
  <body>
  
    <jsp:include page="../common/mainMenu.jsp"/>
    
    <section class="visual__section">
    
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="${ c.compLogo }" alt="logo" />
          </div>
          <div>
            <div class="main__info">
              <strong>${ c.compName }</strong>
              <span>Since ${ c.compBirth }</span>
              <span>${ c.headCount }</span>
              <span>${ c.compEmail }</span>
            </div>
            <ul class="people__info">
              <li>팔로우 <strong>102</strong></li>
              <li>채용중인글 <strong>3</strong></li>
            </ul>
          </div>
        </div>
        <button class="btn visual__right" id="add__member__open">
          구성원 추가
        </button>
      </div>
      
    </section>
    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li onclick='location.href="profileMain.co?cno=${c.compNo}"'>ABOUT</li>
            <li  onclick='location.href="recruit.co?cno=${c.compNo}"'>채용</li>
            <li class="nav-active"><a href="profileMember.co?currentPage=1&cno=${c.compNo }">구성원</a></li>
          </ul>
        </div>
        <div class="main__main__section">
            <div class="main__section__left">
                <div class="content__wrapper">
                  <ul class="left__info">
                    <li><a href="#"><strong>TOP</strong></a></li>
                    <li><a href="#">구성원</a></li>
                  </ul>
                </div>
              </div>
          <div class="main__section__right">
            <div class="content__wrapper">

              <!-- 주요인물 -->
              <div class="main_character">
                <div class="main_character__left">
                    <h2>대표</h2>
                    <div class="charater__info">
                      <div class="member__avatar">
	                        <c:choose>
	                      		<c:when test="${head.userAvatar eq null}">
			                        <img src="resources/assets/standard.png" alt="profile" />
	                      		</c:when>
	                      		<c:otherwise>
			                        <img src="${pageContext.request.contextPath}/${head.userAvatar}" alt="profile" />
	                      		</c:otherwise>
	                      	</c:choose>
                      </div>
                      <div class="member__info__list">
                        <ul class="member__info">
                            <li><strong>${head.userName}</strong></li>
                            <li>${head.userComp}</li>
                        </ul>
                      </div>
                    </div><!-- charater__info -->
                </div><!-- main_character__left -->
                <div class="main_character__right">
                  <h2>채용담당자</h2>
                  <div class="charater__info">
                    <div class="member__avatar">
                      	<c:choose>
                      		<c:when test="${head.userAvatar eq null}">
		                        <img src="resources/assets/standard.png" alt="profile" />
                      		</c:when>
                      		<c:otherwise>
		                        <img src="${pageContext.request.contextPath}/${head.userAvatar}" alt="profile" />
                      		</c:otherwise>
                      	</c:choose>
                    </div>
                    <div class="member__info__list">
                      <ul class="member__info">
                        <li><strong>${head.userName}</strong></li>
                        <li>${head.userComp}</li>
                      </ul>
                    </div>
                  </div><!-- charater__info -->
                </div><!-- main_character__right -->
              </div>


              <!-- 구성원 -->
              <div class="member">
                <h2>구성원</h2>
                  <div class="box member-box">
                  
                    <!-- 구성원 결과 for문 -->
                    <c:forEach var="member" items="${memberList}">
	                    <div class="charater__info">
	                      <div class="member__avatar">
	                      	<c:choose>
	                      		<c:when test="${member.userAvatar eq null}">
			                        <img src="resources/assets/standard.png" alt="profile" />
	                      		</c:when>
	                      		<c:otherwise>
			                        <img src="${pageContext.request.contextPath}/${member.userAvatar}" alt="profile" />
	                      		</c:otherwise>
	                      	</c:choose>
	                      </div>
	                      <div class="member__info__list">
	                        <ul class="member__info">
	                            <li><strong>${member.userName}</strong></li>
	                        	<li>${member.userComp}</li>
	                        </ul>
	                      </div><!-- member__info__list -->
	                    </div><!-- charater__info -->
                    </c:forEach>
                    <!-- 구성원 결과 for문 -->
                  
              </div>

			<!-- 현재페이지가 마지막페이지가 아닌 경우에만 more버튼 출력 -->
			<c:if test="${pi.currentPage < pi.maxPage}">
              <div class="member_btn">
              	<!-- 버튼 클릭될 때마다 loadMore 실행된다. 인자로 회사번호 넣어줘야함 -->
                <button class="btn" onclick="loadMore(${c.compNo})">more</button>
              </div>
			</c:if>
              
            </div>
          </div>

        </div>
      </div>
    </main>
    
    
    <!-- 구성원 추가 모달 -->
    <div class="modal hidden">
      <div class="modal__overlay"></div>
      <div class="modal__content">
      
          <form id="add-member" class="content__inner" action="addMember.co" method="get">
          	  <input type="hidden" name="cno" value="${c.compNo }">
              <div class="modal__title">
                  <h2>구성원 추가</h2>
              </div>
              <div class="email">
                  <p>이메일</p>
                  <input type="search" id="find-email">
              </div>
              <div class="modal__member__content">
                 <p class="no-result">이메일로 검색해보세요 :)</p>
              </div><!-- modal__member__content -->
              <div class="position">
                  <p>포지션</p>
                  <input type="text" list="posi-list" name="position" value="" placeholder="ex)CEO, 프론트엔드 개발 ...">
                  <datalist id="posi-list">
                  	<c:forEach var="position" items="${positionList}">
                  		<option value="${position }">
                  	</c:forEach>
                  </datalist>
              </div>
              <div class="button__box">
                  <button type="button" class="btn modal__close">close</button>
                  <button type="submit" class="btn btn-blue">추가</button>
              </div>
          </form>
          
      </div>
  </div>

  <script>
  
      window.onload = function() {
      
      function onClick() {
          const modal = document.querySelector(".modal");
          modal.classList.remove("hidden");
      }   
      function offClick() {
          const modal = document.querySelector(".modal");
          modal.classList.add("hidden");
      }

      document.getElementById('add__member__open').addEventListener('click', onClick);
      document.querySelector('.modal__close').addEventListener('click', offClick);

      };

    </script>

  <!-- 구성원 추가 모달 -->
  </body>
</html>
