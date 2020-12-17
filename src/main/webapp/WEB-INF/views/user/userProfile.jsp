<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
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
    <link rel="stylesheet" href="resources/css/profile__main.css" />
    <link rel="”stylesheet”" href="”icono.min.css”" />
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>
  <body>
    <jsp:include page="../common/mainMenu.jsp" />

    <section class="visual__section">
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="resources/assets/profile.png" alt="logo" />
          </div>
          <div>
            <div class="main__info">
              <input type="hidden" name="uno" value="${loginUser.email }" id="main-info-email" />
              <input type="hidden" name="uno" value="${loginUser.userNo }" id="main-info-userno" />
              <strong>${ loginUser.userName }</strong> <span>Apple.Inc</span>
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
            <div onclick="oneLineToggle();" class="edit__field">
              <i id="one-line-btn" class="material-icons">create</i>
            </div>
          </div>
          <span class="just__text" id="one-line-info">
		
            		${loginUser.userInfo}<br />

          </span>
          <div id="one-line-input" class="edit-disable">
            <textarea id="one-line-user-info"></textarea>
            <button type="button" onclick="sendUserInfo();" class="btn">등록</button>
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
                <div onclick="userFiledToggle();" class="edit__field">
                  <i class="material-icons" id="user-filed-btn">create</i>
                </div>
              </div>
              <div  id="user-filed-list" class="section__content__box">
                <span class="compindus__box">node.js</span>
                <span class="compindus__box">React.js</span>
                <span class="compindus__box">kotlin</span>
                <span class="compindus__box">JAVA</span>
              </div>
              <div id="user-filed-input" class="edit-disable">
              		<!-- 기술 검색  -->
	              
	              	<input type="text" id="user-filed-search" />
	              
	              	<!-- 기술 관련 검색어 자리  -->
	              	<div id="user-filed-search-list">

	              	</div>
	              	
	              	<br />
	              	<!-- 기술 관련 검색어 입력 결과자리  -->
						<ul class="result_tag"></ul>
	              	
	              	<br />
					
					<button type="button" id="user-filed-final-btn" class="btn">등록</button>

              </div>
            </div>
            
            
            
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>업무분야</strong>
                <div onclick="positionToggle();" class="edit__field">
                  <i id="position-btn" class="material-icons">create</i>
                </div>
              </div>
              
              <span class="just__text" id="position-name"> 
				<c:choose>
					<c:when test="${loginUser.userPosi eq '0' }">
						기획자
					</c:when>
					
					<c:when test="${loginUser.userPosi eq '1' }">
						개발자
					</c:when>
					
					<c:when test="${loginUser.userPosi eq '2' }">
						디자이너
					</c:when>
					
				</c:choose>		
              </span>
            	
	           <div id="position-input" class="edit-disable">
	           <!-- select 박스 크기 조정 하는방법 -->
	            <select id="position-num">
	            	<option value="0">기획자</option>
	            	<option value="1">개발자</option>
	            	<option value="2">디자이너</option>
	            
	            </select>
	            <button type="button" onclick="sendUserPosi();" class="btn">등록</button>
	          </div>
	          
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
                  <i id="edidEdu" class="material-icons">create</i>
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
                구글코리아 2002 ~ 2006 프론트엔드 엔지니어<br />
                야후코리아 2006 ~ 2009 프론트엔드 엔지니어
              </span>
            </div>

            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>구성원</strong>
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
                  <img class="circle" src="assets/logo.png alt="PROFILE">
                  <div class="content__introduce">
                    <strong>손지원</strong>
                    <p>프론트엔드 @구글</p>
                  </div>
                </div>
              </div>

              <div class="section__more-member">
                <button class="btn visual__right">MORE</button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <script>
      
  
      	
		/* 한줄소개 업데이트 */
   		function sendUserInfo(){
	   
	   		const userInfo = document.querySelector("#one-line-user-info").value;
	   		const userNo = document.querySelector("#main-info-userno").value;
			const email = document.querySelector("#main-info-email").value;
	   		
	   		location.href ="update.us?userInfo=" + userInfo + "&userNo=" + userNo + "&email=" + email;
			
   		}
		
   		/* 업무분야 업데이트 */
   		function sendUserPosi(){
	   
	   		const userPosi = document.querySelector("#position-num").value;
	   		const userNo = document.querySelector("#main-info-userno").value;
			const email = document.querySelector("#main-info-email").value;
	   		
	   		location.href ="update.position.us?userPosi=" + userPosi + "&userNo=" + userNo + "&email=" + email;
			
   		}
   
   	
   		


        const oneLineToggle = () => {
          document
            .querySelector("#one-line-info")
            .classList.toggle("edit-disable");
          document
            .querySelector("#one-line-input")
            .classList.toggle("edit-disable");

          if (document.querySelector("#one-line-btn").innerText === "create") {
            document.querySelector("#one-line-btn").innerText = "close";
          } else {
            document.querySelector("#one-line-btn").innerText = "create";
          }
        };
        
        
        /* 포지션용 토글  */
        const positionToggle = () => {
            document
              .querySelector("#position-name")
              .classList.toggle("edit-disable");
            document
              .querySelector("#position-input")
              .classList.toggle("edit-disable");

            if (document.querySelector("#position-btn").innerText === "create") {
              document.querySelector("#position-btn").innerText = "close";
            } else {
              document.querySelector("#position-btn").innerText = "create";
            }
          };
          
          
          /*유저사용기술 토글 */
          const userFiledToggle = () => {
            document
              .querySelector("#user-filed-list")
              .classList.toggle("edit-disable");
            document
              .querySelector("#user-filed-input")
              .classList.toggle("edit-disable");

            if (document.querySelector("#user-filed-btn").innerText === "create") {
              document.querySelector("#user-filed-btn").innerText = "close";
            } else {
              document.querySelector("#user-filed-btn").innerText = "create";
            }
          };
          
          
          
          
          document.querySelector("#user-filed-search").addEventListener("keyup", () => {
        	  	
        	  const skill = document.querySelector("#user-filed-search").value;
        	  console.log(skill);
        	  console.log(skill.length);
        	  
  			 if(skill.length>0)	{
  				 
  				axios.get('search.sk', {
      			    params: {
      			      skillName: skill
      			    }
      			  })
      			  .then(function (response) {
      		    		let searchResult = "";
      				  response.data.forEach(v=>{
      					  
      					searchResult += "&nbsp;<span id='" + v.skillName + "'>" + v.skillName + "</span> <br>"

      				  })
						
 
      				   document.getElementById("user-filed-search-list").innerHTML = searchResult
      				  
      				   
      				   /* 2. result tag에 버튼 만들어주기 */
      				  document.querySelector("#user-filed-search-list").addEventListener("click", ()=>{
      					  

      					  
      				  })
      				   
      				  
      			  })
      			  .catch(function (error) {
      			    console.log(error);
      			  })
      			  .then(function () {
      			    // ...
      			  });

  			 }
    			
        	  
        	  document.querySelector("#user-filed-final-btn").addEventListener("click", () => {

      		})
	
          });
          
          
		

          
          
          
          
        
      </script>

      <jsp:include page="../common/footer.jsp" />
    </main>
  </body>
</html>
