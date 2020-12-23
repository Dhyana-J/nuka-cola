<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/profile/profile_like_bookmark.css" />
    <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<jsp:include page="../common/mainMenu.jsp"/>
      <section class="visual__section">
        <div class="inner">
          <div class="visual__left">
            <div class="avatar">
                <img src= "../../assets/profile.png" alt="logo">
            </div>
            <div>
              <div class="main__info">
                <strong>${loginUser.userName}</strong>
                <span>Apple.Inc</span>
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
                      <li>PROFILE</li>
                      <li>POST</li>
                      <li class="nav-active">LIKE</li>
                  </ul>
              </div>
          
    <div class="main__main__section">
        <div class="main__section__left">
            <div class="content__wrapper">
              <ul class="left__info">
                <li>TOP</li>
                <li>팔로잉</li>
                <li>팔로워</li>
                <li>북마크</li>
                <li onClick='location.href="list.sub"'>구독기업</li>
                <li>좋아요게시글</li>
                <li>연결</li>
              </ul>
            </div>
        </div>
        <div class="main__section__right">
            <div class="content__wrapper">
                <div class="section__content__title">
                    <strong>북마크한 채용공고</strong>  
                </div>
                <div class="just__text">${blistCount}개의 공고</div>
				
                <div class="just__text__item">
                <c:forEach var="b" items="${blist}">
                	<div class="bookmark__item__box">
                	<input class='recruit-no' type="hidden" name="recruitNo" value='${b.recruitNo}'>
	                	<div class="bookmark__item__box__right">
		                    <span class="just__text__title">${b.compName}</span>
		                    <span class="just__text__content"><strong>${b.recruitTitle}</strong></span>
		                    
		                    <c:if test="${b.recruitRequ eq '0'}">
		                    	<span class="just__text__recruit">신입</span>
		                    </c:if>
		                    <c:if test="${b.recruitRequ eq '1'}">
		                    	<span class="just__text__recruit">경력</span>
		                    </c:if>
		                    <c:if test="${b.recruitRequ eq '2'}">
		                    	<span class="just__text__recruit">신입 경력</span>
		                    </c:if>
			                <div class="section__content__box">
								<c:forEach var="skill" items="${skillMap.get(b.recruitNo)}">
			                    <span class="compindus__box">${skill}</span>
								</c:forEach>
							</div>
							<div class="date">${b.createdAt}</div>
	                	</div> 
		                <div class="bookmark__item__box__left">
		                	<a class="section__content__title__cencel">북마크 제외</a>
		                </div>           
                </div>
                </c:forEach>
                </div>
					
            </div>
            </div>
                    
        </div>

        </div>
    </div>
            <script defer>
            
            const createBookmarkItem =(v,i)=>{
            	console.log(i);
            	const itemList = document.querySelector('.just__text__item');
            	const bookmarkItemBox = document.createElement('div');
            		bookmarkItemBox.className='bookmark__item__box';
            	const recruitNo = document.createElement('input');
        			recruitNo.type='hidden';
        			recruitNo.name='recruitNo';
            		recruitNo.className='recruit-no';
            		recruitNo.value=v.recruitNo;

            	/*북마크 공고 정보(회사,소개, 관련업무분야,마감일)*/
            	const bookmarkItemRight = document.createElement('div');
            		bookmarkItemRight.className='bookmark__item__box__right';
            	const title= document.createElement('span');
	            	title.className='just__text__title';
	            	title.innerText=v.compName;
            	const content = document.createElement('span');
            		content.className='just__text__content';
            	const contentTextStrong = document.createElement('strong');
            		contentTextStrong.innerText=v.recruitTitle;
            	let recruit = document.createElement('span');
            		recruit.className='just__text__recruit';
            		const recruitRequ = v.recruitRequ;           	
            		if(v.recruitRequ =='0'){
            			recruit.innerText='신입';
            		}else if(v.recruitRequ =='1'){
            			recruit.innerText='경력';
            		}else if(v.recruitRequ =='2'){
            			recruit.innerText='신입 경력';
            		}
            	const skillBox = document.createElement("div");
            		  skillBox.className = "section__content__box";
            		  i.forEach((v) => {
            		    const skill = document.createElement("span");
            		    skill.className = "compindus__box";
            		    skill.innerText = "" + v;
            		    skillBox.appendChild(skill);
            		  });

            	const date = document.createElement('div');
            		date.className='date';
            		date.innerText=v.createdAt;
            		
            	/*북마크 취소*/
            	const bookmarkLeft = document.createElement('div');
            		bookmarkLeft.className='bookmark__item__box__left';
            	const bookmarkCencle = document.createElement('a');
            		bookmarkCencle.className='section__content__title__cencel';
            		bookmarkCencle.innerText='북마크 제외';
            		
            		
            	
            	content.appendChild(contentTextStrong);	
            	bookmarkLeft.appendChild(bookmarkCencle);
            	bookmarkItemRight.appendChild(title);
            	bookmarkItemRight.appendChild(content);
            	bookmarkItemRight.appendChild(recruit);
            	bookmarkItemRight.appendChild(skillBox);
            	bookmarkItemRight.appendChild(date);
            	bookmarkItemBox.appendChild(recruitNo);	
            	bookmarkItemBox.appendChild(bookmarkItemRight);
            	bookmarkItemBox.appendChild(bookmarkLeft);
            	itemList.appendChild(bookmarkItemBox);


            }
            
          	
            
            
            /*페이지*/

            let currentPageNum = 2;
            window.addEventListener('scroll',()=>{
              if(window.pageYOffset + document.documentElement.clientHeight >
                      document.documentElement.scrollHeight - 1){
                console.log('로드!')
                axios.get('load.bk', {
                  params: {
                    currentPage: currentPageNum++
                  }
                }) .then((result)=>{

                    result.data["blist"].forEach((v) => {
                      createBookmarkItem(v, result.data["skillMap"][v.recruitNo]);
                    
                    });

                  }).catch(function(error){
                	  console.log(error);
                  })
                  .then(function(){
                	  cancel();
                  	  href();
                  })
                }
              });
            
            
			const cancel=()=>{
			  document.querySelectorAll('.section__content__title__cencel').forEach((v,i)=>{
				  console.log(v);
		            v.addEventListener('click',()=>{

			              let item = document.querySelectorAll('.bookmark__item__box')[i];

			              let rno = document.querySelectorAll('.recruit-no')[i].value;
			              
			              axios.get('delete.bk',{
			         		 params:{
			         			recruitNo:rno
			         		 }
			         	 })
			         	 .then(function(){
			         	 });
			              
			              item.remove(); 

		       	    });
		  	      });

			}
            let href =()=>{
					 document.querySelectorAll('.bookmark__item__box__right').forEach((v,i)=>{
			              v.addEventListener('click',()=>{
				              let rno = document.querySelectorAll('.recruit-no')[i];
				              console.log(rno);
				             location.href="detail.re?rno="+rno.value;
				         	 
			         	    });
			    	      });
            }
            
            
            href();
            cancel();

            </script>



  	      

          </main>
          <jsp:include page="../common/footer.jsp"/>
</body>
</html>