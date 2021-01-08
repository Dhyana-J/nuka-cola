<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    
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
    <link rel="stylesheet" href="resources/css/profile/profile(script-company).css" />
    <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
     <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<body>
   <jsp:include page="../common/mainMenu.jsp"/>
      <section class="visual__section">
        <div class="inner">
          <div class="visual__left">
            <div class="avatar">
                <img  src=" ${pUser.userAvatar eq null ? 'resources/assets/profile.png' : pUser.userAvatar  }" alt="logo">
            </div>
            <div>
              <div class="main__info">
                <input type="hidden" name="email" value="${pUser.email }" id="main-info-email" />
	            <input type="hidden" name="uno" value="${pUser.userNo }" id="main-info-userno" />
	            <strong>${ pUser.userName }</strong> <span>${ pUser.userComp }</span>
	            <span>Front-end Amazone AWS, github에 관심</span>
              </div>
              <ul class="people__info">
               <li>팔로잉 <strong>${ countFollowers ne null ? countFollowers : 0 }</strong></li>
               <li>팔로워 <strong>${ countFollowings ne null ? countFollowings : 0 }</strong></li>
               <li>연결 <strong>${ countConnections ne null ? countConnections : 0 }</strong></li>
              </ul>
            </div>
          </div>
          <button type="button" id="popup_open_btn" class="btn visual__right"
          onclick='location.href="list.ap?userNo=${pUser.userNo}"'>지원이력</button>
        </div>
      </section>

      <main class="content__section">
          <div class="inner">
              <div class="section__title">
                  <ul>
                      <li onclick='location.href="profile.me?userNo=${pUser.userNo}" '>PROFILE</li>
                      <li  onclick='location.href="profilePost.us?userNo=${pUser.userNo}" '>POST</li>
                      <li onClick='location.href="initFollowing.us?userNo=${pUser.userNo}"'>LIKE</li>
                  </ul>
              </div>
              
              <div class="main__main__section">
                <div class="main__section__left">
                    <div class="content__wrapper">
                      <ul class="left__info">
                        <li>TOP</li>
		                <li><a href="initFollowing.us?userNo=${pUser.userNo}">팔로잉</a></li>
		                <li><a href="initFollower.us?userNo=${ pUser.userNo }">팔로워</a></li>
		                <li onClick='location.href="list.bk?userNo=${ pUser.userNo}"'>북마크</li>
		                <li onClick='location.href="list.sub?userNo=${ pUser.userNo}"'>구독기업</li>
		                <li>좋아요게시글</li>
		                <li><a href="initConnect.us?userNo=${ pUser.userNo }">연결</a></li>
                      </ul>
                    </div>
                </div>
                <div class="main__section__right">
                    
                    
                  <div class="content__wrapper">
                    <div class="section__content__title">
                        <strong>구독기업</strong>
                      </div><br>
                          <span class="following__much">&nbsp;
                            <strong>${csCount}</strong>개의 공고
                          </span>
                    <br><br>
                    	<c:forEach var="cs" items="${cslist}">
                          <div class="script__company__box">
                            <input type="hidden" class="comp-no" name="compNo" value="${cs.compNo}">
                            <div class="company__box__left">
                                <div class="company__img__box">
                                <c:choose>
                                <c:when test="${empty cs.compLogo}">
                                	<img src="resources/assets/conn.png" alt="">
                                </c:when>
                                <c:otherwise>
                                	<img src="${cs.compLogo}" alt="">
                                </c:otherwise>
                                </c:choose>
                                </div>
                                <ul>
                                    <li class="company__info__title">${cs.compName}<span>구성원수[${cs.compHeadcount}]&nbsp;&nbsp;Sinece${cs.compBirth}</span> </li>
                                    <li>${cs.compInfo}</li>
                                </ul>
                            </div>
                            <div class="company__box__right">
                            <c:if test="${pUser.userNo == loginUser.userNo}">
                                <span class="cancle-btn">삭제</span>
                            </c:if>
                            </div>

                          </div>

                   	 </c:forEach>

					


                   </div>
                </div>
              </div>
            </div>
 <script defer>
 			
            const createScriptItem =(v)=>{
            	const scriptItemList = document.querySelectorAll('.content__wrapper')[1];
            	const scriptItemBox = document.createElement('div');
            		scriptItemBox.className='script__company__box';
            	const compNo = document.createElement('input');
	            	compNo.type='hidden';
	            	compNo.name='compNo';
	            	compNo.className='comp-no';
	            	compNo.value=v.compNo;
            	/*스크립트 정보(회사,소개)*/
            	const scriptItemLeft = document.createElement('div');
            		scriptItemLeft.className='company__box__left';
            	const imgBox= document.createElement('div');
            		imgBox.className='company__img__box';
	            const img= document.createElement('img');
	            	if(v.compLogo==null){
	            		img.src="resources/assets/conn.png";
	            	}else{
	            	img.src=v.compLogo;
	            	}
            	const ul = document.createElement('ul');
            	const li1 = document.createElement('li');
            		li1.className ='company__info__title';
            		li1.innerText=v.compName;
            	const compCount = document.createElement('span');
            			const nbsp = String.fromCharCode(160)+String.fromCharCode(160);
            		compCount.innerText='구성원수'+v.compHeadcount+nbsp+'Sinece'+v.compBirth;
            	const li2 = document.createElement('li');
            	    li2.innerText=v.compInfo;
            	/*북마크 취소*/
            	const scriptItemRight = document.createElement('div');
            		scriptItemRight.className='company__box__right';
            	const cancleBtn = document.createElement('span');
            	if(${loginUser.userNo == pUser.userNo}){
            		cancleBtn.className='cancle-btn';
            		cancleBtn.innerText='삭제';
            	}
            	
            	imgBox.appendChild(img);	
            	li1.appendChild(compCount);
            	ul.appendChild(li1);
            	ul.appendChild(li2);
            	scriptItemLeft.appendChild(imgBox);
            	scriptItemLeft.appendChild(ul);
            	scriptItemRight.appendChild(cancleBtn);
            	scriptItemBox.appendChild(scriptItemLeft);
            	scriptItemBox.appendChild(scriptItemRight);
            	scriptItemBox.appendChild(compNo);
            	scriptItemList.appendChild(scriptItemBox);

            }
            
          	
            
            
            /*페이지*/

            let currentPageNum = 1;
            window.addEventListener('scroll',()=>{
              if(window.pageYOffset + document.documentElement.clientHeight >
                      document.documentElement.scrollHeight - 1){
                console.log('로드!')
                axios.get('load.sub', {
                  params: {
                	userNo:${loginUser.userNo},
                    currentPage: ++currentPageNum
                  }
                }) .then((result)=>{

                    result.data["cslist"].forEach((v) => {
                    	createScriptItem(v);
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
			  document.querySelectorAll('.cancle-btn').forEach((v,i)=>{
		            v.addEventListener('click',()=>{
			              let item = v.parentNode.parentNode;
			              let cs = item.querySelector('.comp-no').value; 
			              console.log(cs);
			            
			              axios.get('delete.sub',{
				         		 params:{
				         			userNo:${loginUser.userNo},
				         			compNo:cs
				         		 }
				         	 })
				         	 .then(()=>{	 
				         	 });
			              
			              const listCount= document.querySelector('.following__much');
			              let listCountNum = listCount.querySelector('strong').innerText;
			       		  listCountNum = parseInt(listCountNum);
			       		  console.log(listCountNum);
			       		  listCountNum = --listCountNum;
		         		  listCount.querySelector('strong').innerText = listCountNum;
			              item.remove(); 

		       	    });
		  	      });

			}
			
			
			
            let href =()=>{
					 document.querySelectorAll('.company__box__left').forEach((v,i)=>{
			              v.addEventListener('click',()=>{
				              let cno = document.querySelectorAll('.comp-no')[i].value;
				              console.log(cno);
				             location.href="profileMain.co?cno="+cno;
				         	 
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