<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>PARTNER</title>
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
    
    
    <div class="content__section">
      <div class="inner">
        <div class="page-route"><span>HOME/PARTNER</span></div>
      </div>

      <section class="connecting__section content__section-change">
        <div class="inner">
          <div class="connecting__left">
            <button class="btn btn-blue" onclick=' location.href="profile.me?userNo=${loginUser.userNo}"'>프로필 관리</button>
            <button class="btn" onclick=' location.href="initFollowing.us?userNo=${loginUser.userNo}"'>팔로잉/팔로워 관리</button>
          </div>

          <div class="connection__right">
          <input type="hidden" class="loginUser" value="${loginUser.userNo}">
            <div class="connection__title">
              <strong>Connecting people</strong>
            </div>
            <div class="connection__content">
            <input type="hidden" name="Connecting" value="${connecting}">
              <ul class="connection__info">
                <li class="userPs" name="userPosi" value="0">기획자 
                <div class="circle"><span>${connect.get("planner")}</span></div>
                </li>
                <li class="userPs" name="userPosi" value="2">디자이너
                <div class="circle"><span>${connect.get("designer")}</span></div>
                </li>
                <li class="userPs" name="userPosi" value="1">개발자
                <div class="circle"><span>${connect.get("developer")}</span></div>
                </li>
              </ul>
            </div>
          </div>

        </div>
      </section>

      <main class="partner__main">
        <div class="inner">
            <div class="partner_search">
              <h1>파트너 정보검색</h1>
              <form class="search__form" action="" method="post">
                <div class="search__select">
                  <select class="userPosi" name="userPosi">
                    <option hidden>업무분야</option>
                    <option value="1">개발자</option>
                    <option value="0">기획자</option>
                    <option value="2">디자이너</option>
                  </select>
                  <select class="skillNo" name="skillNo">
                    <option hidden>활동분야</option>
                  <c:forEach var="skill" items="${skill}">
                    <option value="${skill.skillNo}">${skill.skillName}</option>
                  </c:forEach>
                  </select>
                  <input class="user_edu" name="user_edu" type="search" placeholder="학교명 ex)서울대학교">
                  <div id="user-filed-search-list">
                  
                  </div>
                </div>
                <div class="keyword">
                  <input class="userName" type="search" placeholder="검색어를 입력해주세요.(이름)">
                  <button type="submit">
                    <i class="material-icons">search</i>
                  </button>

                </div>
              </form>
              <div class="result_tag">
               <!-- 
                <div class="tag">
                  <span>자바</span>
                  <i class="material-icons md-18 md-light">close</i>
                </div>
                <div class="tag">
                  <span>기획자</span>
                  <i class="material-icons md-18 md-light">close</i>
                </div>
                -->
              </div>
            
              <div class="connecting_people">
                <div class="subtitle">
                  <h2>나와 연결된 사람들</h2>
                </div>
                <h3 class="resultCount1">검색결과 (0)</h3>
                  <!-- 연결된 사람이 없는 경우 if문-->
                  <div class="result_none">
                    <ul class="result_none_text">
                      <li><i class="material-icons md-48">search_off</i></li>
                      <li>나와 연관된 사람들이 없습니다.</li>
                    </ul>
                  </div>
                  <!-- if문 -->
                <!-- 나와 연결된 사람 결과 for문-->
                <div class="search_result">

	                
                </div>  
                 
                <!-- for문 
                <div class="more">
                  <button class="btn">more</button>
                </div>
                -->
              </div>


              <div class="connecting_people">
                <div class="subtitle">
                  <h2>그 외</h2>
                </div>
                <h3 class="resultCount2">검색결과 (0)</h3>
                <!-- 검색결과 없는경우  if문-->
                <div class="result_none">
                  <ul class="result_none_text">
                    <li><i class="material-icons md-48">search_off</i></li>
                    <li>검색결과가 없습니다.</li>
                  </ul>
                </div> 
                <!--if문  -->
                <!-- 검색결과 for문--> 
                <div class="search_result2">

                </div>  
                
                <!-- for문 
                
                <div class="more">
                  <button class="btn">more</button>
                </div>
                -->
                
              </div>

            </div>
            </div>

            
            <div class="partner_search">
              <div class="inner">
                <div class="popular">
                  <div class="popular_people">
                    <h1>인기프로필</h1>
                    <!-- <div class="subtitle">
                      <h2>인기 프로필</h2>
                    </div> -->
                    <!-- 인기프로필 for문 -->
                    <c:forEach var="p" items="${popular}">
                    <input type="hidden" name="userNo" vlaue="${p.userNo}">
                    <div class="search_result">
                      <div class="result__left" onclick=' location.href="profile.me?userNo=${p.userNo}"'>
                        <div class="avatar">
                          <c:choose>
                          <c:when test="${empty p.userAvatar}">
                          <img src="resources/assets/conn.png" alt="" />
                          </c:when>
                          <c:otherwise>
                          <img src="${p.userAvatar}" alt="" />
                          </c:otherwise>
                          </c:choose>
                        </div>
                        <ul class="avatar__info">

                          <li><strong>${p.userName}</strong></li>

                          <c:choose>
                          <c:when test="${empty p.userComp}">
                          <li>${p.userEdu}</li>
                          </c:when>
                          <c:otherwise>
                          <li>${p.userComp}</li>
                          </c:otherwise>
                          </c:choose>


                          <c:if test="${p.userPosi eq '0'}">
                          <li>기획자</li>
                          </c:if>
                          <c:if test="${p.userPosi eq '1'}">
                          <li>개발자</li>
                          </c:if>
                          <c:if test="${p.userPosi eq '2'}">
                          <li>디자이너</li>
                          </c:if>
                        </ul>
                      </div>
                      <div class="result__right">
                        <!-- ${fn:length(follower)-1} 
                        
                        <c:forEach var="f" items="${follower}">
                         <c:choose>
                            <c:when test="${p.userNo eq f.userNo}">
                              <button class="btn">취소</button>
                           </c:when>
                           <c:otherwise>
                              <button class="btn">팔로우</button>
                           </c:otherwise>
                         </c:choose>
                      </c:forEach>  
                        
                        -->        
                       <c:choose>
                            <c:when test="${fn:contains(follower,p.userNo)}">
                              <button class="btn" onclick ="cancelFollowing(${loginUser.userNo},${p.userNo},event.target)">취소</button>
                           </c:when>
                           <c:otherwise>
                              <button class="btn btn-blue" onclick ="addFollowing(${loginUser.userNo},${p.userNo},event.target)">팔로우</button>
                           </c:otherwise>
                      </c:choose>                       



                      
                     
                      </div>
                    </div>  
                    </c:forEach>
                    
                    <!-- for문 -->
                  </div>
                </div>
              </div>
            </div>

            </div>
        </div>
      </main>

      <!-- 푸터 포함 -->
      <jsp:include page="../common/footer.jsp"/>
      <script src="resources/js/partner/partner.js"></script> 
      <script defer>
      
    
      
      
        'use strict'
        
        //함수의 매개변수 값으로 유저번호, 팔로잉할회원번호, 클릭된객체가 들어온다.
        const addFollowing = (frNo,fgNo,e)=>{
        	
        	axios.get('addFollowing.conn',{
        		params:{
	        		userNo:frNo,
	        		followingNo:fgNo
        		}
        	})
        	.then((res)=>{
        		console.log(res);
        		if(res.data.result>0){ //팔로잉 추가 성공
        			e.innerText="취소";
        			e.className='btn'
        			e.setAttribute('onclick','cancelFollowing('+res.data.followerNo+','+res.data.followingNo+',event.target)');
        		}else{ //팔로잉 추가 실패
        			alert('요청에 실패했습니다.');
        		}
        	})
        	.catch((err)=>{ //통신 실패
        		console.log(err);
        	})
        	
        };
        
        const cancelFollowing = (frNo,fgNo,e)=>{
        	axios.get('cancelFollowing.conn',{
        		params:{
	        		userNo:frNo,
	        		followingNo:fgNo
        		}
        	})
        	.then((res)=>{
        		if(res.data.result>0){ //팔로잉 삭제 성공
        			e.innerText="팔로우";
        			e.className='btn btn-blue'
        			e.setAttribute('onclick','addFollowing('+res.data.followerNo+','+res.data.followingNo+',event.target)');
        		}else{ //팔로잉 삭제 실패
        			alert('요청에 실패했습니다.');
        		}
        	})
        	.catch((err)=>{ //통신 실패
        		console.log(err);
        	})
        	
        };
        
      
      </script>
      
      
  </body>
</html>
