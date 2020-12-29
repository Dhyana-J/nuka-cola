<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>recruit-search</title>
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
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/recruit/recruit-search.css" />
</head>
 <body>
    <!-- 메뉴바 -->
    <jsp:include page="../common/mainMenu.jsp"/>

    <main class="recruit-search__main-wrapper">
      <div class="inner">
        <div class="recruit-search__left-area">
          <button class="recruit-enroll-btn">채용 무료 등록</button>
        </div>
        <div class="recruit-search__right-area">
          <div class="info-search">
            <div class="info-search__header">채용정보검색</div>
            <div class="info-search__selects">
              <select name="position">
                <option>채용분야</option>
                <option value="0">기획/PM</option>
                <option value="1">SW 개발</option>
                <option value="2">디자인</option>
              </select>
              <select name="industry">
                <option value="">산업</option>
                <option value="">웹서비스</option>
                <option value="">모바일</option>
                <option value="">IoT</option>
              </select>

              <select name="field">
                <option value="">활동분야</option>
                <option value="">Java</option>
                <option value="">React</option>
                <option value="">JavaScript</option>
              </select>
              <select name="condition">
                <option value="">채용조건</option>
                <option value="">신입</option>
                <option value="">경력</option>
              </select>
              <!--지역 연봉은 그냥 버튼누르면 모달뜨게끔 해야할듯..-->
              <select name="salary">
                <option value="">연봉</option>
              </select>
              <select name="location">
                <option value="">지역</option>
              </select>
            </div>
            <div class="info-search__searchbar">
              <input type="text">
              <span class="material-icons">search</span>
            </div>
            <div class="info-search__tags">
              <div class="selected-tag">
                <span>채용분야 : SW 개발</span>
                <span class="material-icons">clear</span>
              </div>
              <div class="selected-tag">
                <span>채용분야 : 디자인</span>
                <span class="material-icons">clear</span>
              </div>
              <div class="selected-tag">
                <span>활동분야 : Java</span>
                <span class="material-icons">clear</span>
              </div>
              <div class="selected-tag">
                <span>활동분야 : React</span>
                <span class="material-icons">clear</span>
              </div>
              <div class="selected-tag">
                <span>산업 : 모바일</span>
                <span class="material-icons">clear</span>
              </div>
              <div class="selected-tag">
                <span>활동분야 : JavaScript</span>
                <span class="material-icons">clear</span>
              </div>
              <div class="selected-tag">
                <span>채용조건 : 신입</span>
                <span class="material-icons">clear</span>
              </div>
              <div class="selected-tag">
                <span>채용조건 : 경력</span>
                <span class="material-icons">clear</span>
              </div>
            </div>
          </div>
          <!--info-search-->
          <div class="recruit-search__results">
            <div class="search-results__header">
              <span>검색 결과</span>
              <div class="search-results__align-options">
                <span class="aligning">최신순</span>
                <span>인기순</span>
                <span>연봉순</span>
              </div>
            </div>
            <div class="recruit-search__search-list">
              <div class="recruit-info">
                <div class="recruit-info__icons">
                  <span class="material-icons">close</span>
                </div>

                <div class="recruit-info__contents">
                  <div class="company__thumb-area">
                    <div class="company__thumbnail">
                      <img src="resources/assets/conn.png" alt="company-thumb" />
                    </div>
                  </div>
                  <div class="company__info-wrapper">
                    <div class="company__info-area">
                      <div class="company-name">RIDI</div>
                      <div class="company-desc">
                        인류 정신을 풍요롭게 하는 플랫폼
                      </div>
                      <div class="company-industry">
                        <span>웹 서비스</span>
                        <span>&nbsp;·&nbsp;</span>
                        <span>모바일</span>
                      </div>
                      <div class="applier-count">
                        45명 이상이 누카콜라를 통해 지원
                      </div>
                    </div>
                    <div class="recruit-summary__wrapper">
                      <div class="recruit-summary">
                        <div class="summary__contents">
                          <div class="recruit-title">
                            [라프텔] 백엔드 개발자
                          </div>
                          <span>5,000 - 8,000만원</span>
                          <span> / </span>
                          <span>경력</span>
                        </div>
                        <div class="summary__icon">
                          <span class="material-icons">turned_in_not</span>
                          <!-- <span class="material-icons">turned_in</span> 안채워진 북마크-->
                        </div>
                      </div>
                      <div class="recruit-period">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </div>
                    </div>
                    <!--recruit-summary__wrapper-->
                    <div class="recruit-summary__wrapper">
                      <div class="recruit-summary">
                        <div class="summary__contents">
                          <div class="recruit-title">
                            [라프텔] 백엔드 개발자
                          </div>
                          <span>5,000 - 8,000만원</span>
                          <span> / </span>
                          <span>경력</span>
                        </div>
                        <div class="summary__icon">
                          <span class="material-icons">turned_in_not</span>
                          <!-- <span class="material-icons">turned_in</span> -->
                        </div>
                      </div>
                      <div class="recruit-period">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </div>
                    </div>
                    <!--recruit-summary__wrapper-->
                  </div>
                </div>
              </div>
              <!--recruit-info-->

              <div class="recruit-info">
                <div class="recruit-info__icons">
                  <span class="material-icons">close</span>
                </div>

                <div class="recruit-info__contents">
                  <div class="company__thumb-area">
                    <div class="company__thumbnail">
                      <img src="resources/assets/conn.png" alt="company-thumb" />
                    </div>
                  </div>
                  <div class="company__info-wrapper">
                    <div class="company__info-area">
                      <div class="company-name">RIDI</div>
                      <div class="company-desc">
                        인류 정신을 풍요롭게 하는 플랫폼
                      </div>
                      <div class="company-industry">
                        <span>웹 서비스</span>
                        <span>&nbsp;·&nbsp;</span>
                        <span>모바일</span>
                      </div>
                      <div class="applier-count">
                        45명 이상이 누카콜라를 통해 지원
                      </div>
                    </div>
                    <div class="recruit-summary__wrapper">
                      <div class="recruit-summary">
                        <div class="summary__contents">
                          <div class="recruit-title">
                            [라프텔] 백엔드 개발자
                          </div>
                          <span>5,000 - 8,000만원</span>
                          <span> / </span>
                          <span>경력</span>
                        </div>
                        <div class="summary__icon">
                          <!-- <span class="material-icons">turned_in_not</span> -->
                          <span class="material-icons">turned_in</span>
                        </div>
                      </div>
                      <div class="recruit-period">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--recruit-info-->

              <div class="recruit-info">
                <div class="recruit-info__icons">
                  <span class="material-icons">close</span>
                </div>

                <div class="recruit-info__contents">
                  <div class="company__thumb-area">
                    <div class="company__thumbnail">
                      <img src="resources/assets/conn.png" alt="company-thumb" />
                    </div>
                  </div>
                  <div class="company__info-wrapper">
                    <div class="company__info-area">
                      <div class="company-name">RIDI</div>
                      <div class="company-desc">
                        인류 정신을 풍요롭게 하는 플랫폼
                      </div>
                      <div class="company-industry">
                        <span>웹 서비스</span>
                        <span>&nbsp;·&nbsp;</span>
                        <span>모바일</span>
                      </div>
                      <div class="applier-count">
                        45명 이상이 누카콜라를 통해 지원
                      </div>
                    </div>
                    <div class="recruit-summary__wrapper">
                      <div class="recruit-summary">
                        <div class="summary__contents">
                          <div class="recruit-title">
                            [라프텔] 백엔드 개발자
                          </div>
                          <span>5,000 - 8,000만원</span>
                          <span> / </span>
                          <span>경력</span>
                        </div>
                        <div class="summary__icon">
                          <span class="material-icons">turned_in_not</span>
                          <!-- <span class="material-icons">turned_in</span> 안채워진 북마크-->
                        </div>
                      </div>
                      <div class="recruit-period">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--recruit-info-->

              <div class="recruit-info">
                <div class="recruit-info__icons">
                  <span class="material-icons">close</span>
                </div>

                <div class="recruit-info__contents">
                  <div class="company__thumb-area">
                    <div class="company__thumbnail">
                      <img src="resources/assets/conn.png" alt="company-thumb" />
                    </div>
                  </div>
                  <div class="company__info-wrapper">
                    <div class="company__info-area">
                      <div class="company-name">RIDI</div>
                      <div class="company-desc">
                        인류 정신을 풍요롭게 하는 플랫폼
                      </div>
                      <div class="company-industry">
                        <span>웹 서비스</span>
                        <span>&nbsp;·&nbsp;</span>
                        <span>모바일</span>
                      </div>
                      <div class="applier-count">
                        45명 이상이 누카콜라를 통해 지원
                      </div>
                    </div>
                    <div class="recruit-summary__wrapper">
                      <div class="recruit-summary">
                        <div class="summary__contents">
                          <div class="recruit-title">
                            [라프텔] 백엔드 개발자
                          </div>
                          <span>5,000 - 8,000만원</span>
                          <span> / </span>
                          <span>경력</span>
                        </div>
                        <div class="summary__icon">
                          <!-- <span class="material-icons">turned_in_not</span> -->
                          <span class="material-icons">turned_in</span>
                        </div>
                      </div>
                      <div class="recruit-period">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </div>
                    </div>
                    <!--recruit-summary__wrapper-->
                    <div class="recruit-summary__wrapper">
                      <div class="recruit-summary">
                        <div class="summary__contents">
                          <div class="recruit-title">
                            [라프텔] 백엔드 개발자
                          </div>
                          <span>5,000 - 8,000만원</span>
                          <span> / </span>
                          <span>경력</span>
                        </div>
                        <div class="summary__icon">
                          <span class="material-icons">turned_in_not</span>
                          <!-- <span class="material-icons">turned_in</span> -->
                        </div>
                      </div>
                      <div class="recruit-period">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </div>
                    </div>
                    <!--recruit-summary__wrapper-->
                  </div>
                  <!--company__info-wrapper-->
                </div>
              </div>
              <!--recruit-info-->
            </div>
            <!--recruit-search__search-list-->
          </div>
        </div>
      </div>
    </main>

    <jsp:include page="../common/footer.jsp"/>
  </body>
</html>