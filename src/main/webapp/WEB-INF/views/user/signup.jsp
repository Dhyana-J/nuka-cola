<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LOGIN || NUKA-COLA</title>
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
    <link rel="stylesheet" href="resources/css/login.css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>
  <body>
  	
  	<jsp:include page="../common/mainMenu.jsp"/>
  	

    <!-- 컨텐츠 -->
    <main>
      <div class="inner">
        <section class="section__login">
          <h1>
            당신의 파트너가 함께 하는&nbsp;곳 <br /><strong>누카콜라</strong
            >입니다.
          </h1>
          <div class="form__container">
          
          <form action="insert.me" method="post">
          
            <div class="login__form initial__info">
              <div class="login__title">
                <h2>SIGNUP</h2>
              </div>
              <div class="input__box">
                <label for="">이메일</label>
                <input type="text" name="email" id="email-check" />
              </div>
              <small id="alert_check_email" class="signup--check">올바른 이메일형식을 입력해주세요</small>
              <small id="alert_dupcheck_email" class="signup--check">중복된 이메일입니다.</small>
              <div class="input__box">
                <label for="">비밀번호</label>
                <input id="password" type="text" name="userPwd" />
              </div>
              <div class="input__box">
                <label for="">비밀번호 확인</label>
                <input id="password-check" type="text" name="checkPwd"/>
              </div>
              <small id="alert_check_pwd" class="signup-check"
                >비밀번호를 확인해주세요</small
              >
              <div class="input__box">
                <label for="">이름</label>
                <input type="text" name="userName"/>
              </div>
              <div class="login__btn__wrapper">
                <button type="button" class="btn">취소</button>
                <button type="button" id="sign-up-next" class="btn btn-blue">
                  다음
                </button>
              </div>
            </div>
            
            
            <div class="login__form more__info">
              <div class="login__title">
                <h2>추가정보</h2>
              </div>
              <div class="input__box">
                <label for="">생년월일</label>
                <input type="text" name="userBirth"/>
              </div>
              <!-- <small class="signup--check">중복된 아이디입니다.</small> -->
              <div class="input__box">
                <label for="position">POSITION</label>
                <!-- 기획자:0 / 개발자:1 / 디자이너:2 -->
                <select name="userPosi" id="position">
                  <option value="0">기획자</option>
                  <option value="1">개발자</option>
                  <option value="2">디자이너</option>
                </select>
              </div>
              <div class="input__box">
                <label for="certifyQ">본인확인 질문</label>
                <select name="certifyQues" id="certifyQ">
                  <option value="출신 초등학교 이름">
                    출신 초등학교 이름은?
                  </option>
                  <option value="어머니의 성함">어머니의 성함은?</option>
                  <option value="나의 보물 1호">나의 보물 1호는?</option>
                </select>
              </div>
              <div class="input__box">
                <label for="">본인확인 응답</label>
                <input type="text" name="certifyAns"/>
              </div>
              <div class="login__btn__wrapper">
                <button type="button" id="sign-up-before" class="btn">
                  이전
                </button>
                <button class="btn btn-blue">회원가입</button>
              </div>
            </div>
            
           </form>
            
          </div><!-- form__container -->
        </section>
        <div class="section__banner">
          <div class="img__wrapper">
            <img src="resources/assets/loginImage.jpg" alt="" />
          </div>
          <ul class="login__nav">
            <li onClick='location.href="loginForm.me"'>
              <span>회원이신가요?</span>
              <b>LOGIN</b>
            </li>
            <li>
              <span>처음방문이신가요?</span>
              <b>SIGNUP</b>
            </li>
            <li onClick='location.href="/views/timeline/index.jsp"'>
              <span>돌러보기</span>
              <b>MORE</b>
            </li>
          </ul>
        </div>
      </div>
    </main>
    
    <script defer>
    
      // 다음버튼
      document.querySelector("#sign-up-next").addEventListener("click", () => {
        document
          .querySelector(".form__container")
          .classList.toggle("form_move");
      });
      //이전버튼
      document
        .querySelector("#sign-up-before")
        .addEventListener("click", () => {
          document
            .querySelector(".form__container")
            .classList.toggle("form_move");
        });
      
      /*--- 이하 준호 작성 ---*/
      // 비밀번호확인 체크
      document
        .querySelector("#password-check")
        .addEventListener("input", (e) => {
          if (document.querySelector("#password").value !== e.target.value) {
            document.querySelector("#alert_check_pwd").style.display = "block";
            console.log(document.querySelector("#password").value);
            console.log(e.target.value);
          } else {
            document.querySelector("#alert_check_pwd").style.display = "none";
          }
        });
   	  // 아이디 체크
      document
        .querySelector("#email-check")
        .addEventListener("input",(e)=>{
       	 
   		  document.querySelector("#alert_dupcheck_email").style.display='none';
   		  document.querySelector("#alert_check_email").style.display="none";
        	
          //정규표현식 출처 : https://emailregex.com/
          let checkEmail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
          
          if(!checkEmail.test(e.target.value)){ // 이메일 형식이 올바르지 않은 경우

            document.querySelector("#alert_check_email").style.display="block";
            document.querySelector("#sign-up-next").disabled='true'; // 다음버튼 비활성화

          }else{ // 이메일 형식이 올바른 경우

            document.querySelector("#alert_check_email").style.display="none";
            document.querySelector("#sign-up-next").removeAttribute('disabled'); //다음 버튼 활성화
            
            //여기에 비동기식 이메일 중복체크 기술해줄까?
       		axios.get('checkEmail.me',{
       			params:{
       				email:e.target.value
       			}
       		})
       		.then(function(dupCount){
       			
       			if(dupCount.data==0){ //이메일 중복 아닌 경우 (dupCount.data값이 0인 경우)
                    document.querySelector("#alert_dupcheck_email").style.color='#30409f';
                    document.querySelector("#alert_dupcheck_email").innerText='사용 가능한 이메일입니다.';
            		document.querySelector("#alert_dupcheck_email").style.display='block';
            		document.querySelector("#sign-up-next").removeAttribute('disabled'); //다음 버튼 활성화
            		
            	}else{ //이메일 중복되는 경우 (dupCount.data값이 0이 아닌 경우)
                    document.querySelector("#alert_dupcheck_email").style.color='#ff0000';
                    document.querySelector("#alert_dupcheck_email").innerText='중복된 이메일입니다.';
            		document.querySelector("#alert_dupcheck_email").style.display="block";
            		document.querySelector("#sign-up-next").disabled='true'; // 다음버튼 비활성화
            		
            	}
       		})
       		.catch(function(){
       			console.log('통신실패');
       		})
            
            
          }//else끝
       	});//addEventListener끝

    </script>
  </body>
</html>
