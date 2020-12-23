<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

      <section class="connecting__section">
        <div class="inner">
          <div class="connecting__left">
            <button class="btn btn-blue">프로필 관리</button>
            <button class="btn">팔로잉/팔로워 관리</button>
          </div>

          <div class="connection__right">
            <div class="connection__title">
              <strong>Connecting people</strong>
            </div>
            <div class="connection__content">
              <ul class="connection__info">
                <li>기획자 <div class="circle"><span>20</span></div></li>
                <li>디자이너<div class="circle"><span>20</span></div></li>
                <li>개발자<div class="circle"><span>20</span></div></li>
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
                  <select name="recurit_posi">
                    <option hidden selected>업무분야</option>
                    <option>개발자</option>
                    <option>기획자</option>
                    <option>디자이너</option>
                  </select>
                  <select name="indus_name">
                    <option hidden selected>직종</option>
                    <option>웹서비스</option>
                    <option>모바일</option>
                    <option>IOT</option>
                    <option>O2O</option>
                    <option> 핀테크</option>
                  </select>
                  <select name="">
                    <option hidden selected>활동분야</option>
                    <option>JAVA</option>
                    <option>React</option>
                    <option>JavaScript</option>
                  </select>
                  <input name="user_edu" type="search" placeholder="학교명">
                </div>
                <div class="keyword">
                  <input type="search" placeholder="검색어를 입력해주세요.">
                  <button type="submit">
                    <i class="material-icons">search</i>
                  </button>

                </div>
              </form>
              <div class="result_tag">
                <div class="tag">
                  <span>자바</span>
                  <i class="material-icons md-18 md-light">close</i>
                </div>
                <div class="tag">
                  <span>기획자</span>
                  <i class="material-icons md-18 md-light">close</i>
                </div>
              </div>
            
              <div class="connecting_people">
                <div class="subtitle">
                  <h2>나와 연결된 사람들</h2>
                </div>
                <h3>검색결과 (30)</h3>
                  <!-- 연결된 사람이 없는 경우 if문-->
                  <!-- <div class="result_none">
                    <ul class="result_none_text">
                      <li><i class="material-icons md-48">search_off</i></li>
                      <li>나와 연관된 사람들이 없습니다.</li>
                    </ul>
                  </div> -->
                  <!-- if문 -->
                <!-- 나와 연결된 사람 결과 for문 -->
                <div class="search_result">

                  <div class="result__left">
                    <div class="avatar">
                      <img src="../../assets/avatar.png" alt="" />
                    </div>
                    <ul class="avatar__info">
                      <li><strong>홍길동</strong></li>
                      <li>서울대학교</li>
                      <li>기획자</li>
                    </ul>
                  </div>
                  <div class="result__right">
                    <button class="btn">취소</button>
                  </div>
                </div>  
                <!-- for문 -->
                <div class="more">
                  <button class="btn">more</button>
                </div>
              </div>


              <div class="connecting_people">
                <div class="subtitle">
                  <h2>그 외</h2>
                </div>
                <h3>검색결과 (30)</h3>
                <!-- 검색결과 없는경우  if문-->
                <!-- <div class="result_none">
                  <ul class="result_none_text">
                    <li><i class="material-icons md-48">search_off</i></li>
                    <li>검색결과가 없습니다.</li>
                  </ul>
                </div> -->
                <!--if문  -->
                <!-- 검색결과 for문 -->
                <div class="search_result">
                  <div class="result__left">
                    <div class="avatar">
                      <img src="../../assets/avatar.png" alt="" />
                    </div>
                    <ul class="avatar__info">
                      <li><strong>홍길동</strong></li>
                      <li>MicroSoft, ceo</li>
                      <li>기획자</li>
                    </ul>
                  </div>
                  <div class="result__right">
                    <button class="btn">팔로우</button>
                  </div>
                </div>  
                <!-- for문 -->

                <div class="search_result">
                  <div class="result__left">
                    <div class="avatar">
                      <img src="../../assets/avatar.png" alt="" />
                    </div>
                    <ul class="avatar__info">
                      <li><strong>홍길동</strong></li>
                      <li>MicroSoft, ceo</li>
                      <li>기획자</li>
                    </ul>
                  </div>
                  <div class="result__right">
                    <button class="btn">팔로우</button>
                  </div>
                </div> 
                
                <div class="more">
                  <button class="btn">more</button>
                </div>
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
                    <div class="search_result">
                      <div class="result__left">
                        <div class="avatar">
                          <img src="../../assets/avatar.png" alt="" />
                        </div>
                        <ul class="avatar__info">
                          <li><strong>홍길동</strong></li>
                          <li>MicroSoft, ceo</li>
                          <li>기획자</li>
                        </ul>
                      </div>
                      <div class="result__right">
                        <button class="btn">팔로우</button>
                      </div>
                    </div>  
                    <div class="search_result">
                      <div class="result__left">
                        <div class="avatar">
                          <img src="../../assets/avatar.png" alt="" />
                        </div>
                        <ul class="avatar__info">
                          <li><strong>홍길동</strong></li>
                          <li>MicroSoft, ceo</li>
                          <li>기획자</li>
                        </ul>
                      </div>
                      <div class="result__right">
                        <button class="btn">팔로우</button>
                      </div>
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
        			e.target.innerText="팔로우 취소";
        			e.target.setAttribute('onclick','cancelFollowing('+res.data.followerNo+','+res.data.followingNo+',event)');
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
        			e.target.innerText="팔로우";
        			e.target.setAttribute('onclick','addFollowing('+res.data.followerNo+','+res.data.followingNo+',event)');
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
