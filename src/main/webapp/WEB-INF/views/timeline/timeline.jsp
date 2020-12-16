<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TIMELINE || NUKA-COLA</title>
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
    <link rel="stylesheet" href="resources/css/timeline.css" />
  </head>
  <body>
  	
    <jsp:include page="../common/mainMenu.jsp"/>
<<<<<<< HEAD
  
    <!-- 메인메뉴 -->
    <div class="main__menu__container">
      <div class="inner">
        <div class="menu__left">
          <div class="search__box">
            <input type="text" placeholder="검색어를 입력해주세요" />
            <i class="material-icons"> search </i>
          </div>
          <ul class="menu__nav">
            <li><a href="#">TIME LINE</a></li>
            <li><a href="#">PARTNERS</a></li>
            <li><a href="#">COMPANIES</a></li>
            <li><a href="#">EMPLOYMENT</a></li>
          </ul>
        </div>
        <div class="menu__right">
          <p>어서오세요 <b>가나다</b>님</p>
          <ul>
            <li>알림</li>
            <li>메시지</li>
            <li><a herf="profile.me">PROFILE</a></li>
            <li>LOGOUT</li>
          </ul>
        </div>
      </div>
    </div>
    <script>
      document.querySelector(".right__header").addEventListener("click", () => {
        if (
          document
            .querySelector(".main__menu__container")
            .classList.contains("main__menu-active")
        ) {
          document.querySelector(".main__menu__container").style.animation =
            "slideOffMenu 0.5s ease-in-out forwards";
          setTimeout(() => {
            document
              .querySelector(".main__menu__container")
              .classList.toggle("main__menu-active");
            document.querySelector(".main__menu__container").style.animation =
              "slideMenu 0.5s ease-in-out forwards";
          }, 300);
        } else {
          document
            .querySelector(".main__menu__container")
            .classList.toggle("main__menu-active");
        }
      });
    </script>
=======
>>>>>>> 778c28cc3f30161bf063d11cb14d912c80b6927e

    <!-- 컨텐츠 -->
    <main>
      <div class="inner">
        <div class="timeline__section-left">
          <h1>TIMELINE</h1>

          <!-- 타임라인배너 -->
          <div class="content__wrapper content_title_banner">
            <p>WHAT HAPPENED TODAY?</p>
