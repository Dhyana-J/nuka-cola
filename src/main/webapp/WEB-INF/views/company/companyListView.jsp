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
            <button 
               class="aside__btn-compinfo"
               onclick='location.href="list.co"'
            >기업 정보</button>
          </div>
          <div class="main__section__content">
	            <div class="section__search-info">
	              <strong>기업 정보 검색</strong>
	              <div class="section__select-info">
	                <select name="" id="headcount-list">
	                  <option value="" selected disabled hidden>구성원</option>
	                  <option value="1~10명">1~10명</option>
	                  <option value="11~100명">11~100명</option>
	                  <option value="101~500명">101~500명</option>
	                  <option value="501~1000명">501~1000명</option>
	                  <option value="1001~5000명">1001~5000명</option>
	                  <option value="5000명 초과">5000명 초과</option>
	                </select>
	                <select name="" id="local-list">
	                  <option value="" selected disabled hidden>지역</option>
	                  <option value="서울시">서울시</option>
	                  <option value="경기도">경기도</option>
	                  <option value="인천">인천</option>
	                  <option value="대전">대전</option>
	                  <option value="광주">광주</option>
	                  <option value="대구">대구</option>
	                  <option value="울산">울산</option>
	                  <option value="부산">부산</option>
	                  <option value="강원도">강원도</option>
	                  <option value="충청북도">충청북도</option>
	                  <option value="충청남도">충청남도</option>
	                  <option value="전라남도">전라남도</option>
	                  <option value="전라북도">전라북도</option>
	                  <option value="경상북도">경상북도</option>
	                  <option value="경상남도">경상남도</option>
	                </select>
	                <select name="" id="indus-list">
	                	<option value="" selected disabled hidden>산업분야</option>
	                  <option value="0">웹서비스</option>
	                  <option value="1">모바일</option>
	                  <option value="2">e-commerce</option>
	                  <option value="3">IoT</option>
	                  <option value="4">O2O</option>
	                  <option value="5">핀테크</option>
	                </select>
	              </div>
	              <div class="section__search-span" id ="search-span-field">
	                <div class="tag-field"> <!-- 태그 들어갈 부분 -->
	                </div>
	                <div class="keyword">
	                  <input type="text" placeholder="검색어를 입력하세요" id="keyword-search" name="keyword">
	                  <i class="material-icons" id="search-button">search</i>
	                </div>
	              </div>
	            </div>
            <div class="section__search-result">
              <div class="section__search-result-top">
                <span id="search-result-length">검색결과 (${ fn:length(list)}개)</span>
                <div class="section__sort">
                  <a href="list.co">최신순</a>
                  <a href="sortRanking.co">인기순</a>
                </div>
              </div>
	              <c:forEach var="c" items="${ list }">
	                <div class="section__result__detail">
	                <input type="hidden" class="comp-no" name="compNo" value="${ c.compNo }">
	                  <div class="logo">
	                    <img src="${c.compLogo}" alt="logo" />
	                  </div>
	                  <div class="comp-info" onClick='location.href="profileMain.co?cno=${ c.compNo }"'>
	                    <strong>${ c.compName }</strong>
	                    <span>${ c.compInfo }</span>
	                    <span class="comp-info-lo">${ c.compAddress }</span>
	                  </div>
	                  
	                  <c:choose>
	                    <c:when test="${c.subScribed eq 0}">
		                    <div class="subscribe-btn">
		                    	<button id="sub" class="toggle_sub">구독</button>
		                    </div>
	                    </c:when>
	                    <c:otherwise>
	                    	 <div class="subscribe-btn">
		                    	<button id="sub-cancle" class="toggle_sub">구독취소</button>
		                    </div>
	                    </c:otherwise>
	                  </c:choose>
	                  
	                </div>
	              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
  <script defer>
  	
  
    const makeElement = (v) => {
    
      const box = document.createElement("div");
      box.className = "section__result__detail";
      
      const logoBox = document.createElement("div");
      logoBox.className = "logo";
      const logoImg = document.createElement("img");
      logoImg.src = v.compLogo;
      
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

      //버튼
      const subBtn = document.createElement("div");
      subBtn.className = "subscribe-btn";
      const realBtn = document.createElement("button");
      realBtn.className = "toggle_sub";
      subBtn.appendChild(realBtn);
      
      if(v.subScribed===0){
    	  realBtn.innerText = "구독";
    	  realBtn.id = "sub";
      }else{
    	  realBtn.innerText = "구독취소";
    	  realBtn.id = "sub-cancle";
      }

      const compNo = document.createElement("input");
      compNo.type = "hidden";
      compNo.value = v.compNo;
      compNo.className = "comp-no";
      compNo.name = "compNo";

      box.appendChild(compNo);
      box.appendChild(logoBox);
      box.appendChild(info);
      box.appendChild(subBtn);
      logoBox.appendChild(logoImg);

      document.querySelector(".section__search-result").appendChild(box);
      document.querySelector('#search-result-length').innerText = "검색결과 ("+ document.querySelectorAll('.section__result__detail').length +"개)"

      // 기업 상세페이지 이동
      info.addEventListener('click', function(event) {
    	  location.href = "profileMain.co?cno="+v.compNo; 
      })
      
      
    };

 	
    // 기업구독/ 취소
    const addSubscribe =()=>{
    	document.querySelectorAll('.subscribe-btn').forEach((v,i)=>{
    		v.addEventListener('click', () =>{
    			const BtnWrapper = document.querySelectorAll('.subscribe-btn')[i];
    			console.log(BtnWrapper.children[0])
    			
    			let subUrl = 'insert.sub.co'
    			let subscribed = 0;
    			if(BtnWrapper.children[0].innerText==='구독'){
    				subscribed = 0;
    				BtnWrapper.children[0].innerText= '구독취소'
    				BtnWrapper.children[0].id ='sub-cancle'
    			}else{
    				subscribed = 1;
    				BtnWrapper.children[0].innerText = '구독'
    				BtnWrapper.children[0].id ='sub'
    			}
    			
    			axios.get('insert.sub.co',{
    				params:{
    					userNo:'${loginUser.userNo}',
    					compNo:document.querySelectorAll('.comp-no')[i].value,
    					subscribed:subscribed
    				}
    			})
    			.then((res)=>{
    				console.log('구독성공', res.data);
    			})
    		   })
    	    })
           }
    

    // 각각의 selectbox
    	let countSelect = document.querySelector("#headcount-list");
    	let localSelect = document.querySelector("#local-list");
    	let indusSelect = document.querySelector("#indus-list")
    
    	let hTagList = []; //구성원태그
    	let lTagList = []; //로컬태그
    	let iTagList = []; //산업분야태그
     
    	const TAG_LS = "tag";
    	
   	// 구성원 선택 시 option 값 담아주기
		document.querySelector("#headcount-list").addEventListener("change", function (e) {
    	
    	tagList = document.querySelector(".tag-field");
    	
    	let htagName = countSelect.options[countSelect.selectedIndex].text;
    	
    	createCountTag(htagName);
    	
    	let headcount = document.querySelectorAll(".tag-field");
    	let headcountList = "";
    	headcount.forEach(s => {
    		headcountList += s.innerText + " ";
    	})
    	
	})
    //지역 선택 시 option 값 담아주기
    	document.querySelector("#local-list").addEventListener("change", function (e) {
    	
    	tagList = document.querySelector(".tag-field");
    	
    	let ltagName = localSelect.options[localSelect.selectedIndex].text;
    	
    	createLocalTag(ltagName);
    	
    	let headcount = document.querySelectorAll(".tag-field");
    	let headcountList = "";
    	headcount.forEach(s => {
    		headcountList += s.innerText + " ";
    	})
    	
    })
    // 산업분야 선택 시 option 값 담아주기
    	
    	document.querySelector("#indus-list").addEventListener("change", function (e) {
    	
    	tagList = document.querySelector(".tag-field");
    	
    	let itagName = indusSelect.options[indusSelect.selectedIndex].text;
    	
    	createIndusTag(itagName);
    	
    	let headcount = document.querySelectorAll(".tag-field");
    	let headcountList = "";
    	headcount.forEach(s => {
    		headcountList += s.innerText + " ";
    	})
    })
     
    const saveTag = () => {
			localStorage.setItem(TAG_LS, JSON.stringify(hTagList)); // 자바스크립트object를 string으로 변환
			localStorage.setItem(TAG_LS, JSON.stringify(lTagList)); // 자바스크립트object를 string으로 변환
			localStorage.setItem(TAG_LS, JSON.stringify(iTagList)); // 자바스크립트object를 string으로 변환
		}
    
    // 태그 생성용 함수 (headcountList)
    const createCountTag = (htagName) => {
    	
    	const searchSpan = document.createElement("span");
    	const delIcon = document.createElement("span");
    	const textSpan = document.createElement("span");
    	
    	searchSpan.className = "search-span";
    	textSpan.className = "headcount-text";
    	delIcon.innerText = "clear";
    	delIcon.className = "material-icons";
    	textSpan.innerText = htagName;
		
    	const newId = hTagList.length + 1;
    	
    	
    	delIcon.addEventListener("click", deleteTag);
    	tagList.appendChild(searchSpan);
    	searchSpan.appendChild(textSpan);
    	searchSpan.appendChild(delIcon);
 		searchSpan.id = newId;
    	
    	const TagObj = {
    		keyword : htagName,	
    		id : newId
    	};
    	
    	hTagList.push(TagObj);
    	saveTag();
    	
    	console.log(hTagList);
    	
	}
    
	 // 태그 생성용 함수 (localList)
	    const createLocalTag = (ltagName) => {
	    	
	    	const searchSpan = document.createElement("span");
	    	const delIcon = document.createElement("span");
	    	const textSpan = document.createElement("span");
	    	
	    	searchSpan.className = "search-span";
	    	textSpan.className = "local-text";
	    	delIcon.innerText = "clear";
	    	delIcon.className = "material-icons";
	    	textSpan.innerText = ltagName;
			
	    	const newId = lTagList.length + 1;
	    	
	    	
	    	delIcon.addEventListener("click", deleteTag);
	    	tagList.appendChild(searchSpan);
	    	searchSpan.appendChild(textSpan);
	    	searchSpan.appendChild(delIcon);
	 		searchSpan.id = newId;
	    	
	    	const TagObj = {
	    		keyword : ltagName,	
	    		id : newId
	    	};
	    	
	    	lTagList.push(TagObj);
	    	saveTag();
	    	
	    	console.log(lTagList);
	    	
		}
    
    
	 // 태그 생성용 함수 (indusList)
    const createIndusTag = (itagName) => {
    	
    	const searchSpan = document.createElement("span");
    	const delIcon = document.createElement("span");
    	const textSpan = document.createElement("span");
    	
    	searchSpan.className = "search-span";
    	textSpan.className = "indus-text";
    	delIcon.innerText = "clear";
    	delIcon.className = "material-icons";
    	textSpan.innerText = itagName;
		
    	const newId = iTagList.length + 1;
    	
    	
    	delIcon.addEventListener("click", deleteTag);
    	tagList.appendChild(searchSpan);
    	searchSpan.appendChild(textSpan);
    	searchSpan.appendChild(delIcon);
 		searchSpan.id = newId;
    	
    	const TagObj = {
    		keyword : itagName,	
    		id : newId
    	};
    	
    	iTagList.push(TagObj);
    	saveTag();
    	
    	console.log(iTagList);
    	
	}
    
    const filter = (tagfilter) => {
		return tagfilter.id === 1;
	}
    
    // 태그 삭제용 함수
    const deleteTag = (event) => {
    	const span = event.target;
    	const searchSpan = span.parentNode;
    	tagList.removeChild(searchSpan);
		
    	/*삭제시 list에서 제거*/
		const cleanhTag = hTagList.filter(function(tagfilter) {
			return tagfilter.id !== parseInt(searchSpan.id);
		});
		const claenlTag = lTagList.filter(function(tagfilter) {
			return tagfilter.id !== parseInt(searchSpan.id);
		});
    	const cleaniTag = iTagList.filter(function(tagfilter) {
			return tagfilter.id !== parseInt(searchSpan.id);
		});
		hTagList = cleanhTag;
		lTagList = claenlTag;
		iTagList = cleaniTag;
		saveTag();
		
    }
    

    
    // axios로 키워드, 배열들  담아 controller로 넘기기 기업검색
      document.querySelector("#keyword-search").addEventListener("keyup", () => {
    	
    	  const keyword = document.querySelector("#keyword-search").value;   	  
   
    	  
    	  let hTagList =document.querySelectorAll(".headcount-text");
    	  let lTagList =document.querySelectorAll(".local-text");
    	  let iTagList =document.querySelectorAll(".indus-text");
    	  
    	  
    	  let headcountList = "";
    	  let localList = "";
    	  let indusList = "";
    	  
    	  hTagList.forEach(c => {
    		  headcountList += c.innerText +" "
    	  })
    	  
    	  lTagList.forEach(c => {
    		  localList += c.innerText +" "
    	  })
    	  
    	  iTagList.forEach(i => {
    		  indusList += i.innerText +" "
    	  })
    	  
    		  axios.get('search.co', {
    			  params: { /*keyword, 구성원, 지역, 산업분야 리스트 넘기기*/
    				  keyword : keyword,
    				  headcountList : headcountList,
    				  localList : localList,
    				  indusList : indusList
    			  }
    		  })
    		  .then((res) =>{		 
    			  
    			  
    			  var header = document.querySelector(".section__result__detail");
				  var body = document.querySelector(".section__search-result");
				  
				  document.querySelectorAll('.section__result__detail').forEach(v=>v.remove())
				  
				  res.data.forEach(v=>{
					  
    				  makeElement(v);
    			 })
    		  	 	addSubscribe()
    		 	 })
    	  });
    
    
    
    //infinite scroll
   	let currentPageNum = 2;
    window.addEventListener('scroll',()=>{
      if(window.pageYOffset + document.documentElement.clientHeight >
              document.documentElement.scrollHeight - 1){
        console.log("로드성공")
        axios.get("load.comp", {
            params: {
              userNo:${loginUser.userNo},
              currentPage: currentPageNum++
            }
          })
          .then((res)=>{
        	console.log(res.data);
        	addSubscribe();
        	res.data.forEach(v=>{
        		makeElement(v);
        	})
            document.querySelector('#search-result-length').innerText = "검색결과("+ document.querySelectorAll('.section__result__detail').length +")"
            addSubscribe();
          })
      	}
    })
		addSubscribe();
  </script>
</html>