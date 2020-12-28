<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script defer src="resources/js/company/search-comp-member.js"></script>
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/company.css" />
    <link rel="stylesheet" href="resources/css/profile/profile(member-modal).css" />
  </head>
  <body>
 
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
        <button class="btn visual__right" id="add__member__open">
          구성원 추가
        </button>
      </div>
    </section>

    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li class="nav-active">ABOUT</li>
            <li>채용</li>
            <li><a href="profileMember.co?cno=${company.compNo }&currentPage=1">구성원</a></li>
          </ul>
        </div>
        <div class="content__wrapper">
          <div class="section__content__title">
            <strong>기업 소개</strong>
            <div class="edit__field">
              <i class="material-icons">create</i>
            </div>
          </div>
          <span class="just__text">
            안녕하세요? <br />
            리디북스입니다^ㅡㅡ^
          </span>
        </div>
        <div class="main__main__section">
          <div class="main__section__left">
            <div class="content__wrapper">
              <ul class="left__info">
                <li>TOP</li>
                <li>기업소개</li>
                <li><strong>산업분야</strong></li>
                <li>테크스택</li>
                <li>지역</li>
                <li>구성원</li>
              </ul>
            </div>
          </div>
          <div class="main__section__right">
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>산업분야</strong>
                <div class="edit__field">
                  <i class="material-icons">create</i>
                </div>
              </div>
              <div class="section__content__box">
                <span class="compindus__box">웹서비스</span>
                <span class="compindus__box">머신런닝</span>
                <span class="compindus__box">핀테크</span>
              </div>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>테크스택</strong>
                <div class="edit__field">
                  <i class="material-icons">create</i>
                </div>
              </div>
              <span class="techstack__sort">FRONT-END</span>
              <div class="section__content__box">
                <span class="front-end__box">Node.js</span>
                <span class="front-end__box">React.js</span>
                <span class="front-end__box">Redux</span>
                <span class="front-end__box">CSSinJS</span>
              </div>
              <span class="techstack__sort">BACK-END</span>
              <div class="section__content__box">
                <span class="back-end__box">Node.js</span>
                <span class="back-end__box">Express.js</span>
                <span class="back-end__box">MySQL</span>
              </div>
              <span class="techstack__sort">DEV_OPS</span>
              <div class="section__content__box">
                <span class="dev-ops__box">EC2</span>
                <span class="dev-ops__box">JEST</span>
                <span class="dev-ops__box">Docker</span>
              </div>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>지역</strong>
                <div class="edit__field">
                  <i class="material-icons">create</i>
                </div>
              </div>
              <span class="just__text">
                서울시 서초구 누카빌딩 콜라센터1F
              </span>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>구성원</strong>
              </div>
              <div class="section__member">
                <div class="content__profile">
                  <img
                    class="circle"
                    src="../../assets/juckerbug.jpg"
                    alt="PROFILE"
                  />
                  <div class="content__introduce">
                    <strong>Elon Reeve Musk</strong>
                    <p>데이터분석 @ 삼성전자</p>
                  </div>
                </div>
                <div class="content__profile">
                  <img
                    class="circle"
                    src="../../assets/juckerbug.jpg"
                    alt="PROFILE"
                  />
                  <div class="content__introduce">
                    <strong>Elonk</strong>
                    <p>데이터분석 @ 삼성전자</p>
                  </div>
                </div>
                <div class="content__profile">
                  <img
                    class="circle"
                    src="../../assets/juckerbug.jpg"
                    alt="PROFILE"
                  />
                  <div class="content__introduce">
                    <strong>Elon</strong>
                    <p>빅데이터 @ 삼성전자</p>
                  </div>
                </div>
                <div class="content__profile">
                  <img
                    class="circle"
                    src="../../assets/juckerbug.jpg"
                    alt="PROFILE"
                  />
                  <div class="content__introduce">
                    <strong>Elon Reeve Musk</strong>
                    <p>데이터분석 @ 삼성전자</p>
                  </div>
                </div>
                <div class="content__profile">
                  <img
                    class="circle"
                    src="../../assets/juckerbug.jpg"
                    alt="PROFILE"
                  />
                  <div class="content__introduce">
                    <strong>Elon Reeve Musk</strong>
                    <p>데이터분석 @ 삼성전자</p>
                  </div>
                </div>
                <div class="content__profile">
                  <img
                    class="circle"
                    src="../../assets/juckerbug.jpg"
                    alt="PROFILE"
                  />
                  <div class="content__introduce">
                    <strong>Elon Reeve Musk</strong>
                    <p>데이터분석 @ 삼성전자</p>
                  </div>
                </div>
                <div class="content__profile">
                  <img
                    class="circle"
                    src="../../assets/juckerbug.jpg"
                    alt="PROFILE"
                  />
                  <div class="content__introduce">
                    <strong>Elon Reeve Musk</strong>
                    <p>데이터분석 @ 삼성전자</p>
                  </div>
                </div>
              </div>
              <div class="section__more-member">
                <button class="btn visual__right">MORE</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <!-- 구성원 추가 모달 -->
     <!-- 구성원 추가 모달 -->
    <div class="modal hidden">
      <div class="modal__overlay"></div>
      <div class="modal__content">
      
          <form id="add-member" class="content__inner" action="addMember.co" method="get">
          	  <input type="hidden" name="cno" value="${company.compNo }">
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
    <!-- 구성원 추가 모달 -->

    <!-- <script>

          // const openButton = document.getElementsByClassName("modal__button");
          // const modal = document.querySelector(".modal");
          // const openModal =() =>{
          //     modal.classList.remove("hidden");
          // }
          // openButton.addEventListener("click", openModal);
          document.querySelector(".modal__button").addEventListener("click", () => {
          document
          .querySelector(".modal")
          .classList.remove("hidden");
  </script> -->
    <script>
      window.onload = function () {
        function onClick() {
          const modal = document.querySelector(".modal");
          modal.classList.remove("hidden");
        }
        function offClick() {
          const modal = document.querySelector(".modal");
          modal.classList.add("hidden");
        }

        document
          .getElementById("add__member__open")
          .addEventListener("click", onClick);
        document
          .querySelector(".modal__close")
          .addEventListener("click", offClick);
      };
    </script>
  </body>
</html>
