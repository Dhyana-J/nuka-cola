<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>COMPANY PROFILE</title>
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
    <link rel="stylesheet" href="resources/css/profile/profile(employ).css" />
  	    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>
  <body>
<jsp:include page="../common/mainMenu.jsp"/>
    <section class="visual__section">
      <div class="inner">
        <div class="visual__left">
          <div class="avatar">
            <img src="../../assets/avatar.png" alt="" />
          </div>
          <div>
            <div class="main__info">
              <strong>유원근</strong>
              <span>Apple.inc @ CEO</span>
              <span>Node.js / React.js / Vue.js / Java</span>
            </div>
            <ul class="people__info">
              <li>팔로우 <strong>102</strong></li>
              <li>팔로우 <strong>102</strong></li>
              <li>팔로우 <strong>102</strong></li>
            </ul>
          </div>
        </div>
        <button class="btn visual__right" id="add__member__open">구성원추가</button>
      </div>
    </section>
    <main class="content__section">
      <div class="inner">
        <div class="section__title">
          <ul>
            <li>ABOUT</li>
            <li class="nav-active">채용</li>
            <li>구성원</li>
          </ul>
        </div>
        <div class="main__main__section">
            <div class="main__section__left">
                <div class="content__wrapper">
                  <ul class="left__info">
                    <li><a href="#"><strong>TOP</strong></a></li>
                    <li><a href="#">진행중</a></li>
                    <li><a href="#employ__box__end">모집완료</a></li>
                  </ul>
                </div>
              </div>
          <div class="main__section__right">
          <input type="hidden" class="nowCno" value="${cno}">
            <div class="employ__box__ing">
              <h2>진행중</h2>
              <!-- 진행중인 채용공고 for(문) -->
              <c:forEach var="rING" items="${rlist1}">
              <div class="content__wrapper">
              <input type="hidden" class="recruit-no" name="recruitNo" value="${rING.recruitNo}">
                <ul class="employ__box__info">
                  <li>${rING.compName}</li>
                  <li><strong>${rING.recruitTitle}</strong></li>
                  <c:if test="${rING.recruitRequ eq '0'}">
		                  <li>신입</li>
		          </c:if>
		          <c:if test="${rING.recruitRequ eq '1'}">
		                  <li>경력</li>
		          </c:if>
		          <c:if test="${rING.recruitRequ eq '2'}">
		                  <li>경력 신입</li>
		          </c:if>
                </ul>
                <div class="tag__box">
                  <c:forEach var="skills" items="${skillMap.get(rING.recruitNo)}">
			             <span class="tag">${skills}</span>
				  </c:forEach>
                </div>
                <div class="date">
                  <span>${rING.createdAt}</span>
                </div>
              </div>
			  </c:forEach>
              <!-- 진행중인 채용공고for문 -->
              <div class="member_btn">
                <button class="btn more1">more</button>
              </div>
            </div>


            <div id ="employ__box__end" class="employ__box__end">
              <h2>모집완료</h2>
              <!-- 모집완료한 채용공고 for문 -->
			  <c:forEach var="rEND" items="${rlist2}">
	              <div class="content__wrapper">
	                <ul class="employ__box__info">
	                  <li>${rEND.compName}</li>
	                  <li><strong>${rEND.recruitTitle}</strong></li>
	                  <c:if test="${rEND.recruitRequ eq '0'}">
		                  <li>신입</li>
			          </c:if>
			          <c:if test="${rEND.recruitRequ eq '1'}">
			                  <li>경력</li>
			          </c:if>
			          <c:if test="${rEND.recruitRequ eq '2'}">
			                  <li>경력 신입</li>
			          </c:if>
		            </ul>
	                <div class="tag__box">
	                  <c:forEach var="skills" items="${skillMap.get(rEND.recruitNo)}">
			             <span class="tag">${skills}</span>
				  </c:forEach>
	                </div>
	                <div class="date">
	                  <span>${rEND.createdAt}</span>
	                </div>
	              </div>
			  </c:forEach>
              <!-- 진행완료인 채용공고 for문 -->

              <div class="member_btn">
                <button class="btn">more</button>
              </div>
            </div>
          </div>
        </div>

        </div>
      </div>
    </main>

    <!-- 구성원 추가 모달 -->
    <div class="modal hidden">
      <div class="modal__overlay"></div>
      <div class="modal__content">
          <form class="content__inner">
              <div class="modal__title">
                  <h2>구성원 추가</h2>
              </div>
              <div class="email">
                  <p>이메일</p>
                  <input type="search">
              </div>
              <div class="modal__member__content">
                <!-- 기업의 구성원 for문 -->
                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox">
                      </div>
                  </div>
                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" >
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" >
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox" >
                      </div>
                  </div>

                  <div class="charater__info">
                      <div class="charater__info__left">
                          <div class="member__avatar">
                          <img src="../../assets/avatar.png" alt="" />
                          </div>
                          <label for="add_option" class="add__member__check">
                          <ul class="add__member__info">
                              <li><strong>Elon Reeve Musk</strong></li>
                              <li>TESLA,SPACE x @CEO</li>
                          </ul>
                          </label>
                      </div>
                      <div class="charater__info__right">
                        <input type="checkbox">
                      </div>
                  </div>
                <!-- 기업의 구성원 for문 -->
              </div>
              <div class="position">
                  <p>직책</p>
                  <input type="search">
              </div>
              <div class="button__box">
                  <button type="button" class="btn modal__close">close</button>
                  <button type="submit" class="btn btn-blue">추가</button>
              </div>
          </form>
      </div>
  </div>

  <script defer src="resources/js/profile/profile(member-modal).js"></script>
  <script defer>
  
    const recruitItem1 =(v,i)=>{
  	console.log(i);
  	const itemList = document.querySelector('.jemploy__box__ing');
  	const recruitItemBox = document.createElement('div');
  		recruitItemBox.className='content__wrapper';
  	const recruitNo = document.createElement('input');
			recruitNo.type='hidden';
			recruitNo.name='recruitNo';
  		recruitNo.className='recruit-no';
  		recruitNo.value=v.recruitNo;

  	/*채용 공고 정보(회사,소개, 관련업무분야,마감일)*/
  	const ItemText = document.createElement('ul');
  		ItemText.className='employ__box__info';
  	const title= document.createElement('li');
      	title.innerText=v.compName;
  	const content = document.createElement('li');
  	const contentTextStrong = document.createElement('strong');
  		contentTextStrong.innerText=v.recruitTitle;
  	let recruit = document.createElement('li');
  		const recruitRequ = v.recruitRequ;           	
  		if(v.recruitRequ =='0'){
  			recruit.innerText='신입';
  		}else if(v.recruitRequ =='1'){
  			recruit.innerText='경력';
  		}else if(v.recruitRequ =='2'){
  			recruit.innerText='신입 경력';
  		}
  	const skillBox = document.createElement("div");
  		  skillBox.className = "tag__box";
  		  i.forEach((v) => {
  		    const skill = document.createElement("span");
  		    skill.className ="tag";
  		    skill.innerText = "" + v;
  		    skillBox.appendChild(skill);
  		  });

  	const date = document.createElement('div');
  		date.className='date';
  	const dateSpan = document.createElement('span');
  		dateSpan.innerText = v.createdAt;
  		
  	content.appendChile(contentTextStrong);
  	ItemText.appendChile(title);
  	ItemText.appendChile(content);
  	ItemText.appendChile(recruit);
  	skillBox.appendChile(skill);
  	date.appendChild(dateSpan);	
  	recruitItemBox.appendChile(recruitNo);
  	recruitItemBox.appendChile(ItemText);
  	recruitItemBox.appendChile(skillBox);
  	recruitItemBox.appendChile(date);
	itemList.appendChile(recruitItemBox);
  }
  
	
  

  
  
  const IngMoreBtn= document.querySelector('.more1');
  console.log(IngMoreBtn);
  const cno = document.querySelector('.nowCno').value;
  IngMoreBtn.addEventListener('click',()=>{ 
  let currentPageNum = 2;
  axios.get('recruitLoad.co', {
        params: {
          currentPage: currentPageNum++,
          compNo:cno
        }
      }) .then((result)=>{
          result.data["rlist1"].forEach((v) => {
          recruitItem1(v, result.data["skillMap"][v.recruitNo]);
          currentPageNum = currentPageNum++;
          console.log(currentPageNum);
          
          });

        }).catch(function(error){
      	  console.log(error);
        })
        .then(function(){
        	  href();
        })
      })
  
	
  let href =()=>{
  		 const ingBox = document.querySelector('.employ__box__ing');
			 ingBox.querySelectorAll('.content__wrapper').forEach((v,i)=>{
	              v.addEventListener('click',()=>{
		              let rno = document.querySelectorAll('.recruit-no')[i];
		              console.log(rno);
		             location.href="detail.re?rno="+rno.value;
		         	 
	         	    });
	    	      });
  }
  
  
  href();

  
  
  </script>
  <!-- 구성원 추가 모달 -->
  <jsp:include page="../common/footer.jsp"/>
  </body>
  
</html>
