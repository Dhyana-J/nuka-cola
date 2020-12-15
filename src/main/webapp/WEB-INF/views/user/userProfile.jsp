<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <link rel="stylesheet" href="resources/css/profile__main.css" />
    <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	
	<jsp:include page="../common/mainMenu.jsp"/>

      <section class="visual__section">
        <div class="inner">
          <div class="visual__left">
            <div class="avatar">
                <img src= "resources/assets/profile.png" alt="logo">
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
              
              <form id="updateForm" method="post" action="">
              
              <div class="content__wrapper">
                <div class="section__content__title">
                    <strong>한줄 소개</strong>
                    <div class="edit__field" >
                        <i class="material-icons" id="editIntroduce">create</i>
                    </div>
                </div>
                <span class="just__text">
                    	안녕하세요? <br>
                    	또왔네?
                </span>
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
                                <i class="material-icons" id="editField">create</i>
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
                                <i id="editTech" class="material-icons">create</i>
                            </div>
                        </div>
                        <span class="just__text">
                         	 금융 핀테크 서비스와 Ai
                      </span>
                    </div>
                    <div class="content__wrapper">
                        <div class="section__content__title">
                            <strong>프로젝트</strong>
                            <div class="edit__field">
                                <i id="editProject" class="material-icons">create</i>
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
                              <i id="edidEdu"class="material-icons">create</i>
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
                              <i id="editCareer" class="material-icons">create</i>
                          </div>
                      </div>
                      <span class="just__text">
			                        구글코리아 2002 ~ 2006 프론트엔드 엔지니어<br>
			                        야후코리아 2006 ~ 2009 프론트엔드 엔지니어
                    </span>
                   </div>

                   <div class="content__wrapper">
                        <div class="section__content__title">
                            <strong>구성원</strong>
                        </div>

                        <div class="section__member">
                            <div class="content__profile">
                                <img class="circle" src="../../assets/wonbin.jpeg" alt="PROFILE">
                                <div class="content__introduce">
                                    <strong>성수지</strong>
                                    <p>프론트엔드 @구글</p>
                                </div>
                            </div>
                            <div class="content__profile">
                                <img class="circle" src="../../assets/JonahHill.jpg" alt="PROFILE">
                                <div class="content__introduce">
                                    <strong>배진원</strong>
                                    <p>프론트엔드 @구글</p>
                                </div>
                            </div>
                            <div class="content__profile">
                                <img class="circle" src="../../assets/wonbin.jpeg" alt="PROFILE">
                                <div class="content__introduce">
                                    <strong>유원근</strong>
                                    <p>프론트엔드 @구글</p>
                                </div>
                            </div>
                            <div class="content__profile">
                                <img class="circle" src="../../assets/wonbin.jpeg" alt="PROFILE">
                                <div class="content__introduce">
                                    <strong>정찬복</strong>
                                    <p>프론트엔드 @구글</p>
                                </div>
                            </div>
                            <div class="content__profile">
                                <img class="circle" src="../../assets/wonbin.jpeg" alt="PROFILE">
                                <div class="content__introduce">
                                    <strong>김준호</strong>
                                    <p>프론트엔드 @구글</p>
                                </div>
                            </div>
                            <div class="content__profile">
                                <img class="circle" src="assets/logo.png alt="PROFILE">
                                <div class="content__introduce">
                                    <strong>손지원</strong>
                                    <p>프론트엔드 @구글</p>
                                </div>
                            </div>

                        </div>
			</form>
          
                        <div class="section__more-member">
                          <button class="btn visual__right">MORE</button>
                        </div>
                    </div>
                </div>
              </div>
            </div>


	
	
			


            <a id="topBtn" href="#"><img id="logoDesign"src="../../assets/avatar.png" alt=""></a>

            <script>

            $(function() { 
              $(window).scroll(function() { 
                if ($(this).scrollTop() > 800) { 
                  $('#topBtn').fadeIn(); } 
                  else { $('#topBtn').fadeOut(); } }); 

              $("#topBtn").click(function() { 
                $('html, body').animate({ 
                  scrollTop : 0 
               }, 400); 
              return false; }); });


            </script>

            <div id="my_modal">
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
                    top: '50%',
                    left: '50%',
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
            
            document.getElementById('editIntroduce').addEventListener('click', function() {
                // 모달창 띄우기
                modal('my_modal');
            });
            document.getElementById('editField').addEventListener('click', function() {
                // 모달창 띄우기
                modal('my_modal');
            });
            document.getElementById('editTech').addEventListener('click', function() {
                // 모달창 띄우기
                modal('my_modal');
            });
            document.getElementById('editProject').addEventListener('click', function() {
                // 모달창 띄우기
                modal('my_modal');
            });
            document.getElementById('editEdu').addEventListener('click', function() {
                //모달창 띄우기
                modal('my_modal');
            });
            document.getElementById('editCareer').addEventListener('click', function() {
                //모달창 띄우기
                modal('my_modal');
            });
            
            
        </script>
			        
		<jsp:include page="../common/footer.jsp"/>

 </main>
	


</body>
</html>