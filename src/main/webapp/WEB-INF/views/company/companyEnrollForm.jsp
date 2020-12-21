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
                  <img src="../../assets/avatar.png" alt="comapnyLogo" />
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
                  placeholder=" 기업을 소개해주세요"
                />
              </div>
            </div>
            <div class="content__wrapper">
              <strong>산업분야</strong>
              <div class="section__compindus">
                <input
                  type="checkbox"
                  id="webservice"
                  name="compindus"
                  value="웹서비스"
                />
                <label for="webservice">웹서비스</label>
                <input
                  type="checkbox"
                  id="mobile"
                  name="compindus"
                  value="모바일"
                />
                <label for="mobile">모바일</label>
                <input
                  type="checkbox"
                  id="E-service"
                  name="compindus"
                  value="E-service"
                />
                <label for="E-service">E-service</label>
                <input type="checkbox" id="IoT" name="compindus" value="IoT" />
                <label for="IoT">IoT</label>
                <input type="checkbox" id="o2o" name="compindus" value="o2o" />
                <label for="o2o">o2o</label>
                <input
                  type="checkbox"
                  id="fintech"
                  name="compindus"
                  value="fintech"
                />
                <label for="fintech">핀테크</label>
              </div>
            </div>
            <div class="content__wrapper">
              <div class="section__techstack">
                <strong>테크스택</strong>
                <span>FRONT-END</span>
                <input type="text" name="skillList[0].skillName"/>
                <div class="section__techstack__btn">
                  <button class="techstack__btn">Node.js</button>
                  <button class="techstack__btn">Express.js</button>
                  <button class="techstack__btn">Deno</button>
                </div>
                <span>BACK-END</span>
                <input type="text" name="skillList[1].skillName"/>
                <div class="section__techstack__btn">
                  <button class="techstack__btn">Node.js</button>
                  <button class="techstack__btn">Express.js</button>
                  <button class="techstack__btn">Deno</button>
                </div>
                <span>DEV-OPS</span>S
                <input type="text" name="skillList[2].skillName"/>
                <div class="section__techstack__btn">
                  <button class="techstack__btn">Node.js</button>
                  <button class="techstack__btn">Express.js</button>
                  <button class="techstack__btn">Deno</button>
                </div>
                <span>기타</span>
                <input type="text" name="skillList[3].skillName"/>
                <div class="section__techstack__btn">
                  <button class="techstack__btn">Node.js</button>
                  <button class="techstack__btn">Express.js</button>
                  <button class="techstack__btn">Deno</button>
                </div>
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
    
    <script defer>
    $(function() {
		//구성원값 가져오기 
		var headCount = ${headCount};
		
		$("input[type=radio]").each(function(){
			
			if(headCount.search($(this).val()) != -1) {
				$(this).attr("checked", true);
			}
		});
    </script>
  </body>
</html>
