<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="resources/css/profile/profile(member-modal).css" />
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/profile/profile(employ).css" />
  	    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>
  <body>
<jsp:include page="../common/mainMenu.jsp"/>
     <section class="visual__section">
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="../../assets/moomin.jpg" alt="logo" />
          </div>
          <div>
            <div class="main__info">
              <strong>RIDI BOOKS</strong>
              <span>Since 2017</span>
              <span>1003 명의 구성원</span>
              <span>Bookstore@gmail.com</span>
            </div>
            <ul class="people__info">
              <li>팔로우 <strong>102</strong></li>
              <li>채용중인글 <strong>3</strong></li>
            </ul>
          </div>
        </div>
        <button class="btn visual__right" id="add__member__open">구성원추가</button>
      </div>
    </section>
    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li onclick='location.href="profileMain.co?cno=${c.compNo}"'>ABOUT</li>
            <li class="nav-active" onclick='location.href="recruit.co?cno=${c.compNo}"'>채용</li>
            <li><a href="profileMember.co?cno=${c.compNo }&currentPage=1">구성원</a></li>
          </ul>
        </div>
        <div class="main__main__section">
            <div class="main__section__left">
                <div class="content__wrapper">
                  <ul class="left__info">
                    <li><a href="#"><strong>TOP</strong></a></li>
                    <li><a href="#employ__box__ing">진행중</a></li>
                    <li><a href="#employ__box__end">모집완료</a></li>
                  </ul>
                </div>
              </div>
          <div id ="employ__box__ing" class="main__section__right">
          <input type="hidden" class="pi1" value="${pi1.maxPage}">
          <input type="hidden" class="nowCno" value="${c.compNo}">
            <div class="employ__box__ing">
              <h2>진행중</h2>
              <!-- 진행중인 채용공고 for(문) -->
              <c:forEach var="rING" items="${rlist1}">
              <div class="content__wrapper">
	              <div class="content__left">
		              <input type="hidden" class="recruit-no" name="recruitNo" value="${rING.recruitNo}">
		                <ul class="employ__box__info">
		                  <li>${rING.compName}</li>
		                  <li><strong>${rING.recruitTitle}</strong></li>
		                  <c:if test="${rING.recruitRequ eq '0'}">
				                  <li>신입</li>
				          </c:if>
				          <c:if test="${rING.recruitRequ eq '1'}">
				                  <li>경력</li>
				          </c:if>
				          <c:if test="${rING.recruitRequ eq '2'}">
				                  <li>경력 신입</li>
				          </c:if>
		                </ul>
		                <div class="tag__box">
		                  <c:forEach var="skills" items="${skillMap.get(rING.recruitNo)}">
					             <span class="tag">${skills}</span>
						  </c:forEach>
		                </div>
		                <div class="date">
		                  <span>${rING.createdAt}</span>
		                </div>
		          </div>
		           <div class="content__right">

		           <button type="button" class="deadlineBtn">마감처리</button>

		           </div>
              </div>
			  </c:forEach>
              <!-- 진행중인 채용공고for문 -->

            </div>
            
              <div class="member_btn">
                <c:if test="${empty rlist1}">
                	<button class="more1 none_btn ">more</button>
	            </c:if>
	            <c:if test="${!empty rlist1}">
	              <button class="btn more1">more</button>
	            </c:if>
              </div>


            <div id ="employ__box__end" class="employ__box__end">
            <input type="hidden" class="pi2" value="${pi2.maxPage}">
              <h2>모집완료</h2>
              <!-- 모집완료한 채용공고 for문 -->
			  <c:forEach var="rEND" items="${rlist2}">
	              <div class="content__wrapper">
	              <input type="hidden" class="recruit-no" name="recruitNo" value="${rEND.recruitNo}">
	                <ul class="employ__box__info">
	                  <li>${rEND.compName}</li>
	                  <li><strong>${rEND.recruitTitle}</strong></li>
	                  <c:if test="${rEND.recruitRequ eq '0'}">
		                  <li>신입</li>
			          </c:if>
			          <c:if test="${rEND.recruitRequ eq '1'}">
			                  <li>경력</li>
			          </c:if>
			          <c:if test="${rEND.recruitRequ eq '2'}">
			                  <li>경력 신입</li>
			          </c:if>
		            </ul>
	                <div class="tag__box">
	                  <c:forEach var="skills" items="${skillMap.get(rEND.recruitNo)}">
			             <span class="tag">${skills}</span>
				  </c:forEach>
	                </div>
	                <div class="date">
	                  <span>${rEND.createdAt}</span>
	                </div>
	              </div>
			  </c:forEach>
              <!-- 진행완료인 채용공고 for문 -->


            </div>
              <div class="member_btn">
              <c:if test="${empty rlist2}">
               <button class="more2" style="display:none">more</button>
              </c:if>
              <c:if test="${!empty rlist2}">
              <button class="btn more2">more</button>
              </c:if>
              </div>
          </div>
        </div>

        </div>
      </div>
    </main>

    <!-- 구성원 추가 모달 -->
    <div class="modal hidden">
      <div class="modal__overlay"></div>
      <div class="modal__content">
          <form class="content__inner">
              <div class="modal__title">
                  <h2>구성원 추가</h2>
              </div>
              <div class="email">
                  <p>이메일</p>
                  <input type="search">
              </div>
              <div class="modal__member__content">
                <!-- 기업의 구성원 for문 -->
                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox">
                      </div>
                  </div>
                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" >
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" >
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" >
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox">
                      </div>
                  </div>
                <!-- 기업의 구성원 for문 -->
              </div>
              <div class="position">
                  <p>직책</p>
                  <input type="search">
              </div>
              <div class="button__box">
                  <button type="button" class="btn modal__close">close</button>
                  <button type="submit" class="btn btn-blue">추가</button>
              </div>
          </form>
      </div>
  </div>
  <script defer src="resources/js/profile/profile(member-modal).js"></script>
  <script defer src="resources/js/profile/profile-recruit.js"></script>


  <!-- 구성원 추가 모달 -->
  <jsp:include page="../common/footer.jsp"/>
  </body>
  
</html>