<%--                <p>${loginUser.userName}</p>--%>
            <img src="resources/assets/timeline_title_img.png" alt="배너이미지" />
          </div>

          <!-- 게시글작성 -->
          <div class="content__wrapper post_form_wrapper">
            <h3>새로운 게시글 작성</h3>
            <form action="insert.pos" method="post" class="post_form" enctype="multipart/form-data">
              <span>오늘은 무슨일이 있었나요?</span>
              <textarea name="postContent" id=""></textarea>
              <input type="hidden" name="userNo" value="${loginUser.userNo}">
              <div class="post_form-btn-wrapper">
                <div onclick="imgUpload()" class="image__input_box">
                  <input name="upfile" id="img-input" type="file" hidden />
                  <p>이미지</p>
                  <i class="material-icons"> wallpaper </i>
                </div>
                <button type="submit" class="btn btn-blue">등록</button>
              </div>
            </form>
            <button class="post_form-btn">+</button>
          </div>

          <script defer>
            const imgUpload = ()=>{
              document.querySelector('#img-input').click();
            }
          </script>

        <c:forEach var="p" items="${ list }">
          <!-- 게시글아이템 -->
          <div class="content__wrapper post__item-wrapper">
            <input type="hidden" class="user_no_input" value="${p.userNo}">
            <div class="post__user-info">
              <div class="avatar-small">
                <img src="../../assets/avatar.png" alt="" />
              </div>
              <div class="user__summary">
                <strong>${p.userName}</strong>
                <small>${p.userComp}</small>
              </div>
              <div class="follow__btn">
                <i class="material-icons">person_add</i>
                <p>FOLLOW</p>
              </div>
            </div>
            <article>
              ${p.postContent}
            </article>
            <span class="post__date">${p.createdAt}</span>
            <div class="post__btn__wrapper">
              <div class="like_btn">
                <i class="material-icons"> thumb_up_alt </i>
                <span>LIKE</span>
              </div>
              <div class="comment-open like_btn">
                <i class="material-icons"> comment </i>
                <span>COMMENT</span>
              </div>
            </div>

            <!-- 댓글목록 -->
            <ul class="post__comment_list">
              <li>
                <div class="post__user-info">
                  <div class="avatar-small">
                    <img src="../../assets/avatar.png" alt="" />
                  </div>
                  <div class="user__summary">
                    <strong>Bill Gates</strong>
                    <small>MicroSoft @ CSAS</small>
                  </div>
                  <span class="post__date">2020 - 11 - 31</span>
                </div>
                <p class="comment_content">
                  Lorem Ipsum is simply dummy text of the printing and
                  typesetting industry.
                </p>
                <!-- <div class="comment__btn-wrapper">
                  <span>수정</span>
                  <span>삭제</span>
                </div> -->
              </li>
              <li>
                <div class="post__user-info">
                  <div class="avatar-small">
                    <img src="../../assets/avatar.png" alt="" />
                  </div>
                  <div class="user__summary">
                    <strong>Bill Gates</strong>
                    <small>MicroSoft @ CSAS</small>
                  </div>
                  <span class="post__date">2020 - 11 - 31</span>
                </div>
                <p class="comment_content">
                  Lorem Ipsum is simply dummy text of the printing and
                  typesetting industry.
                </p>
                <!-- <div class="comment__btn-wrapper">
                  <span>수정</span>
                  <span>삭제</span>
                </div> -->
              </li>
            </ul>
          </div>

          </c:forEach>

          <div class="content__wrapper post__item-wrapper">
            <div class="post__user-info">
              <div class="avatar-small">
                <img src="resources/assets/avatar.png" alt="" />
              </div>
              <div class="user__summary">
                <strong>Tim Cook</strong>
                <small>Apple.inc @ CEO</small>
              </div>
              <div class="follow__btn">
                <i class="material-icons">person_add</i>
                <p>FOLLOW</p>
              </div>
            </div>
            <article>
              Lorem Ipsum is simply dummy text of the printing and typesetting
              industry. Lorem Ipsum has been the industry’s standard dummy text
              ever since the 1500s, when an unknown printer took a galley of
              type and scrambled it to make a type specimen book.
            </article>
            <span class="post__date">2020 - 11 - 31</span>
            <div class="post__btn__wrapper">
              <div class="like_btn">
                <i class="material-icons"> thumb_up_alt </i>
                <span>LIKE</span>
              </div>
              <div class="comment-open like_btn">
                <i class="material-icons"> comment </i>
                <span>COMMENT</span>
              </div>
            </div>

            <!-- 댓글목록 -->
            <ul class="post__comment_list">
              <li>
                <div class="post__user-info">
                  <div class="avatar-small">
                    <img src="resources/assets/avatar.png" alt="" />
                  </div>
                  <div class="user__summary">
                    <strong>Bill Gates</strong>
                    <small>MicroSoft @ CSAS</small>
                  </div>
                  <span class="post__date">2020 - 11 - 31</span>
                </div>
                <p class="comment_content">
                  Lorem Ipsum is simply dummy text of the printing and
                  typesetting industry.
                </p>
                <!-- <div class="comment__btn-wrapper">
                            <span>수정</span>
                            <span>삭제</span>
                          </div> -->
              </li>
              <li>
                <div class="post__user-info">
                  <div class="avatar-small">
                    <img src="resources/assets/avatar.png" alt="" />
                  </div>
                  <div class="user__summary">
                    <strong>Bill Gates</strong>
                    <small>MicroSoft @ CSAS</small>
                  </div>
                  <span class="post__date">2020 - 11 - 31</span>
                </div>
                <p class="comment_content">
                  Lorem Ipsum is simply dummy text of the printing and
                  typesetting industry.
                </p>
                <!-- <div class="comment__btn-wrapper">
                            <span>수정</span>
                            <span>삭제</span>
                          </div> -->
              </li>
            </ul>
          </div>
        </div>
        <div class="timeline__section-rifht">
          <div class="content__wrapper profile__content">
            <div class="user__profile">
              <div class="avatar-mid">
                <img src="../../assets/avatar.png" alt="" />
              </div>
              <ul>
                <li><span>팔로워</span> <b>18</b></li>
                <li><span>팔로잉</span> <b>28</b></li>
                <li><span>연결</span> <b>8</b></li>
              </ul>
            </div>
            <div class="profile__summary">
              <p>${ loginUser.userName }님</p>
              <span>MicroSoft@AzureInterfaceEngineer</span>
            </div>
            <div class="profile__btn_wrapper">
              <button class="btn">PROFILE</button>
              <button class="btn btn-blue" onClick='location.href="logout.me"'>LOGOUT</button>
            </div>
          </div>
          <div class="content__wrapper recommend__comp">
            <p class="rec__comp_title">기업추천</p>
            <ul>
              <li>
                <div class="comp_avatar">
                  <img src="resources/assets/loginImage.jpg" alt="" />
                </div>
                <div class="comp_summary">
                  <b>Rocket Punch</b>
                  <span>Social Network</span>
                  <span>200명의 구성원</span>
                </div>
              </li>
              <li>
                <div class="comp_avatar">
                  <img src="../../assets/loginImage.jpg" alt="" />
                </div>
                <div class="comp_summary">
                  <b>Rocket Punch</b>
                  <span>Social Network</span>
                  <span>200명의 구성원</span>
                </div>
              </li>
              <li>
                <div class="comp_avatar">
                  <img src="../../assets/loginImage.jpg" alt="" />
                </div>
                <div class="comp_summary">
                  <b>Rocket Punch</b>
                  <span>Social Network</span>
                  <span>200명의 구성원</span>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </main>
  </body>
  <script defer>
    document.querySelector(".post_form-btn").addEventListener("click", (e) => {
      document
        .querySelector(".post_form_wrapper")
        .classList.toggle("post_form-active");
    });
    document.querySelectorAll(".comment-open").forEach((v, i) =>
      v.addEventListener("click", () => {
        v.classList.toggle("comment_btn_active");
        document
          .querySelectorAll(".post__comment_list")
          [i].classList.toggle("comment_list_active");
      })
    );
  </script>
</html>
