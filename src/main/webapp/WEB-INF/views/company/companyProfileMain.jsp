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
    <link rel="stylesheet" href="resources/css/profile/profile(member-modal).css" />
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/company.css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script defer src="resources/js/company/search-comp-member.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  </head>
  <body>
 
 	<jsp:include page="../common/mainMenu.jsp"/>
 
    <section class="visual__section">
    
    	<!--  -->
    
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="resources/assets/avatar.png" alt="logo" />
          </div>
          <div>
            <div class="main__info">
              <strong>${ c.compName }</strong>
              <span>Since ${ c.compBirth }</span>
              <span>${ c.headCount }</span>
              <span>${ c.compEmail }</span>
            </div>
            <ul class="people__info">
              <li>팔로우 <strong>102</strong></li>
              <li>채용중인글 <strong>3</strong></li>
            </ul>
          </div>
        </div>
        <button class="btn visual__right" id="add__member__open">
          구성원 추가
        </button>
      </div>
      
      
      
    </section>

    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li class="nav-active" onclick='location.href="profileMain.co?cno=${c.compNo}"'>ABOUT</li>
            <li onclick='location.href="recruit.co?cno=${c.compNo}"'>채용</li> <%--현재페이지의 회사일련번호 넘겨줘야함 --%>
            <li><a href="profileMember.co?cno=${c.compNo }&currentPage=1">구성원</a></li>
          </ul>
        </div>
        
        
        <!-- 기업 한줄 소개 -->
        
        <div class="content__wrapper ">
        
          <div class="section__content__title" >
          	<input type="hidden" id="comp-no" value="${ c.compNo }" />
            <strong>기업 소개</strong>
            <c:if test="${loginUser.userNo eq c.userNo }">
            <div  class="edit__field" onclick = "companyIntroToggle()">
              <i class="material-icons" id="intro-btn">create</i>
            </div>
            </c:if>
          </div>
          
          <span class="just__text" id="intro-info">
            	${ c.compInfo }
          </span>
          
            <div id="intro-input" class="edit-disable">
            <textarea id="intro-get-info"></textarea>
            <button type="button"  onclick="sendCompanyInfo();" class="btn">등록</button>
          </div>
          
        </div>
        <div class="main__main__section">
          <div class="main__section__left">
            <div class="content__wrapper">
              <ul class="left__info">
                <li>TOP</li>
                <li>기업소개</li>
                <li><strong>산업분야</strong></li>
                <li>테크스택</li>
                <li>지역</li>
              </ul>
            </div>
          </div>
          
          
          
          <!-- 산업 분야 -->
          
          
          <div class="main__section__right">
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>산업분야</strong>
                <c:if test="${loginUser.userNo eq c.userNo }">
                <div onclick="indusToggle()" class="edit__field">
                  <i class="material-icons" id="indus-btn">create</i>
                </div>
                </c:if>
              </div>
              <div class="section__content__box" id="indus-info">
              	<c:forEach var="i" items="${ indusList }">
                <span class="compindus__box" id="${i.indusNo }">${ i.indusName }</span>
				</c:forEach>
              </div>
              
               <div id="indus-input" class="edit-disable">
               
		       <div class="section__compindus">
                <input
                  type="checkbox"
                  class="comp-indus"
                  name="compindus"
                  value="0"
                  id="webservice"
                />
                <label for="webservice">웹서비스</label>
                <input
                  type="checkbox"
                  class="comp-indus"
                  name="compindus"
                  value="1"
                  id="mobile"
                />
                <label for="mobile">모바일</label>
                <input
                  type="checkbox"
                  class="comp-indus"
                  name="compindus"
                  value="2"
                  id="E-service"
                />
                <label for="E-service">E-service</label>
                <input 
                  type="checkbox" 
                  class="comp-indus" 
                  name="compindus" 
                  value="3"
                  id="IoT" 
                />
                <label for="IoT">IoT</label>
                <input 
                  type="checkbox" 
                  class="comp-indus" 
                  name="compindus" 
                  value="4"
                  id="o2o" 
                />
                <label for="o2o">o2o</label>
                <input
                  type="checkbox"
                  class="comp-indus"
                  name="compindus"
                  value="5"
                  id="fintech"
                />
                <label for="fintech">핀테크</label>
              </div>
              
		      <button type="button" onclick="sendCompanyIndus();" class="btn">등록</button>
		            
          	  </div>

            </div>
            
            
            
            
            
            <!-- 테크 스택  -->
            
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>테크스택</strong>
                <c:if test="${loginUser.userNo eq c.userNo }">
                <div onclick="companyTechToggle();" class="edit__field">
                  <i class="material-icons" id="tech-btn">create</i>
                </div>
               </c:if>
              </div>
              
              <div class="section__content__boxes" id="tech-info">
              <span class="techstack__sort">FRONT-END</span>
              <div class="section__content__box">
              	<c:forEach var = "i" items="${ frontList }">
              	
                	<span class="front-end__box">${ i }</span>
				
				</c:forEach>
              </div>
              <span class="techstack__sort">BACK-END</span>
              <div class="section__content__box">
                 <c:forEach var = "i" items="${ backList }">
                 
                	<span class="back-end__box">${ i }</span>
				 	
				 </c:forEach>
              </div>
              <span class="techstack__sort">DEV_OPS</span>
              <div class="section__content__box">
              <c:forEach var = "i" items="${ devList }">
              
               		<span class="dev-ops__box">${ i }</span>
				
				</c:forEach>
              </div>
              
              <span class="techstack__sort">ETC</span>
              <div class="section__content__box">
              <c:forEach var = "i" items="${ etcList }">
              
               		<span class="etc-ops__box">${ i }</span>
				
				</c:forEach>
              </div>
              </div>
              
              <div class="content__wrapper edit-disable" id="tech-input">
              <form action="updatingTech.co" method="post">
              <input type="hidden" name="compNo" value="${ c.compNo }" />
              <div class="section__techstack">
                <strong>테크스택</strong>
                
                
                <span>FRONT-END</span>
                <input type="hidden" name="skillList[0].skillName" id="front-skill-list" />
                <input type="text" id="front-search" required/>         
                <div id="front-search-list">
					<!-- 기술 관련 검색어 리스트 자리 -->
	             </div>
                <br />	
				<ul class="front_result">
					<!-- 기술 관련 검색어 입력 결과자리  -->
				</ul>
				<br />
				
				
                <span>BACK-END</span>
                <input type="hidden" name="skillList[1].skillName" id="back-skill-list" />
                <input type="text" id="back-search" required/>

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
                <input type="hidden" name="skillList[2].skillName" id="dev-skill-list" />
                <input type="text" id="dev-search" required/>

                <div id="dev-search-list">
					<!-- 기술 관련 검색어 리스트 자리 -->
	             </div>
                <br />	
				<ul class="dev_result">
					<!-- 기술 관련 검색어 입력 결과자리  -->
				</ul>
				<br />
                
                
                
                <span>기타</span>
                <input type="hidden" name="skillList[3].skillName" id="etc-skill-list" />
                <input type="text" id="etc-search" required/>
                <div id="etc-search-list">
					<!-- 기술 관련 검색어 리스트 자리 -->
	             </div>
                <br />	
				<ul class="etc_result">
					<!-- 기술 관련 검색어 입력 결과자리  -->
				</ul>
				<br />
                
              </div>
               <button type="submit"class="btn">등록</button>
               </form>
            </div>
            </div>
            
            
            <!-- 주소 -->
            
            
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>주소</strong>
                <c:if test="${loginUser.userNo eq c.userNo }">
                <div onclick="companyAddressToggle();" class="edit__field">
                  <i class="material-icons"  id="address-btn">create</i>
                </div>
                </c:if>
              </div>
              <span class="just__text" id="address-info">
                ${ c.compAddress }
              </span>
              
              <div id="address-input" class="edit-disable"> 
                <div class="address-zip">
		            <input type="text" id="nuka_zipcode" placeholder="우편번호">
                <input type="button" onclick="nuka_execDaumPostcode()" class="btn btn-blue" value="우편번호 찾기">
                </div>
                <div class="address-detail">
                
                <input type="text" id="nuka_address" placeholder="주소">
                <input type="text" id="nuka_detailAddress" placeholder="상세주소">
                <input type="text" id="nuka_extraAddress" placeholder="참고항목">
                
				</div>
		            <button type="button"  onclick="sendCompanyAddress();" class="btn">등록</button>
       		  </div>
            </div>
            
            
            <!-- 구성원  -->
            
            <div class="content__wrapper">
              <div class="section__content__title">
                <strong>대표</strong>
              </div>
              <div class="section__member">
              
                <div class="content__profile" onclick='location.href="profile.me?userNo=${head.userNo}&currentPage=1"'>
                  		<c:choose>
                      		<c:when test="${head.userAvatar eq null}">
		                        <img class="circle" src="resources/assets/avatar.png" alt="profile" />
                      		</c:when>
                      		<c:otherwise>
		                        <img class="circle" src="${pageContext.request.contextPath}/${head.userAvatar}" alt="profile" />
                      		</c:otherwise>
                      	</c:choose>
                  <div class="content__introduce">
                    <strong>${head.userName}</strong>
                    <p>${head.userComp}</p>
                  </div>
                </div><!-- content__profile -->

              </div><!-- section__member -->
              
              
            </div>
          </div>
        </div>
      </div>
    </main>

    <!-- 구성원 추가 모달 -->
    <div class="modal hidden">
      <div class="modal__overlay"></div>
      <div class="modal__content">
      
          <form id="add-member" class="content__inner" action="addMember.co" method="get">
          	  <input type="hidden" name="cno" value="${c.compNo }">
              <div class="modal__title">
                  <h2>구성원 추가</h2>
              </div>
              <div class="email">
                  <p>이메일</p>
                  <input type="search" id="find-email">
              </div>
              <div class="modal__member__content">
                 <p class="no-result">이메일로 검색해보세요 :)</p>
              </div><!-- modal__member__content -->
              <div class="position">
                  <p>포지션</p>
                  <input type="text" list="posi-list" name="position" value="" placeholder="ex)CEO, 프론트엔드 개발 ...">
                  <datalist id="posi-list">
                  	<c:forEach var="position" items="${positionList}">
                  		<option value="${position }">
                  	</c:forEach>
                  </datalist>
              </div>
              <div class="button__box">
                  <button type="button" class="btn modal__close">close</button>
                  <button type="submit" class="btn btn-blue">추가</button>
              </div>
          </form>
          
      </div>
  </div>
    
	<jsp:include page="../common/footer.jsp" />
	
	<!-- 구성원 추가 모달 -->

    <!-- <script>

          // const openButton = document.getElementsByClassName("modal__button");
          // const modal = document.querySelector(".modal");
          // const openModal =() =>{
          //     modal.classList.remove("hidden");
          // }
          // openButton.addEventListener("click", openModal);
          document.querySelector(".modal__button").addEventListener("click", () => {
          document
          .querySelector(".modal")
          .classList.remove("hidden");
  </script> -->
  
    <script>     
    
        const onClick = () => {
          const modal = document.querySelector(".modal");
          modal.classList.remove("hidden");
        }
        const offClick = () => {
          const modal = document.querySelector(".modal");
          modal.classList.add("hidden");
        }

        document
          .getElementById("add__member__open")
          .addEventListener("click", onClick);
        document
          .querySelector(".modal__close")
          .addEventListener("click", offClick);
        
        

        
        /* 기업 소개 토글 */
        const companyIntroToggle = () => {
            
        	document
                  .querySelector("#intro-info")
                  .classList.toggle("edit-disable");
            document
                  .querySelector("#intro-input")
                  .classList.toggle("edit-disable");

            if (document.querySelector("#intro-btn").innerText === "create") {
               document.querySelector("#intro-btn").innerText = "close";
            } else {
               document.querySelector("#intro-btn").innerText = "create";
            }
         };
         /* 기업 소개 토글 끝 */
         
         
         
 		/* 기업소개 업데이트 */
 		const sendCompanyInfo = () =>{

 			const compInfo = document.querySelector("#intro-get-info").value;
 			const compNo = document.querySelector("#comp-no").value;

 			location.href ="updateProfileInfo.co?compInfo=" + compInfo + "&compNo=" + compNo;

 		}
 		/* 기업소개 업데이트 끝 */

 		
 		 /* 산업 분야 토글 */
 		 const indusToggle = () => {
            
        	document
                  .querySelector("#indus-info")
                  .classList.toggle("edit-disable");
            document
                  .querySelector("#indus-input")
                  .classList.toggle("edit-disable");

            if (document.querySelector("#indus-btn").innerText === "create") {
               document.querySelector("#indus-btn").innerText = "close";
            } else {
               document.querySelector("#indus-btn").innerText = "create";
            }
         };
 		 
 		 /* 산업 분야 토글 끝 */
 		 
 		 /* 산업 분야 조회 현황 구현 */
 		 let indusNums = ${ indusNums }
 		 
 		 document.querySelector("#indus-btn").addEventListener("click",()=> {

 			 document.querySelectorAll(".comp-indus").forEach(v=>{
 				 
 			 	//console.log(v.value); // 0 ,1,2,3,4,5
 				for(let i=0; i<indusNums.length; i++) {
 					
 					if(indusNums[i] == v.value) {
 						
 						v.setAttribute("checked", true);
					
 					}
 				}
				

 			 })
 			 
 			checkIndus();

 		 })
 		 
 		 /* 산업 분야 조회 현황 구현 */
 		 
 		 
 		 /* 산업 분야 조회 체크 현황 구현 */
 		 	const checkIndus = () => {
 		 		document.querySelectorAll(".comp-indus").forEach(v=>{
 	 		 				// 클릭 이벤트 발생시
 	 	 		 			v.addEventListener("click", () => {
 	 	 		 				if(v.checked == true) {// checked 속성값 검사 true : 체크됨 false : false
 	 	 		 					// 값을 넣어라
 	 	 	 		 				indusNums.push(parseInt(v.value));
 	 	 	 		 				// 그리고 찍어보니?
 	 	 	 		 				console.log(indusNums)
 	 	 		 				}else {
 	 	 		 					//값을 빼자
 	 	 		 					indusNums.pop(parseInt(v.value));
	 	 	 		 				// 그리고 찍어보니?
	 	 	 		 				console.log(indusNums)
 	 	 		 				}
 	 	 		 			})
 		 		})
 		 
 		 	}
 		 /* 산업 분야 조회 체크 현황 구현 */
 		 
 		  /* 산업 분야 업데이트 */
 		const sendCompanyIndus = () =>{

 			const compNo = document.querySelector("#comp-no").value;

 			location.href ="updateCompanyIndus.co?indusNums=" + indusNums + "&compNo=" + compNo;

 		}

 		 /* 산업 분야 업데이트 끝 */
 		 
 		 
 		 
 		 
 		 /* 기업 주소 토글 */
 		 const companyAddressToggle = () => {
            
        	document
                  .querySelector("#address-info")
                  .classList.toggle("edit-disable");
            document
                  .querySelector("#address-input")
                  .classList.toggle("edit-disable");

            if (document.querySelector("#address-btn").innerText === "create") {
               document.querySelector("#address-btn").innerText = "close";
            } else {
               document.querySelector("#address-btn").innerText = "create";
            }
         }
 		 /* 기업 주소 토글 끝  */
 		 
 		 
 		 /* 기업 주소 수정  */
 		 	const sendCompanyAddress = () =>{

 			const compNo = document.querySelector("#comp-no").value;
 			
			const compAddress = "(" + document.querySelector("#nuka_zipcode").value + ") "
							  + document.querySelector("#nuka_address").value + " "
							  + document.querySelector("#nuka_detailAddress").value + " "
							  + document.querySelector("#nuka_extraAddress").value; 
			
			console.log(compAddress);
 			location.href ="updateCompanyAddress.co?compAddress=" + compAddress + "&compNo=" + compNo;

 		}

 		 /* 기업 주소 수정 끝 */
 		 
 		 
 		 /* 다음 주소 api */
 		function nuka_execDaumPostcode() {
 	        new daum.Postcode({
 	            oncomplete: function(data) {
 	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 					console.log(data);
 	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
 	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
 	                var addr = ''; // 주소 변수
 	                var extraAddr = ''; // 참고항목 변수
 	
 	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
 	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
 	                    addr = data.roadAddress;
 	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
 	                    addr = data.jibunAddress;
 	                }
 	
 	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
 	                if(data.userSelectedType === 'R'){
 	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
 	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
 	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
 	                        extraAddr += data.bname;
 	                    }
 	                    // 건물명이 있고, 공동주택일 경우 추가한다.
 	                    if(data.buildingName !== '' && data.apartment === 'Y'){
 	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
 	                    }
 	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
 	                    if(extraAddr !== ''){
 	                        extraAddr = ' (' + extraAddr + ')';
 	                    }
 	                    // 조합된 참고항목을 해당 필드에 넣는다.
 	                    document.getElementById("nuka_extraAddress").value = extraAddr;
 	                
 	                } else {
 	                    document.getElementById("nuka_extraAddress").value = '';
 	                }
 	
 	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
 	                document.getElementById('nuka_zipcode').value = data.zonecode;
 	                document.getElementById("nuka_address").value = addr;
 	                // 커서를 상세주소 필드로 이동한다.
 	                document.getElementById("nuka_detailAddress").focus();
 	            }
 	        }).open();
     }
 		 
 		 
 		 
 		 
 		 const companyTechToggle = () => {
            
        	document
                  .querySelector("#tech-info")
                  .classList.toggle("edit-disable");
            document
                  .querySelector("#tech-input")
                  .classList.toggle("edit-disable");

            if (document.querySelector("#tech-btn").innerText === "create") {
               document.querySelector("#tech-btn").innerText = "close";
            } else {
               document.querySelector("#tech-btn").innerText = "create";
            }
         }
 		 
 		 
 		
 		 
 		 
 		 /* 테크스택 */
 		 
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
  </body>
  
	
	


</html>
