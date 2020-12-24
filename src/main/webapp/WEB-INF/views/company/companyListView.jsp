<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
    <link rel="stylesheet" href="resources/css/company.css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>
  <body>
    <jsp:include page="../common/mainMenu.jsp" />

    <c:if test="${!empty alertMsg }">
      <script>
        alert("${alertMsg}");
      </script>
      <c:remove var="alertMsg" scope="session" />
    </c:if>

    <!-- 컨텐츠 -->
    <main class="content__section">
      <div class="inner">
        <div class="main__main__section">
          <div class="main__section__aside">
            <span>홈/ 기업</span>
            <button
              type="button"
              class="aside__btn-enrollcomp"
              onclick='location.href="enrollForm.co"'
            >
              기업 정보 등록
            </button>
            <button class="aside__btn-compinfo">기업 정보</button>
          </div>
          <div class="main__section__content">
            <div class="section__search-info">
              <strong>기업 정보 검색</strong>
              <div class="section__select-info">
                <select name="" id="headcount-list">
                  <option value="" selected disabled hidden>구성원</option>
                  <option value="">1~10명</option>
                  <option value="">11~100명</option>
                  <option value="">101~500명</option>
                  <option value="">501~1000명</option>
                  <option value="">1001~5000명</option>
                  <option value="">5000명 초과</option>
                </select>
                <select name="" id="local-list">
                  <option value="" selected disabled hidden>지역</option>
                  <option value="">서울시</option>
                  <option value="">경기도</option>
                  <option value="">인천</option>
                </select>
                <select name="" id="indus-list">
                	<option value="" selected disabled hidden>산업분야</option>
                  <option value="">웹서비스</option>
                  <option value="">모바일</option>
                  <option value="">e-commerce</option>
                  <option value="">IoT</option>
                  <option value="">O2O</option>
                  <option value="">핀테크</option>
                </select>
              </div>
              <div class="section__search-span" id ="search-span-field">
                <div class="tag-field"> <!-- 태그 들어갈 부분 -->
                </div>
                <div class="keyword">
                  <input type="text" placeholder="검색어를 입력하세요">
                  <i class="material-icons">search</i>
                </div>
              </div>
            </div>
            <div class="section__search-result">
              <div class="section__search-result-top">
                <span id="search-result-length">검색결과 (${ fn:length(list)}개)</span>
                <div class="section__sort">
                  <a href="">최신순</a>
                  <a href="">인기순</a>
                </div>
              </div>

              <c:forEach var="c" items="${ list }">
                <div class="section__result__detail">
                  <div class="logo">
                    <img src="${c.compLogo}" alt="logo" />
                  </div>
                  <div class="comp-info">
                    <strong>${ c.compName }</strong>
                    <span>${ c.compInfo }</span>
                    <span class="comp-info-lo">${ c.compAddress }</span>
                  </div>
                  <div class="subscribe-btn">
                    <button>구독</button>
                  </div>
                </div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
  <script>
    const makeElement = (v) => {
      const box = document.createElement("div");
      box.className = "section__result__detail";

      const logoBox = document.createElement("div");
      logoBox.className = "logo";
      const logoImg = document.createElement("img");
      logoImg.src = v.compLogo;
      logoBox.appendChild(logoImg);

      const info = document.createElement("div");
      info.className = "comp-info";
      const strong = document.createElement("strong");
      strong.innerText = v.compName;
      const span = document.createElement("span");
      span.innerText = v.compInfo;
      const span2 = document.createElement("span");
      span2.className = "comp-info-lo";
      span2.innerText = v.compAddress;
      info.appendChild(strong);
      info.appendChild(span);
      info.appendChild(span2);

      const subBtn = document.createElement("div");
      subBtn.className = "subscribe-btn";
      const realBtn = document.createElement("button");
      realBtn.innerText = "구독";
      realBtn.type = "button";
      subBtn.appendChild(realBtn);

      const compNo = document.createElement("input");
      compNo.type = "hidden";
      compNo.value = v.compNo;
      compNo.className = "comp-no-input";

      box.appendChild(compNo);
      box.appendChild(logoBox);
      box.appendChild(info);
      box.appendChild(subBtn);

      document.querySelector(".section__search-result").appendChild(box);
    };

    //infinite scroll
   	let currentPageNum = 2;
    window.addEventListener('scroll',()=>{
      if(window.pageYOffset + document.documentElement.clientHeight >
              document.documentElement.scrollHeight - 1){
        console.log("로드성공")
        axios.get("load.comp", {
            params: {
              currentPage: currentPageNum++
            }
          })
          .then((res)=>{
        	console.log(res.data);
        	
        	res.data.forEach(v=>{
        		makeElement(v);
        	})
            document.querySelector('#search-result-length').innerText = "검색결과("+ document.querySelectorAll('.section__result__detail').length +")"
          })
      	}
    })
    

    // 각각의 selectbox
    	let countSelect = document.querySelector("#headcount-list");
    	let localSelect = document.querySelector("#local-list");
    	let indusSelect = document.querySelector("#indus-list")
    
   	// 구성원 선택 시 option 값 담아주기
		document.querySelector("#headcount-list").addEventListener("change", function (e) {
    	
    	tagList = document.querySelector(".tag-field");
    	
    	let tagName = countSelect.options[countSelect.selectedIndex].text;
    	
    	createTag(tagName);
    	
    	let headcount = document.querySelectorAll(".tag-field");
    	let headcountList = "";
    	headcount.forEach(s => {
    		headcountList += s.innerText + " ";
    	})
    	
    	console.log(headcountList);
    })
    
    //지역 선택 시 option 값 담아주기
    	document.querySelector("#local-list").addEventListener("change", function (e) {
    	
    	tagList = document.querySelector(".tag-field");
    	
    	let tagName = localSelect.options[localSelect.selectedIndex].text;
    	
    	createTag(tagName);
    	
    	let headcount = document.querySelectorAll(".tag-field");
    	let headcountList = "";
    	headcount.forEach(s => {
    		headcountList += s.innerText + " ";
    	})
    	
    	console.log(headcountList);
    })
    // 산업분야 선택 시 option 값 담아주기
    	
    	document.querySelector("#indus-list").addEventListener("change", function (e) {
    	
    	tagList = document.querySelector(".tag-field");
    	
    	let tagName = indusSelect.options[indusSelect.selectedIndex].text;
    	
    	createTag(tagName);
    	
    	let headcount = document.querySelectorAll(".tag-field");
    	let headcountList = "";
    	headcount.forEach(s => {
    		headcountList += s.innerText + " ";
    	})
    	
    	console.log(headcountList);
    })
    // 태그 생성용 함수
    const createTag = (tagName) => {
    	
    	const searchSpan = document.createElement("span");
    	const delIcon = document.createElement("span");
    	
    	searchSpan.className = "search-span";
    	delIcon.innerText = "clear";
    	delIcon.className = "material-icons";
    	searchSpan.innerText = tagName;
		    	
    	delIcon.addEventListener("click", deleteTag);
    	tagList.appendChild(searchSpan);
    	searchSpan.appendChild(delIcon);
 	
    }
    
    // 태그 삭제용 함수
    const deleteTag = (event) => {
    	const span = event.target;
    	const div = span.parentNode;
    	tagList.removeChild(div);
    	
    }
    
    
  </script>
</html>