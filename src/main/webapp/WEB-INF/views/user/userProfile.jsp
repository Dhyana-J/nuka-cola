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
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/profile/profile__main.css" />
    <link rel="”stylesheet”" href="”icono.min.css”" />
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css" />
    <script
      type="text/javascript"
      src="http://code.jquery.com/jquery-latest.js"
    ></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
            <li class="header__nav-item">COMPANY</li>
            <li class="header__nav-item">EMPLOYMENT</li>
          </ul>
        </div>
        <div class="right__header">
          <i class="icono-hamburger"></i>
          <span>MENU</span>
        </div>
      </div>
    </header>
    <section class="visual__section">
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="resources/assets/profile.png" alt="logo" />
          </div>
          <div>
            <div class="main__info">
              <strong>방글이</strong>
              <span>Apple.Inc</span>
              <span>Front-end Amazone AWS, github에 관심</span>
            </div>
            <ul class="people__info">
              <li>팔로잉 <strong>102</strong></li>
              <li>팔로워 <strong>502</strong></li>
              <li>연결 <strong>102</strong></li>
            </ul>
          </div>
        </div>
        <button id="popup_open_btn" class="btn visual__right">지원이력</button>
      </div>
    </section>

    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li class="nav-active">PROFILE</li>
            <li>POST</li>
            <li>LIKE</li>
          </ul>
        </div>
        <div class="content__wrapper">
          <div class="section__content__title">
            <strong>한줄 소개</strong>
            <div onclick="oneLineToggle()" class="edit__field">
              <i id="one-line-btn" class="material-icons">create</i>
            </div>
          </div>
          <span class="just__text" id="one-line-info">
            안녕하세요? <br />
            또왔네?
          </span>
          <div id="one-line-input" class="edit-disable">
            <textarea></textarea>
            <button type="button" class="btn">등록</button>
          </div>
        </div>

        <div class="main__main__section">
          <div class="main__section__left">
            <div class="content__wrapper">
              <ul class="left__info">
                <li>TOP</li>
                <li>한줄 소개</li>
                <li>활동분야</li>
                <li>업무분야</li>
                <li>프로젝트</li>
                <li>학력</li>
                <li>인맥</li>
              </ul>
            </div>
          </div>
          <div class="main__section__right">
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>활동분야</strong>
                <div id="edit__act" class="edit__field">
                  <i class="material-icons">create</i>
                </div>
              </div>
              <div class="section__content__box">
                <span class="compindus__box">node.js</span>
                <span class="compindus__box">React.js</span>
                <span class="compindus__box">kotlin</span>
                <span class="compindus__box">JAVA</span>
              </div>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>업무분야</strong>
                <div class="edit__field">
                  <i id="edit__job" class="material-icons">create</i>
                </div>
              </div>
              <span class="just__text"> 금융 핀테크 서비스와 Ai </span>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>프로젝트</strong>
                <div class="edit__field">
                  <i class="material-icons">create</i>
                </div>
              </div>
              <div class="section__content__text">
                <ul>
                  <li><strong>Front-end 개발</strong></li>
                  <li>이상한 프로젝트</li>
                  <li>프로젝트</li>
                </ul>
                <ul>
                  <li><strong>Front-end 개발</strong></li>
                  <li>이상한 프로젝트</li>
                  <li>프로젝트</li>
                </ul>
                <ul>
                  <li><strong>Front-end 개발</strong></li>
                  <li>이상한 프로젝트</li>
                  <li>프로젝트</li>
                </ul>
              </div>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>최종학력</strong>
                <div class="edit__field">
                  <i id="edid__edu" class="material-icons">create</i>
                </div>
              </div>
              <span class="just__text">
                서울대학교 컴퓨터공학부 소프트웨어공학과 졸업
              </span>
            </div>
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>경력</strong>
                <div class="edit__field">
                  <i id="edit__career" class="material-icons">create</i>
                </div>
              </div>
              <span class="just__text">
                구글코리아 2002 ~ 2006 프론트엔드 엔지니어<br />
                야후코리아 2006 ~ 2009 프론트엔드 엔지니어
              </span>
            </div>

            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>인맥</strong>
              </div>
              
              <div class="connection__section__wrapper">

                  <div class="section__member section__connection">
                      <div class="section__header">
                        <strong>팔로워</strong>
                      </div>

                      <!--팔로워 리스트-->
                      
                      <c:forEach var="follower" items="${pCon.get('followers')}">
                      
	                      <div class="content__profile">
	                          <img
	                            class="circle"
	                            src="${pageContext.request.contextPath}/${follower.userAvatar}"
	                           	alt="PROFILE"
	                          />
	                          <div class="content__introduce">
	                            <strong>${follower.userName}</strong>
	                            <p>${follower.userComp}</p>
	                          </div>
	                      </div><!--content__profile-->
                      
                      </c:forEach>

                   
                    
                  </div><!--section__member-->

                  <div class="section__member section__connection">

                      <div class="section__header">
                        <strong>팔로잉</strong>
                      </div>
      
                      <!--팔로잉 리스트-->
                      <c:forEach var="following" items="${pCon.get('followings')}">
                      
	                      <div class="content__profile">
	                          <img
	                            class="circle"
	                            src="${pageContext.request.contextPath}/${following.userAvatar}"
	                            alt="PROFILE"
	                          />
	                          <div class="content__introduce">
	                            <strong>${following.userName}</strong>
	                            <p>${following.userComp}</p>
	                          </div>
	                      </div><!--content__profile-->
                      
                      </c:forEach>

                      
                  
                  </div><!--section__member-->
    
                  <div class="section__member section__connection">
    
                      <div class="section__header">
                        <strong>연결</strong>
                      </div>

                      <!--연결 리스트(자료구조 아님!)-->
                      <c:forEach var="connection" items="${pCon.get('connections') }">
                      
	                      <div class="content__profile">
	                          <img
	                            class="circle"
	                            src="${pageContext.request.contextPath}/${connection.userAvatar}"
	                            alt="PROFILE"
	                          />
	                          <div class="content__introduce">
	                            <strong>${connection.userName}</strong>
	                            <p>${connection.userComp}</p>
	                          </div>
	                      </div><!--content__profile-->
                      
                      </c:forEach>
                  
                  </div><!--section__member-->


              </div><!--connection__section__wrapper-->
              

            	<div class="section__more-member">
            		
                	<button id="moreBtn" class="btn visual__right" onclick="loadMore(${loginUser.userNo},${frPi.currentPage},${fgPi.currentPage},${cnPi.currentPage});">MORE</button>
                	
            	</div>
			
			 
		

            </div><!--content__wrapper-->

          </div>
        </div>
      </div>

      <!-- <a id="topBtn" href="#"
        ><img id="logoDesign" src="resources/assets/avatar.png" alt=""
      /></a> -->
      
      <!-- 팔로우, 팔로잉, 연결 조회 전용 Javascript -->
      <script defer>
      
      	'use strict';
      	
      	
      	//팔로워,팔로잉,연결 모두 현재페이지가 마지막 페이지면 more버튼 비활성화.
  		if(    ${frPi.currentPage}==${frPi.maxPage} 
  			&& ${fgPi.currentPage}==${fgPi.maxPage} 
  			&& ${cnPi.currentPage}==${cnPi.maxPage}){
  			
  			let moreBtn = document.querySelector('#moreBtn');
  			moreBtn.setAttribute('disabled',true);
  				
  		}
      	
      	
      	//리스트 로드 중지 플래그
      	let stopFrLoad = false;
      	let stopFgLoad = false;
      	let stopCnLoad = false;
      
        
      	//"처음" more버튼 누를 때 실행되는 함수
      	const loadMore = function(userNo,frCp,fgCp,cnCp){
      		
      		
      		//현재페이지가 마지막페이지가 아니면 다음페이지(현재페이지+1) 세팅
      		//현재페이지가 마지막페이지면 stopLoad 세팅
      		if(frCp<${frPi.maxPage}){//follower
      			frCp++;
      		}else{
      			stopFrLoad=true;
      		}
      		
      		if(fgCp<${fgPi.maxPage}){//following
      			fgCp++;
      		}else{
      			stopFgLoad=true;
      		}
      		
      		if(cnCp<${cnPi.maxPage}){//connection
      			cnCp++;
      		}else{
      			stopCnLoad=true;
      		}
      		
      		
	      	axios.get('connection2.us',{
	      		params:{
	      			userNo:userNo,
	      			frCp:frCp,
	      			fgCp:fgCp,
	      			cnCp:cnCp
	      		}
	      	})
	      	.then(function(pCon){
	      		
	      		console.log('loadMore통신 성공');
	      		//console.log(pCon);
	            //console.log(pCon.data);
	            //console.log(pCon.data.followings);
	      		
	      		//넘어온 팔로워,팔로잉,연결 리스트 변수에 담아두자.
	      		const frList = pCon.data.followers;
	      		const fgList = pCon.data.followings;
	      		const cnList = pCon.data.connections;
	      		
	      		//리스트를 출력해줄 각 구역 Dom객체 저장
	      		let frArea = document.querySelector(".section__connection:first-child");//팔로워
	      		let fgArea = document.querySelector(".section__connection:nth-child(2)");//팔로잉
	      		let cnArea = document.querySelector(".section__connection:nth-child(3)");//연결

	      		
	      		//가져온 데이터를 가지고 리스트 수정해주기
	      		if(!stopFrLoad){//현재페이지가 마지막페이지가 아닌 경우 리스트 가져옴
	      			
		      		frList.forEach((follower)=>{ //팔로워리스트
		      			let profile = '<div class="content__profile">'
		      							+'<img '
		      								+'class="circle"'
		      								+'src="${pageContext.request.contextPath}/'+follower.userAvatar+'"'
		      								+'alt="PROFILE"'+'/>'
	      								+'<div class="content_introduce">'
	      									+'<strong>'+follower.userName+'</strong>'
	      									+'<p>'+follower.userComp+'</p>'
	    								+'</div>'
	    							 +'</div>';
	 					frArea.insertAdjacentHTML('beforeend',profile);
		      		});
	      			
	      		}
	      		
	      		if(!stopFgLoad){//현재페이지가 마지막페이지가 아닌 경우 리스트 가져옴
	      			
		      		fgList.forEach((following)=>{ //팔로잉리스트
		      			let profile = '<div class="content__profile">'
		      							+'<img '
		      								+'class="circle"'
		      								+'src="${pageContext.request.contextPath}/'+following.userAvatar+'"'
		      								+'alt="PROFILE"'+'/>'
	      								+'<div class="content_introduce">'
	      									+'<strong>'+following.userName+'</strong>'
	      									+'<p>'+following.userComp+'</p>'
	    								+'</div>'
	    							 +'</div>';
	 					fgArea.insertAdjacentHTML('beforeend',profile);
		      		});
	      			
	      		}
	      		
	      		if(!stopCnLoad){//현재페이지가 마지막페이지가 아닌 경우 리스트 가져옴
	      			
		      		cnList.forEach((connection)=>{ //연결리스트
		      			let profile = '<div class="content__profile">'
		      							+'<img '
		      								+'class="circle"'
		      								+'src="${pageContext.request.contextPath}/'+connection.userAvatar+'"'
		      								+'alt="PROFILE"'+'/>'
	      								+'<div class="content_introduce">'
	      									+'<strong>'+connection.userName+'</strong>'
	      									+'<p>'+connection.userComp+'</p>'
	    								+'</div>'
	    							 +'</div>';
	 					cnArea.insertAdjacentHTML('beforeend',profile);
		      		});
	      			
	      		}//리스트 출력 끝
	      		
	      		//현재페이지가 마지막페이지면 stopLoad 활성화
	      		if(pCon.data.piBox[0].currentPage==pCon.data.piBox[0].maxPage){//follower
	      			stopFrLoad=true;
	      		}
	      		if(pCon.data.piBox[1].currentPage==pCon.data.piBox[1].maxPage){//following
	      			stopFgLoad=true;
	      		}
	      		if(pCon.data.piBox[2].currentPage==pCon.data.piBox[2].maxPage){//connection
	      			stopCnLoad=true;
	      		}
	      		
	      		//팔로워,팔로잉,연결 모두 현재페이지가 마지막 페이지면 more버튼 비활성화.
	            if(    stopFrLoad==true
	              	&& stopFgLoad==true
	              	&& stopCnLoad==true){
	  	            let moreBtn = document.querySelector('#moreBtn');
	  	            moreBtn.setAttribute('disabled',true);
	            }
	      		
	      		//더보기버튼 속성 변경
	            if(!document.querySelector('#moreBtn').hasAttribute('disabled')){ //버튼이 비활성화되어있지 않으면 세팅
	            	
		      		document.querySelector('#moreBtn').setAttribute('onclick',
		                        'loadMore2('+${loginUser.userNo}+','
		                        +pCon.data.piBox[0].currentPage+','//follower
		                        +pCon.data.piBox[0].maxPage+','
		                        +pCon.data.piBox[1].currentPage+','//following
		                        +pCon.data.piBox[1].maxPage+','
		                        +pCon.data.piBox[2].currentPage+','//connection
		                        +pCon.data.piBox[2].maxPage+')'
		                      );
	            }
	      		
	      		console.log('loadMore통신 마무리!');
	      	})
	      	.catch(function (error){
	      		console.log(error);
	      	})
      	};
      	
     
        //"두 번" 이상 more버튼 누를 때 실행되는 함수
     	//loadMore2는 유저번호와 팔로우,팔로잉,연결의 현재페이지, 마지막페이지 값을 받는다.
        const loadMore2 = function(userNo,frCp,frMp,fgCp,fgMp,cnCp,cnMp){
          
          //console.log('userno '+userNo);
          //console.log('frCp '+frCp);
          //console.log('frMp '+frMp);
          //console.log('fgCp '+fgCp);
          //console.log('fgMp '+fgMp);
          //console.log('cnCp '+cnCp);
          //console.log('cnMp '+cnMp);
        
          
          //현재페이지가 마지막페이지가 아니면 다음페이지(현재페이지+1) 세팅
          if(frCp<frMp){//follower
            frCp++;
          }
          if(fgCp<fgMp){//following
            fgCp++;
          }
          if(cnCp<cnMp){//connection
            cnCp++;
          }

          
          //------------현재페이지에 관한 세팅 작업 끝
          
          
          // 통신 시작
          axios.get('connection2.us',{
            params:{
              userNo:userNo,
              frCp:frCp,
              fgCp:fgCp,
              cnCp:cnCp
            }
          })
          .then(function(pCon){
        	console.log('loadMore2통신 시작');
            console.log(pCon);
            console.log(pCon.data);
            console.log(pCon.data.followings);
            
            //넘어온 팔로워,팔로잉,연결 리스트 변수에 담아두자.
            const frList = pCon.data.followers;
            const fgList = pCon.data.followings;
            const cnList = pCon.data.connections;
            
            //리스트를 출력해줄 각 구역 Dom객체 저장
            let frArea = document.querySelector(".section__connection:first-child");
            let fgArea = document.querySelector(".section__connection:nth-child(2)");
            let cnArea = document.querySelector(".section__connection:nth-child(3)");

            
          	//가져온 데이터를 가지고 리스트 수정해주기
      		if(!stopFrLoad){//현재페이지가 마지막페이지가 아닌 경우 리스트 가져옴
      			
	      		frList.forEach((follower)=>{ //팔로워리스트
	      			let profile = '<div class="content__profile">'
	      							+'<img '
	      								+'class="circle"'
	      								+'src="${pageContext.request.contextPath}/'+follower.userAvatar+'"'
	      								+'alt="PROFILE"'+'/>'
      								+'<div class="content_introduce">'
      									+'<strong>'+follower.userName+'</strong>'
      									+'<p>'+follower.userComp+'</p>'
    								+'</div>'
    							 +'</div>';
 					frArea.insertAdjacentHTML('beforeend',profile);
	      		});
      			
      		}
      		
      		if(!stopFgLoad){//현재페이지가 마지막페이지가 아닌 경우 리스트 가져옴
      			
	      		fgList.forEach((following)=>{ //팔로잉리스트
	      			let profile = '<div class="content__profile">'
	      							+'<img '
	      								+'class="circle"'
	      								+'src="${pageContext.request.contextPath}/'+following.userAvatar+'"'
	      								+'alt="PROFILE"'+'/>'
      								+'<div class="content_introduce">'
      									+'<strong>'+following.userName+'</strong>'
      									+'<p>'+following.userComp+'</p>'
    								+'</div>'
    							 +'</div>';
 					fgArea.insertAdjacentHTML('beforeend',profile);
	      		});
      			
      		}
      		
      		if(!stopCnLoad){//현재페이지가 마지막페이지가 아닌 경우 리스트 가져옴
      			
	      		cnList.forEach((connection)=>{ //연결리스트
	      			let profile = '<div class="content__profile">'
	      							+'<img '
	      								+'class="circle"'
	      								+'src="${pageContext.request.contextPath}/'+connection.userAvatar+'"'
	      								+'alt="PROFILE"'+'/>'
      								+'<div class="content_introduce">'
      									+'<strong>'+connection.userName+'</strong>'
      									+'<p>'+connection.userComp+'</p>'
    								+'</div>'
    							 +'</div>';
 					cnArea.insertAdjacentHTML('beforeend',profile);
	      		});
      			
      		}//리스트 출력 끝
      		
      		//현재페이지가 마지막페이지면 stopLoad 활성화
      		if(pCon.data.piBox[0].currentPage==pCon.data.piBox[0].maxPage){//follower
      			stopFrLoad=true;
      		}
      		if(pCon.data.piBox[1].currentPage==pCon.data.piBox[1].maxPage){//following
      			stopFgLoad=true;
      		}
      		if(pCon.data.piBox[2].currentPage==pCon.data.piBox[2].maxPage){//connection
      			stopCnLoad=true;
      		}
            
      		//팔로워,팔로잉,연결 모두 현재페이지가 마지막 페이지면 more버튼 비활성화.
            if(    stopFrLoad==true
              	&& stopFgLoad==true
              	&& stopCnLoad==true){
  	            let moreBtn = document.querySelector('#moreBtn');
  	            moreBtn.setAttribute('disabled',true);
            }
      		
            //더보기버튼 속성 변경
            if(!document.querySelector('#moreBtn').hasAttribute('disabled')){ //버튼이 비활성화되어있지 않으면 세팅
            	
	      		document.querySelector('#moreBtn').setAttribute('onclick',
	                        'loadMore2('+${loginUser.userNo}+','
	                        +pCon.data.piBox[0].currentPage+','//follower
	                        +pCon.data.piBox[0].maxPage+','
	                        +pCon.data.piBox[1].currentPage+','//following
	                        +pCon.data.piBox[1].maxPage+','
	                        +pCon.data.piBox[2].currentPage+','//connection
	                        +pCon.data.piBox[2].maxPage+')'
	                      );
            }
            
            
            console.log('loadMore2통신 마무리!');
          })
          .catch(function (error){
            console.log(error);
          })
        };
	        
        
 
      
      </script><!-- 팔로우, 팔로잉, 연결 조회 전용 Javascript 끝 -->
		
	 	
	
      <script>
        $(function () {
          $(window).scroll(function () {
            if ($(this).scrollTop() > 1000) {
              $("#topBtn").fadeIn();
            } else {
              $("#topBtn").fadeOut();
            }
          });

          $("#topBtn").click(function () {
            $("html, body").animate(
              {
                scrollTop: 0,
              },
              400
            );
            return false;
          });
        });
      </script>

      <div id="my_modal">
        지원이력 페이지로 가시겠습니까?
        <a class="modal_close_btn"><i class="icono-crossCircle"></i></a>
      </div>

      <!-- 모달창 자바스크립트 -->
      <script>
        function modal(id) {
          var zIndex = 9999;
          var modal = document.getElementById(id);

          // 모달 div 뒤에 희끄무레한 레이어
          var bg = document.createElement("div");
          bg.setStyle({
            position: "fixed",
            zIndex: zIndex,
            left: "0px",
            top: "0px",
            width: "100%",
            height: "100%",
            overflow: "auto",
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: "rgba(0,0,0,0.4)",
          });
          document.body.append(bg);

          // 링크가기, 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
          modal
            .querySelector(".modal_close_btn")
            .addEventListener("click", function () {
              bg.remove();
              modal.style.display = "none";
            });

          modal.setStyle({
            position: "fixed",
            display: "block",
            boxShadow:
              "0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)",

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div 정렬
            top: "20%",
            left: "70%",
            transform: "translate(-50%, -50%)",
            msTransform: "translate(-50%, -50%)",
            webkitTransform: "translate(-50%, -50%)",
          });
        }

        // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
        Element.prototype.setStyle = function (styles) {
          for (var k in styles) this.style[k] = styles[k];
          return this;
        };

        document
          .getElementById("popup_open_btn")
          .addEventListener("click", function () {
            // 모달창 띄우기
            modal("my_modal");
          });
      </script>
    </main>
	<script>
	  // //왠만해서는 쓰지말자 함수선언식
	  // function a(a, b) {
	  //   return a + b;
	  // }
	  // //함수표현식
	  // const b = function (a, b) {
	  //   return a + b;
	  // };
	  // const c = {
	  //   a() {
	  //     return this;
	  //   },
	  //   b() {
	  //     return 1;
	  //   },
	  // };
	
	  // //화살표함수
	  // const d = (a, b) => a + b;
	
	  const oneLineToggle = () => {
	    document.querySelector("#one-line-info").classList.toggle("edit-disable");
	    document.querySelector("#one-line-input").classList.toggle("edit-disable");
	
	    if (document.querySelector("#one-line-btn").innerText === "create") {
	      document.querySelector("#one-line-btn").innerText = "close";
	    } else {
	      document.querySelector("#one-line-btn").innerText = "create";
	    }
	  };
	</script>
  </body>
</html>

    