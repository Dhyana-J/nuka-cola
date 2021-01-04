<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/recruit/recuritEnrollForm.css" />

</head>

<body>

	 <jsp:include page="../common/mainMenu.jsp"/>

    <main class="content__section">
      <div class="inner">
         <form action="recruitInsert.re" method="get" enctype="multipart-formdata">
         <input type="hidden" name="userNo" value="${loginUser.userNo }" />
        <div class="inner__title">
          <h1>채용등록</h1>
        </div>
        <div class="section__recruit">
        
          <div class="section__recruit__left">
          
          
            <div class="content__wrap">
              <div class="company__logo">
                <img src="resources/assets/avatar.png" alt="logo" id="recruitLogo"/>
              </div>
              <div class="logo__info">
                <strong>이미지</strong>
                <span>
                  사무실이나 구성원 등 기업을 소개 할 수 있는 이미지를
                  업로드해주세요.
                </span>
                <input type="file" id="upfile" name="recruitImg" style="display:none;" />
                <label class="btn__attachment" for="upfile">찾아보기</label>
              </div>
            </div>

            <div class="content__job">
              <strong>Job Title</strong>
              <input
                type="text"
                placeholder="예시) 함께할 디자이너를 모셔요!"
                name="recruitTitle"
              />
            </div>
			
			
			<div class="content__recruit">
              <strong>주요 업무</strong>
 
              <textarea name="recruitMain" id="recruitMain"></textarea>
	
            </div>
			
			
            <div class="content__pro">
              <strong>전문기술</strong>

                <input type="hidden" name="skillList[0].skillName" id="back-skill-list"/>
                <input type="text" id="back-search"/>

                <div id="back-search-list">
					<!-- 기술 관련 검색어 리스트 자리 -->
	             </div>
                <br />	
				<ul class="back_result">
					<!-- 기술 관련 검색어 입력 결과자리  -->
				</ul>
				<br />

            </div>

            <div class="content__carrer">
              <div class="content__carrer-right">
                <strong>채용분야</strong>
                <select name="recruitPosi" id="recruitPosi">
                  <option value="0">기획자</option>
                  <option value="1">개발자</option>
                  <option value="2">디자이너</option>
                </select>
              </div>
              
              
              <div class="content__carrer-left">
                <strong>경력여부</strong>
                <div class="content__carrer-box">
                  <input type="checkbox" name="recruitRequ" value="0" id="newbi" />
                  <label for="newbi">신입</label>
                  <input type="checkbox" name="recruitRequ" value="1" id="oldbi"/>
                  <label for="oldbi">경력</label>
                  <input type="checkbox" name="recruitRequ" value="2" id="bothbi"/>
                  <label for="bothbi">신입/경력</label>
                </div>
              </div>
            </div>
            
            
            <div class="content__salary">
              <strong>연봉</strong>
              <div class="content__salary-range">
              
                <div class="min-max-slider" data-legendnum="2">
				    <label for="min">Minimum price</label>
				    <input id="min" class="min" name="minSal" type="range" step="10" min="0" max="10000" />
				    
				    <label for="max">Maximum price</label>
				    <input id="max" class="max" name="maxSal" type="range" step="10" min="0" max="10000" />
				</div>
				
              </div>
            </div>
            
            
            
            <div class="content__recruitDetail">
              <strong>채용상세</strong>
              <div class="content__recruitDetail-box">
					<textarea name="recruitInfo" id="recruitInfo"></textarea>
              </div>
            </div>

            <div class="content__deadLine">
              <strong>마감일</strong>
              <input type="datetime" name="recruitDl" id="recruitDl" placeholder="2020-10-20" />
            </div>
            
            
          </div>
          <div class="section__recruit__right">
            <div class="section__recruit__right-list">

              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>이미지</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>Job Title</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>주요업무</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>전문기술</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>채용분야</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>경력여부</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>연봉</span>
                </div>
              </label>
              <label class="switch">
                <input type="checkbox" />
                <div>
                  <span>채용상세</span>
                </div>
              </label>
              
                <label class="switch">
	                <input type="checkbox" />
	                <div>
	                  <span>마감일</span>
	                </div>
               </label>
              <button class="btn" type="submit">기업등록</button>
              
            </div>
          </div>
        </div>
         </form>
      </div>
    </main>
	
	 <jsp:include page="../common/footer.jsp"/>
</body>


