<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/company.css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>
  <body>
   <jsp:include page="../common/mainMenu.jsp" />

    <c:if test="${!empty alertMsg }">
      <script>
        alert("${alertMsg}");
      </script>
      <c:remove var="alertMsg" scope="session" />
    </c:if>
    
    <!-- 컨텐츠 -->
        <main class="content__section">
      <div class="inner">
        <div class="main__main__section">
          <div class="main__section__content">
            <div class="content__wrapper">
                <div class="section__search-result-top">
                    <span><strong>파트너</strong> 검색결과</span>
                </div>
                <div class="section__member">
                    <div class="content__profile">
                      <img
                        class="circle"
                        src="../../assets/wonbin.jpeg"
                        alt="PROFILE"
                      />
                      <div class="content__introduce">
                        <strong>성수지</strong>
                        <p>프론트엔드 @구글</p>
                      </div>
                    </div>
                    <div class="content__profile">
                      <img
                        class="circle"
                        src="../../assets/JonahHill.jpg"
                        alt="PROFILE"
                      />
                      <div class="content__introduce">
                        <strong>배진원</strong>
                        <p>프론트엔드 @구글</p>
                      </div>
                    </div>
                    <div class="content__profile">
                      <img
                        class="circle"
                        src="../../assets/wonbin.jpeg"
                        alt="PROFILE"
                      />
                      <div class="content__introduce">
                        <strong>유원근</strong>
                        <p>프론트엔드 @구글</p>
                      </div>
                    </div>
                    <div class="content__profile">
                      <img
                        class="circle"
                        src="../../assets/wonbin.jpeg"
                        alt="PROFILE"
                      />
                      <div class="content__introduce">
                        <strong>정찬복</strong>
                        <p>프론트엔드 @구글</p>
                      </div>
                    </div>
                    <div class="content__profile">
                      <img
                        class="circle"
                        src="../../assets/wonbin.jpeg"
                        alt="PROFILE"
                      />
                      <div class="content__introduce">
                        <strong>김준호</strong>
                        <p>프론트엔드 @구글</p>
                      </div>
                    </div>
                    <div class="content__profile">
                      <img
                        class="circle"
                        src="../../assets/wonbin.jpeg"
                        alt="PROFILE"
                      />
                      <div class="content__introduce">
                        <strong>손지원</strong>
                        <p>프론트엔드 @구글</p>
                      </div>
                    </div>
                  </div>
                  <div class="section__search-result-bottom">
                    <a href="">사람 더 보기</a>
                  </div>
                    
            </div>
            <div class="section__search-result">
                <div class="section__search-result-top">
                    <span><strong>채용</strong> 검색결과</span>
                </div>
                <div class="section__result__detail">
                    <div class="logo">
                      <img src="../../assets/moomin.jpg" alt="logo" />
                    </div>
                    <div class="comp-info">
                      <strong>네이버[백엔드개발자]</strong>
                      <span>5,000 - 8,000만원/신입</span>
                      <span class="comp-info-lo">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </span>
                    </div>
                  </div>
                  <div class="section__result__detail">
                    <div class="logo">
                      <img src="../../assets/moomin.jpg" alt="logo" />
                    </div>
                    <div class="comp-info">
                      <strong>네이버[백엔드개발자]</strong>
                      <span>5,000 - 8,000만원/신입</span>
                      <span class="comp-info-lo">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </span>
                    </div>
                  </div>
                  <div class="section__result__detail">
                    <div class="logo">
                      <img src="../../assets/moomin.jpg" alt="logo" />
                    </div>
                    <div class="comp-info">
                      <strong>네이버[백엔드개발자]</strong>
                      <span>5,000 - 8,000만원/신입</span>
                      <span class="comp-info-lo">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </span>
                    </div>
                  </div>
                  <div class="section__result__detail">
                    <div class="logo">
                      <img src="../../assets/moomin.jpg" alt="logo" />
                    </div>
                    <div class="comp-info">
                      <strong>네이버[백엔드개발자]</strong>
                      <span>5,000 - 8,000만원/신입</span>
                      <span class="comp-info-lo">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </span>
                    </div>
                  </div>
                  <div class="section__result__detail">
                    <div class="logo">
                      <img src="../../assets/moomin.jpg" alt="logo" />
                    </div>
                    <div class="comp-info">
                      <strong>네이버[백엔드개발자]</strong>
                      <span>5,000 - 8,000만원/신입</span>
                      <span class="comp-info-lo">
                        <span>12/31 마감</span>
                        <span>10/15 등록</span>
                      </span>
                    </div>
                  </div>
                  <div class="section__search-result-bottom">
                    <a href="">채용 더 보기</a>
                  </div>
            </div>
            <div class="section__search-result">
              <div class="section__search-result-top">
                <span><strong>기업</strong> 검색결과</span>
              </div>
              <div class="section__result__detail">
                <div class="logo">
                  <img src="../../assets/moomin.jpg" alt="logo" />
                </div>
                <div class="comp-info">
                  <strong>네이버</strong>
                  <span>Internet content service operator</span>
                  <span class="comp-info-lo">서울 강남구</span>
                </div>
               
              </div>

              <div class="section__result__detail">
                <div class="logo">
                  <img src="../../assets/moomin.jpg" alt="logo" />
                </div>
                <div class="comp-info">
                  <strong>네이버</strong>
                  <span>Internet content service operator</span>
                  <span class="comp-info-lo">서울 강남구</span>
                </div>
                
              </div>

              <div class="section__result__detail">
                <div class="logo">
                  <img src="../../assets/moomin.jpg" alt="logo" />
                </div>
                <div class="comp-info">
                  <strong>네이버</strong>
                  <span>Internet content service operator</span>
                  <span class="comp-info-lo">서울 강남구</span>
                </div>
               
              </div>

              <div class="section__result__detail">
                <div class="logo">
                  <img src="../../assets/moomin.jpg" alt="logo" />
                </div>
                <div class="comp-info">
                  <strong>네이버</strong>
                  <span>Internet content service operator</span>
                  <span class="comp-info-lo">서울 강남구</span>
                </div>
               
              </div>

              <div class="section__result__detail">
                <div class="logo">
                  <img src="../../assets/moomin.jpg" alt="logo" />
                </div>
                <div class="comp-info">
                  <strong>네이버</strong>
                  <span>Internet content service operator</span>
                  <span class="comp-info-lo">서울 강남구</span>
                </div>
                
              </div>

              <div class="section__result__detail">
                <div class="logo">
                  <img src="../../assets/moomin.jpg" alt="logo" />
                </div>
                <div class="comp-info">
                  <strong>네이버</strong>
                  <span>Internet content service operator</span>
                  <span class="comp-info-lo">서울 강남구</span>
                </div>
                
              </div>

              <div class="section__result__detail">
                <div class="logo">
                  <img src="../../assets/moomin.jpg" alt="logo" />
                </div>
                <div class="comp-info">
                  <strong>네이버</strong>
                  <span>Internet content service operator</span>
                  <span class="comp-info-lo">서울 강남구</span>
                </div>
              </div>
              <div class="section__search-result-bottom">
                <a href="">사람 더 보기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
