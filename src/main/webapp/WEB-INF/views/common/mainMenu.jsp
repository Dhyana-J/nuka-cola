<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <header>
      <div class="inner">
        <div class="left__header">
          <div class="logo">
            <img src="resources/assets/logo.png" alt="logo" />
          </div>
          <ul class="header__nav">
            <li class="header__nav-item">PARTNER</li>
            <li class="header__nav-item"><a href="list.co">COMPANIES</a></li>
            <li class="header__nav-item">EMPLOYMENT</li>
          </ul>
        </div>
        <div class="right__header">
          <i class="material-icons">menu</i>
          <span>MENU</span>
        </div>
      </div>
    </header>
  
    <div class="main__menu__container">
      <div class="inner">
        <div class="menu__left">
          <div class="search__box">
            <input type="text" placeholder="검색어를 입력해주세요" />
            <i class="material-icons"> search </i>
          </div>
          <ul class="menu__nav">
            <li><a href="/views/timeline/timeline.jsp">TIME LINE</a></li>
            <li><a href="#">PARTNERS</a></li>
            <li><a href="list.co">COMPANIES</a></li>
            <li><a href="#">EMPLOYMENT</a></li>
          </ul>
        </div>
        <div class="menu__right">
          <p>어서오세요 <b>${ loginUser.userName }</b>님</p>
          <ul>
            <li>알림</li>
            <li>메시지</li>
            <li onClick='location.href="initConnection.us?userNo=${loginUser.userNo}"'>PROFILE</li>
            <li onClick='location.href="logout.me"'>LOGOUT</li>
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
  </body>
</html>
    