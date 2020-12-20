<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    
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
    <link rel="stylesheet" href="resources/css/profile/profile(script-company).css" />
    <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
     <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
                        <li onClick='location.href="insert.sub?uno=${loginUser.userNo}"'>구독기업</li>
                        <li>좋아요게시물</li>
                        <li>연결</li>
                      </ul>
                    </div>
                </div>
                <div class="main__section__right">
                    
                    
                  <div class="content__wrapper">
                    <div class="section__content__title">
                        <strong>구독기업</strong>
                      </div><br>
                          <span class="following__much">&nbsp;
                            <strong>${csCount}</strong>개의 공고
                          </span>
                    <br><br>
                    	<c:forEach var="cs" items="${cslist}">
                          <div class="script__company__box" onclick='location.href="list.co?cno=${cs.compNo}"'>
                            <div class="company__box__left">
                                <div class="company__img__box">
                                <img src="resources/assets/${cs.compLogo}" alt="">
                                </div>
                                <ul>
                                    <li class="company__info__title">${cs.compName}<span>구성원수[${cs.compHeadcount}]&nbsp;&nbsp;Sinece${cs.compBirth}</span> </li>
                                    <li>${cs.compInfo}</li>
                                </ul>
                            </div>
                            <div class="company__box__right">
                                <span onclick= "CSdeleteBtn(${cs.compNo},${cs.userNo});">삭제</span>
                            </div>

                          </div>

                   	 </c:forEach>
                   	 
                   	 <c:if test="${cslist != null || csCount<pi.boardLimit}">
						<div class="more">
		                  <button class="btn" id="moreBtn" onclick="moreList(${loginUser.userNo},${pi.currentPage});">more</button>
		                </div>
	                </c:if>
	                <c:if test="${cslist == null}">
                    </c:if>



                   </div>
                </div>
              </div>
            </div>


            <a id="topBtn" href="#"><img id="logoDesign"src="../../assets/avatar.png" alt=""></a>

            <script der>
            
            if(${pi.currentPage}==${pi.maxPage}){
  			let moreBtn = document.querySelector('#moreBtn');
  			moreBtn.setAttribute('disabled',true);
  				
  		    }

            function CSdeleteBtn(cs,uno){
           	 console.log(cs);
           	 console.log(uno);
           	 axios.get('delete.sub',{
           		 params:{
           			 userNo:uno,
           			 compNo:cs,
           		 }
           	 })
           	 .then(function(){
           		 alert("구독이 취소 되었습니다.");
           		 location.href="list.sub?uno="+uno;
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