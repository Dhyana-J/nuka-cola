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
                
                 <c:forEach var="u" items="${ ulist }">
                    <div class="content__profile" onClick='location.href="profile.me?userNo=${ u.userNo }"'>
                      <c:choose>
						 <c:when test="${u.userAvatar eq null }">
							<img class="circle" src="resources/assets/conn.png" alt="img">
						 </c:when>
					 	 <c:otherwise>
					 	 <img class="circle" src="${u.userAvatar}"/>
						 </c:otherwise>
					  </c:choose>
                      <div class="content__introduce">
                      	<strong>${u.userName}</strong>
                      <c:choose>
						 <c:when test="${u.compName eq null }">
					 	  <p>소속없음</p>
						 </c:when>
					 	 <c:otherwise>
					 	  <p>${u.careerPosi}@${u.compName}</p>
						 </c:otherwise>
					  </c:choose>
                      </div>
                    </div>
				</c:forEach>
                  
                  </div>
                  <div class="section__search-result-bottom">
                    <a href="list.pa">사람 더 보기</a>
                  </div>
                    
            </div>
            <div class="section__search-result">
                <div class="section__search-result-top">
                    <span><strong>채용</strong> 검색결과</span>
                </div>
                
                <c:forEach var="r" items="${ rlist }">
	                <div class="section__result__detail">
	                    <div class="logo">
	                      <img src="../../assets/moomin.jpg" alt="logo" />
	                    </div>
	                    <div class="comp-info">
	                      <strong>${r.compName}[${r.recruitTitle}]</strong>
	                      <span>${r.recruitMinSal} - ${r.recruitMaxSal}만원/
		                   <c:choose>
							 <c:when test="${r.recruitState == 0 }">
						 	  	신입
							 </c:when>
							 <c:when test="${r.recruitState == 1 }">
						 	  	경력
							 </c:when>
						 	 <c:otherwise>
						 	  	신입,경력
							 </c:otherwise>
						   </c:choose>
	                      </span>
	                      <span class="comp-info-lo">
	                        <span>${r.createdAt } 등록</span>
	                        <span>${r.recruitDl } 마감</span>
	                      </span>
	                    </div>
	                </div>
                </c:forEach>
                  <div class="section__search-result-bottom">
                    <a href="">채용 더 보기</a>
                  </div>
            </div>
            <div class="section__search-result">
              <div class="section__search-result-top">
                <span><strong>기업</strong> 검색결과</span>
              </div>
              
              <c:forEach var="c" items="${ clist }">
	              <div class="section__result__detail">
	                <div class="logo">
	                  <c:choose>
						 <c:when test="${c.compLogo eq null }">
							<img class="circle" src="resources/assets/conn.png" alt="img">
						 </c:when>
					 	 <c:otherwise>
					 	 <img class="circle" src="${c.compLogo}"/>
						 </c:otherwise>
					  </c:choose>
	                </div>
	                <div class="comp-info" onClick='location.href="profileMain.co?cno=${ c.compNo }"'>
	                  <strong>${c.compName}</strong>
	                  <span>${c.compInfo }</span>
	                  <span class="comp-info-lo">${c.compAddress}</span>
	                </div>
	              </div>
              </c:forEach>
             
              <div class="section__search-result-bottom">
                <a href="list.co">기업 더 보기</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