<script>

	document.querySelector("#upfile").addEventListener("change", (input) => {
	
	let fileList = document.querySelector("#upfile").files;
	
	if(fileList.length == 1) {
		
		let reader = new FileReader();
		
		reader.readAsDataURL(fileList[0]);
		
		reader.onload = ()=> {
			document.querySelector("#recruitLogo").setAttribute("src",reader.result);
		}
	
	}else {
		document.querySelector("#recruitLogo").setAttribute("src","resources/assets/avatar.png");
	}
	
	
})


		/* 백 엔드 기술 체크 부분 */	
		document.querySelector("#back-search").addEventListener("input", (e) => {
		
		const skill = e.target.value;	
		console.log(skill)
		console.log(skill.length)
		if(skill.length>0)	{

			checkSkill(skill);

		}

		});

	
		const checkSkill = (skill)=>{
	
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
							document.querySelector("#back-search-list").innerHTML = searchResult
	
						})
						.catch(function (error) {
							console.log(error);
						})
						.then(function () {
							// ...
						});
	
		}
		
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
		
		
		
		var thumbsize = 14;

		function draw(slider,splitvalue) {

		    /* set function vars */
		    var min = slider.querySelector('.min');
		    var max = slider.querySelector('.max');
		    var lower = slider.querySelector('.lower');
		    var upper = slider.querySelector('.upper');
		    var legend = slider.querySelector('.legend');
		    var thumbsize = parseInt(slider.getAttribute('data-thumbsize'));
		    var rangewidth = parseInt(slider.getAttribute('data-rangewidth'));
		    var rangemin = parseInt(slider.getAttribute('data-rangemin'));
		    var rangemax = parseInt(slider.getAttribute('data-rangemax'));

		    /* set min and max attributes */
		    min.setAttribute('max',splitvalue);
		    max.setAttribute('min',splitvalue);

		    /* set css */
		    min.style.width = parseInt(thumbsize + ((splitvalue - rangemin)/(rangemax - rangemin))*(rangewidth - (2*thumbsize)))+'px';
		    max.style.width = parseInt(thumbsize + ((rangemax - splitvalue)/(rangemax - rangemin))*(rangewidth - (2*thumbsize)))+'px';
		    min.style.left = '0px';
		    max.style.left = parseInt(min.style.width)+'px';
		    min.style.top = lower.offsetHeight+'px';
		    max.style.top = lower.offsetHeight+'px';
		    legend.style.marginTop = min.offsetHeight+'px';
		    slider.style.height = (lower.offsetHeight + min.offsetHeight + legend.offsetHeight)+'px';
		    
		    /* correct for 1 off at the end */
		    if(max.value>(rangemax - 1)) max.setAttribute('value',rangemax);

		    /* write value and labels */
		    max.value = max.getAttribute('value'); 
		    min.value = min.getAttribute('value');
		    lower.innerHTML = min.getAttribute('value');
		    upper.innerHTML = max.getAttribute('value');

		}

		function init(slider) {
		    /* set function vars */
		    var min = slider.querySelector('.min');
		    var max = slider.querySelector('.max');
		    var rangemin = parseInt(min.getAttribute('min'));
		    var rangemax = parseInt(max.getAttribute('max'));
		    var avgvalue = (rangemin + rangemax)/2;
		    var legendnum = slider.getAttribute('data-legendnum');

		    /* set data-values */
		    min.setAttribute('value',rangemin);
		    max.setAttribute('value',rangemax);
		    
		    /* set data vars */
		    slider.setAttribute('data-rangemin',rangemin); 
		    slider.setAttribute('data-rangemax',rangemax); 
		    slider.setAttribute('data-thumbsize',thumbsize); 
		    slider.setAttribute('data-rangewidth',slider.offsetWidth);

		    /* write labels */
		    var lower = document.createElement('span');
		    var upper = document.createElement('span');
		    lower.classList.add('lower','value');
		    upper.classList.add('upper','value');
		    lower.appendChild(document.createTextNode(rangemin));
		    upper.appendChild(document.createTextNode(rangemax));
		    slider.insertBefore(lower,min.previousElementSibling);
		    slider.insertBefore(upper,min.previousElementSibling);
		    
		    /* write legend */
		    var legend = document.createElement('div');
		    legend.classList.add('legend');
		    var legendvalues = [];
		    for (var i = 0; i < legendnum; i++) {
		        legendvalues[i] = document.createElement('div');
		        var val = Math.round(rangemin+(i/(legendnum-1))*(rangemax - rangemin));
		        legendvalues[i].appendChild(document.createTextNode(val));
		        legend.appendChild(legendvalues[i]);

		    } 
		    slider.appendChild(legend);

		    /* draw */
		    draw(slider,avgvalue);

		    /* events */
		    min.addEventListener("input", function() {update(min);});
		    max.addEventListener("input", function() {update(max);});
		}

		function update(el){
		    /* set function vars */
		    var slider = el.parentElement;
		    var min = slider.querySelector('#min');
		    var max = slider.querySelector('#max');
		    var minvalue = Math.floor(min.value);
		    var maxvalue = Math.floor(max.value);
		    
		    /* set inactive values before draw */
		    min.setAttribute('value',minvalue);
		    max.setAttribute('value',maxvalue);

		    var avgvalue = (minvalue + maxvalue)/2;

		    /* draw */
		    draw(slider,avgvalue);
		}

		var sliders = document.querySelectorAll('.min-max-slider');
		sliders.forEach( function(slider) {
		    init(slider);
		});

</script>



</html>