<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>COPANY__ENROLLFORM || NUKA-COLA</title>
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
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/company.css" />
    
  </head>
  <body>
  
  <jsp:include page="../common/mainMenu.jsp"/>
  
  	<c:if test="${!empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
  
    
    <!--  컨텐츠 -->
    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <span>기업등록</span>
        </div>
      <form method="post" action="insert.co" enctype="multipart/form-data">
      <input type="hidden" value="${ loginUser.userNo }" name = userNo />
        <div class="main__main__section">
          <div class="main__section__content">
            <div class="content__wrapper">
              <div class="section__compLogo">
                <div class="avatar__company">
                  <img src="resources/assets/avatar.png" alt="comapnyLogo" id="companyLogo"/>
                </div>
                <div class="main__info">
                  <strong>로고</strong>
                  <input type="file" id="upfile" name="upfile" style="display:none;" />
                  <label class="btn__attachment" for="upfile">찾아보기</label>
                  <strong>설립일</strong>
                  <input
                    type="text"
                    name="compBirth"
                    placeholder="ex) 2012-11-11"
                    required
                  />
                </div>
              </div>
            </div>

            <div class="content__wrapper">
              <div class="section__compName">
                <strong>기업명</strong>
                <input type="text" name="compName" placeholder="COMPANY" required/>
                <span>허위기업이나 기업이름이 중복될 경우 경고없이 삭제될 수있습니다.</span>
              </div>
            </div>
            <div class="content__wrapper">
              <div class="section__main">
                <strong>기업소개</strong>
                <input
                  type="text"
                  name="compInfo"
                  placeholder="기업을 소개해주세요"
                />
              </div>
            </div>
            <div class="content__wrapper">
              <strong>산업분야</strong>
              <div class="section__compindus">
                <input
                  type="checkbox"
                  class="comp-indus"
                  name="compindus"
                  value="0"
                />
                <label for="webservice">웹서비스</label>
                <input
                  type="checkbox"
                  class="comp-indus"
                  name="compindus"
                  value="1"
                />
                <label for="mobile">모바일</label>
                <input
                  type="checkbox"
                  class="comp-indus"
                  name="compindus"
                  value="2"
                />
                <label for="E-service">E-service</label>
                <input 
                  type="checkbox" 
                  class="comp-indus" 
                  name="compindus" 
                  value="3" 
                />
                <label for="IoT">IoT</label>
                <input 
                  type="checkbox" 
                  class="comp-indus" 
                  name="compindus" 
                  value="4" 
                />
                <label for="o2o">o2o</label>
                <input
                  type="checkbox"
                  class="comp-indus"
                  name="compindus"
                  value="5"
                />
                <label for="fintech">핀테크</label>
              </div>
            </div>
            <div class="content__wrapper">
              <div class="section__techstack">
                <strong>테크스택</strong>
                
                
                <span>FRONT-END</span>
                <input type="hidden" name="skillList[0].skillName" id="front-skill-list"/>
                <input type="text" id="front-search"/>         
                <div id="front-search-list">
					<!-- 기술 관련 검색어 리스트 자리 -->
	             </div>
                <br />	
				<ul class="front_result">
					<!-- 기술 관련 검색어 입력 결과자리  -->
				</ul>
				<br />
				
				
                <span>BACK-END</span>
                <input type="hidden" name="skillList[1].skillName" id="back-skill-list"/>
                <input type="text" id="back-search"/>

                <div id="back-search-list">
					<!-- 기술 관련 검색어 리스트 자리 -->
	             </div>
                <br />	
				<ul class="back_result">
					<!-- 기술 관련 검색어 입력 결과자리  -->
				</ul>
				<br />
                
                
                <!--  -->  
                <span>DEV-OPS</span>
                <input type="hidden" name="skillList[2].skillName" id="dev-skill-list"/>
                <input type="text" id="dev-search"/>

                <div id="dev-search-list">
					<!-- 기술 관련 검색어 리스트 자리 -->
	             </div>
                <br />	
				<ul class="dev_result">
					<!-- 기술 관련 검색어 입력 결과자리  -->
				</ul>
				<br />
                
                
                
                <span>기타</span>
                <input type="hidden" name="skillList[3].skillName" id="etc-skill-list"/>
                <input type="text" id="etc-search"/>
                <div id="etc-search-list">
					<!-- 기술 관련 검색어 리스트 자리 -->
	             </div>
                <br />	
				<ul class="etc_result">
					<!-- 기술 관련 검색어 입력 결과자리  -->
				</ul>
				<br />
                
              </div>
            </div>
            <div class="content__wrapper">
              <div class="section__compEmail">
                <strong>기업 이메일</strong>
                <input
                  type="text"
                  name="compEmail"
                  placeholder="ex) company@gmail.com"
                />
              </div>
            </div>
            <div class="content__wrapper">
              <strong>구성원</strong>
                <div class="section__headCount">
                  <input
                  type="radio"
                  id="ten"
                  name="headCount"
                  value="1~10명"
                />
                <label for="ten">1~10명</label>
                <input
                  type="radio"
                  id="hundred"
                  name="headCount"
                  value="11~100명"
                />
                <label for="hundred">11~100명</label>
                <input
                  type="radio"
                  id="fivehundred"
                  name="headCount"
                  value="101~500명"
                />
                <label for="fivehundred">101~500명</label>
                <input 
                  type="radio"
                  id="thousand" 
                  name="headCount" 
                  value="501~1000명"
                />
                <label for="thousand">501~1000명</label>
                <input 
                  type="radio" 
                  id="fivethousand" 
                  name="headCount" 
                  value="1001~5000명"
                />
                <label for="fivethousand">1001~5000명</label>
                <input
                  type="radio"
                  id="fivethousandover"
                  name="headCount"
                  value="5000명 초과"
                />
                <label for="fivethousandover">5000명 초과</label>
                </div>
            </div>
            <div class="content__wrapper">
              <div class="section__compAddress">
                <strong>기업주소</strong>
                <input type="text" name="compAddress" />
              </div>
            </div>
          </div>
          <div class="main__section__aside">
            <div class="content__wrapper">
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>로고/설립일</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>기업명</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>기업소개</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>산업분야</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>테크스택</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>이메일</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>구성원</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>주소</span>
                </div>
              </label>
              <button class="btn" type="submit">기업등록</button>
            </div>
          </div>
        </div>
      </form>
      </div>
    </main>
  </body>
  
  <script defer>
  	'use strict'
  			/* 프로필 이미지 변경 */
		
				document.querySelector("#upfile").addEventListener("change", (input) => {
	
					let fileList = document.querySelector("#upfile").files;
					
					if(fileList.length == 1) {
						// 파일 읽을 객체 생성
						let reader = new FileReader();
						
						// 파일을 읽는 순간 고유한 url 부여
						reader.readAsDataURL(fileList[0]);
							
						// 파일 읽기 완료시 실행할 함수
						reader.onload = function(){
							document.querySelector("#companyLogo").setAttribute("src", reader.result);
							
						}
	
			
					}else {
						// 파일 업로드 취소할시 다시 원상복귀
						document.querySelector("#companyLogo").setAttribute("src", "resources/assets/avatar.png");
						
					}
				
				
				})
					

				
				
			/* 프론트 엔드 기술 체크 부분 */	
			document.querySelector("#front-search").addEventListener("input", (e) => {
		
			const skill = e.target.value;	
			console.log(skill);
			console.log(skill.length);
			if(skill.length>0)	{
	
				checkSkill(skill,e);

			}

			});
  	
  	
  	
			/* 백 엔드 기술 체크 부분 */	
			document.querySelector("#back-search").addEventListener("input", (e) => {
		
			const skill = e.target.value;	

			if(skill.length>0)	{
	
				checkSkill(skill,e);

			}

			});
			
			
			/* 데브옵스 기술 체크 부분 */	
			document.querySelector("#dev-search").addEventListener("input", (e) => {
		
			const skill = e.target.value;	

			if(skill.length>0)	{
	
				checkSkill(skill,e);

			}

			});
			
			/* 기타 기술 체크 부분 */	
			document.querySelector("#etc-search").addEventListener("input", (e) => {
		
			const skill = e.target.value;	

			if(skill.length>0)	{
	
				checkSkill(skill,e);

			}

			});
 	
				// 스킬 리스트 검사용 axios
			const checkSkill = (skill,e)=>{

				   axios.get('search.sk', {
						params: {
							skillName: skill
						}
					})
						   .then(function (response) {
		
								let searchResult = "";
								response.data.forEach(v=>{
		
									searchResult += "<span id='" + v.skillName + "'>" + v.skillName + "</span> <br>"
		
								})
								
								/* 기술 목록 리스트 보여주기 용 */
								/* #???-search-list */
								let skillSearchList = e.target.nextSibling.nextSibling.id;
								
								document.getElementById(skillSearchList).innerHTML = searchResult

							})
							.catch(function (error) {
								console.log(error);
							})
							.then(function () {
								// ...
							});

			}
				   
		
		/* 1. front result tag에 버튼 만들어주기 */
		document.querySelector("#front-search-list").addEventListener("click", function (e) {
	
			tagList = document.querySelector(".front_result");
			/* 검색결과리스트의 기술 이름 클릭시 기술이름 값 가져오기 */
			let tagName = e.target.innerText;
			
			createTag(tagName);
			
			let frontSkill = document.querySelectorAll(".front_result li>span");
			let frontSkillList = "";
			frontSkill.forEach(s => {
				frontSkillList += s.innerText + " ";
			})
			
			console.log(frontSkillList);
			
			document.querySelector("#front-skill-list").value = frontSkillList;
	
			
			document.querySelector("#front-search").value = " ";
			
		});
	
		/* 2. back result tag에 버튼 만들어주기 */
		document.querySelector("#back-search-list").addEventListener("click", function (e) {
	
			tagList = document.querySelector(".back_result");
			/* 검색결과리스트의 기술 이름 클릭시 기술이름 값 가져오기 */
			let tagName = e.target.innerText;
			
			createTag(tagName);
			
			let backSkill = document.querySelectorAll(".back_result li>span");
			let backSkillList = "";
			backSkill.forEach(s => {
				backSkillList += s.innerText + " ";
			})
			
			console.log(backSkillList);
			
			document.querySelector("#back-skill-list").value = backSkillList;
						
			document.querySelector("#back-search").value = " ";
		});
		
		/* 2. dev result tag에 버튼 만들어주기 */
		document.querySelector("#dev-search-list").addEventListener("click", function (e) {
	
			tagList = document.querySelector(".dev_result");
			/* 검색결과리스트의 기술 이름 클릭시 기술이름 값 가져오기 */
			let tagName = e.target.innerText;
			
			createTag(tagName);
			
			let devSkill = document.querySelectorAll(".dev_result li>span");
			let devSkillList = "";
			devSkill.forEach(s => {
				devSkillList += s.innerText + " ";
			})
			
			console.log(devSkillList);
			
			document.querySelector("#dev-skill-list").value = devSkillList;
			
			
			document.querySelector("#dev-search").value = " ";
		});
		
		/* 2. etc result tag에 버튼 만들어주기 */
		document.querySelector("#etc-search-list").addEventListener("click", function (e) {
	
			tagList = document.querySelector(".etc_result");
			/* 검색결과리스트의 기술 이름 클릭시 기술이름 값 가져오기 */
			let tagName = e.target.innerText;
			
			createTag(tagName);
			
			let etcSkill = document.querySelectorAll(".etc_result li>span");
			let etcSkillList = "";
			etcSkill.forEach(s => {
				etcSkillList += s.innerText + " ";
			})
			
			console.log(etcSkillList);
			
			document.querySelector("#etc-skill-list").value = etcSkillList;
			

			document.querySelector("#etc-search").value = " ";
		});
		
		

		let tagList = "";
		let TagList = [];
		const TAG_LS = "tag";
		
		
		

		const filter = (toDo) => {
			return toDo.id === 1;
		}

		/* 태그 삭제용 함수 */
		const deleteTag = (event) => {
			const btn = event.target;
			const li = btn.parentNode;
			tagList.removeChild(li);

			const cleanTag = TagList.filter(function(toDo) {
				return toDo.id !== parseInt(li.id);
			});
			TagList = cleanTag;
			saveTag();
		}

		const saveTag = () => {
			localStorage.setItem(TAG_LS, JSON.stringify(TagList)); // 자바스크립트object를 string으로 변환
		}


		/* 태그 생성용 함수 */
		const createTag = (tagName) => {
	
			const li = document.createElement("li");
			const delBtn = document.createElement("i");

			delBtn.innerText = "close";
			delBtn.className = "material-icons"

			const span = document.createElement("span");
			const newId = TagList.length + 1;
			span.innerText = tagName;
			li.appendChild(span);
			li.appendChild(delBtn);
			li.id = newId;

			delBtn.addEventListener("click", deleteTag);
			tagList.appendChild(li);

			const TagObj = {
				skillName : tagName,
				id: newId
			};

			TagList.push(TagObj);
			saveTag();
			
			console.log(TagList);

		}
		
		

			
		

  </script>
  
</html>
