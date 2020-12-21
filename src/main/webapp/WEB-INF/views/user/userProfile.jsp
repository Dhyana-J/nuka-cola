<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css"
	integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw=="
	crossorigin="anonymous" />

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link rel="stylesheet" href="resources/css/common.css" />
<link rel="stylesheet" href="resources/css/profile__main.css" />
<link rel=”stylesheet” href=”icono.min.css”>
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

	<jsp:include page="../common/mainMenu.jsp" />

	<section class="visual__section">
		<div class="inner">
			<div class="visual__left">
				<div class="avatar">
					<img src="resources/assets/profile.png" alt="logo">
				</div>
				<div>
					<div class="main__info">
						<input type="hidden" name="uno" value="${loginUser.email }"
							id="main-info-email" /> <input type="hidden" name="uno"
							value="${loginUser.userNo }" id="main-info-userno" /> <strong>${ loginUser.userName }</strong>
						<span>Apple.Inc</span> <span>Front-end Amazone AWS, github에
							관심</span>
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

				<span class="just__text" id="one-line-info"> 안녕하세요? <br>
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
								<i class="material-icons" id="editField">create</i>
							</div>
						</div>
						<div class="section__content__box">
							<span class="compindus__box">node.js</span> <span
								class="compindus__box">React.js</span> <span
								class="compindus__box">kotlin</span> <span
								class="compindus__box">JAVA</span>
						</div>
					</div>
					<div class="content__wrapper">
						<div class="section__content__title">
							<strong>업무분야</strong>
							<div class="edit__field">
								<i id="editTech" class="material-icons">create</i>
							</div>
						</div>
						<span class="just__text"> 금융 핀테크 서비스와 Ai </span>
					</div>
					
					
					
					                    <div class="content__wrapper">

                        <div class="section__content__title">

                            <strong>프로젝트</strong>

                            <div onclick="projectToggle()" class="edit__field">
                                <i id="project-btn" class="material-icons">create</i>
                            </div>
                            
                        </div>
                        <span class="just__text" id="project-name">
                          <div>
                            <ul class="user__project__section">
                              <li>야후코리아 페쇄</li>
                              <li>백엔드</li>
                              <li>2020/01/01 ~ 2020/04/05</li>
                            </ul> 
                          </div>
                        </span>
                        <div class="edit-disable" id="project-input">

                          <form action="update.project" method="post">
                            
                              <span>프로젝트명 : </span>
                              <input type="text" name="projectName" placeholder="예) 야후코리아 폐쇄">
                              <br>
                              <br>
                             
                              <span>주요업무 : </span> 
                              <input type="text" name="pPosition" placeholder=" 주요업무를 입력해주세요 예) Front-end"> 
                              <br>
                              <br>
                            
                              <span>기간 : </span>
                              <input type="text" name="projectStart" placeholder="시작기간을 입력해주세요 예) 2020.01.01"> ~
                              <input type="text" name="projectEnd" placeholder="마친기간을 입력해주세요">
                              <br> <br><br>
                                <div id="">
                                  <button type="button" onclick="sendUserProject();" class="btn">등록</button>
                                </div>
                           
                          </form>

                        </div>

                    </div>
					<div class="content__wrapper">
						<div class="section__content__title">
							<strong>최종학력</strong>
							<div onclick="threeLineToggle()" class="edit__field">
								<i id="one-line-btn" class="material-icons">create</i>
							</div>
						</div>
						<span class="just__text" id="three-line-edu">

							${loginUser.userEdu} </span>

						<div id="three-line-input" class="edit-disable">
							<textarea name="userEdu" id="three-line-user-edu"
								placeholder="예) 한국대학교 이순신학과 졸업"></textarea>
							<button type="button" class="btn" onclick="sendUserEdu();">등록</button>
						</div>

					</div>
					<div class="content__wrapper">
						<div class="section__content__title">
							<strong>경력</strong>
							<div class="edit__field">
								<i id="editCareer" class="material-icons">create</i>
							</div>
						</div>
						<span class="just__text"> 구글코리아 2002 ~ 2006 프론트엔드 엔지니어<br>
							야후코리아 2006 ~ 2009 프론트엔드 엔지니어
						</span>
					</div>

					<div class="content__wrapper">
						<div class="section__content__title">
							<strong>구성원</strong>
						</div>

						<div class="section__member">
							<div class="content__profile">
								<img class="circle" src="assets/logo.png" alt="PROFILE">
								<div class="content__introduce">
									<strong>성수지</strong>
									<p>프론트엔드 @구글</p>
								</div>
							</div>
							<div class="content__profile">
								<img class="circle" src="assets/logo.png" alt="PROFILE">
								<div class="content__introduce">
									<strong>배진원</strong>
									<p>프론트엔드 @구글</p>
								</div>
							</div>
							<div class="content__profile">
								<img class="circle" src="assets/logo.png" alt="PROFILE">
								<div class="content__introduce">
									<strong>유원근</strong>
									<p>프론트엔드 @구글</p>
								</div>
							</div>
							<div class="content__profile">
								<img class="circle" src="assets/logo.png" alt="PROFILE">
								<div class="content__introduce">
									<strong>정찬복</strong>
									<p>프론트엔드 @구글</p>
								</div>
							</div>
							<div class="content__profile">
								<img class="circle" src="assets/logo.png" alt="PROFILE">
								<div class="content__introduce">
									<strong>김준호</strong>
									<p>프론트엔드 @구글</p>
								</div>
							</div>
							<div class="content__profile">
								<img class="circle" src="assets/logo.png" alt="PROFILE">
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

		<jsp:include page="../common/footer.jsp" />

		<script>

		  
		/* 최종학력 */
		
		function sendUserEdu() {
			
			const userEdu = document.querySelector("#three-line-user-edu").value;
			const userNo = document.querySelector("#main-info-userno").value;
			const email = document.querySelector("#main-info-email").value;
		
			location.href ="update.edu.us?userEdu=" + userEdu + "&userNo=" + userNo + "&email=" + email;
			
		}
		
		/*프로젝트 */
		
		function sendUserProject() {
             const projectName = document.querySelector("#projectName").value;
             const position = document.querySelector("#pPosition").value;
             const pStart = document.querySelector("projectStart").value;
             const pEnd = document.querySelector("projectEnd").value;
             location.href="insert.project.us?userProject=" + projectName + "&userNo" + userNo;
  
        }
		
		
		
		/*최종학력 아이콘 버튼용*/
		const threeLineToggle = () => {
			    	
			 document
			    .querySelector("#three-line-edu")
			    .classList.toggle("edit-disable");
			    
			 document
			    .querySelector("#three-line-input")
			    .classList.toggle("edit-disable");
			
			    if (document.querySelector("#one-line-btn").innerText === "create") {
			      document.querySelector("#one-line-btn").innerText = "close";
			    } else {
			      document.querySelector("#one-line-btn").innerText = "create";
			    }
			  };
			  
		/* 프로젝트 아이콘 버튼용*/
		
		 const projectToggle = () => {
               document
                  .querySelector("#project-name")
                  .classList.toggle("edit-disable");

               document
                  .querySelector("#project-input")
                  .classList.toggle("edit-disable");

               if(document.querySelector("#project-btn").innerText === "create") {
                  document.querySelector("#project-btn").innerText = "close"
               }else{
                  document.querySelector("#project-btn").innerText = "create";
                  }
         }
			  
			  
			  
			  
			  
			  
			  
			  
	</script>


	</main>
</body>
</html>