<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
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
    <link rel="stylesheet" href="resources/css/profile/profile_like_bookmark.css" />
    <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<jsp:include page="../common/mainMenu.jsp"/>
      <section class="visual__section">
        <div class="inner">
          <div class="visual__left">
            <div class="avatar">
                <img src= "../../assets/profile.png" alt="logo">
            </div>
            <div>
              <div class="main__info">
                <strong>${loginUser.userName}</strong>
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
                      <li>PROFILE</li>
                      <li>POST</li>
                      <li class="nav-active">LIKE</li>
                  </ul>
              </div>
          
    <div class="main__main__section">
        <div class="main__section__left">
            <div class="content__wrapper">
              <ul class="left__info">
                <li>TOP</li>
                <li>팔로잉</li>
                <li>팔로워</li>
                <li>북마크</li>
                <li onClick='location.href="list.sub?uno=${loginUser.userNo}"'>구독기업</li>
                <li>좋아요게시글</li>
                <li>연결</li>
              </ul>
            </div>
        </div>
        <div class="main__section__right">
            <div class="content__wrapper">
                <div class="section__content__title">
                    <strong>북마크한 채용공고</strong>  
                </div>
                <div class="just__text">${blistCount}개의 공고</div>
				<c:forEach var="b" items="${blist}">
				<div onclick='location.href="detail.re?rno=${b.recruitNo}"'>
                <div class="just__text__item">
                    <span class="just__text__title">${b.compName}</span>
                    <span class="just__text__content"><strong>${b.recruitTitle}</strong></span>
                    
                    <c:if test="${b.recruitRequ eq '0'}">
                    	<span class="just__text__recruit">신입</span>
                    </c:if>
                    <c:if test="${b.recruitRequ eq '1'}">
                    	<span class="just__text__recruit">경력</span>
                    </c:if>
                    <c:if test="${b.recruitRequ eq '2'}">
                    	<span class="just__text__recruit">신입 경력</span>
                    </c:if>
                    
                    
                    <a class="section__content__title__cencle" onclick="deleteBtn(${b.recruitNo},${b.userNo});">북마크 제외</a>
                </div>
                <div class="section__content__box">
					<c:forEach var="skill" items="${skillMap.get(b.recruitNo)}">
                    <span class="compindus__box">${skill}</span>
					</c:forEach>


					
                </div> 
                <div class="sysdate">${b.createdAt}</div>
                </div>
                </c:forEach>
                
                <c:if test="${blist != null}">
					<div class="more">
	                  <button class="btn" id="moreBtn" onclick="moreList(${loginUser.userNo},${pi.currentPage});">more</button>
	                </div>
                </c:if>
                <c:if test="${blist == null}">
					
                </c:if>
            </div>
            </div>
                    
        </div>

        </div>
    </div>
                
            <a id="topBtn" href="#"><img id="logoDesign"src="../../assets/avatar.png" alt=""></a>

            <script>
            
            
          	'use strict';
          	
          	//북마크의 현재페이지가 마지막 페이지면 more버튼 비활성화.
      		if(${pi.currentPage}==${pi.maxPage}){
      			let moreBtn = document.querySelector('#moreBtn');
      			moreBtn.setAttribute('disabled',true);	
      		}
          	
            
            
            
            let btn = document.getElementsByClassName("list_more");
            console.log(btn.value());
            const moreList=(uno,currentPage)=>{
            	axios.get('loadMore.bk',{
            		params:{
            		currentPage:crrentPage,
            		userNo:uno
            		}
            	})
            	.then(function(){
            		 alert("북마크취소 되었습니다.");
            	 })
            }
            

             function deleteBtn(bno,uno){
            	 console.log(bno);
            	 console.log(uno);
            	 axios.get('delete.bk',{
            		 params:{
            			 userNo:uno,
            			 recruitNo:bno,
            		 }
            	 })
            	 .then(function(){
            		 alert("북마크취소 되었습니다.");
            		 location.href="list.bk?uno="+uno;
            	 })
            	 
            }
            
            
            
            
            
            
            $(function() { 
              $(window).scroll(function() { 
                if ($(this).scrollTop() > 1000) { 
                  $('#topBtn').fadeIn(); } 
                  else { $('#topBtn').fadeOut(); } }); 

              $("#topBtn").click(function() { 
                $('html, body').animate({ 
                  scrollTop : 0 
               }, 400); 
              return false; }); });





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
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                // 링크가기, 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });
               

                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',
                    
                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,
                    
                    // div 정렬
                    top: '20%',
                    left: '70%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }

            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };

            document.getElementById('popup_open_btn').addEventListener('click', function() {
                // 모달창 띄우기
                modal('my_modal');
            });
        </script>




          </main>
          <jsp:include page="../common/footer.jsp"/>
</body>
</html>