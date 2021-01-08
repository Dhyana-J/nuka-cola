<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
    <link rel="stylesheet" href="resources/css/profile/profile__follow.css" />
    <link rel=”stylesheet” href=”icono.min.css”>
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
	
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
    <jsp:include page="../common/mainMenu.jsp"/>
    
    
      <section class="visual__section">
        <div class="inner">
          <div class="visual__left">
            <div class="avatar">
                <img src= "resources/assets/profile.png" alt="logo">
            </div>
            <div>
              <div class="main__info">
                <strong>${ loginUser.userName }</strong>
                <span>${ loginUser.compName }</span>
                <span>Front-end Amazone AWS, github에 관심</span>
              </div>
              <ul class="people__info">
                <li>팔로워 <strong>${countFollowers }</strong></li>
                <li>팔로잉 <strong>${countFollowings }</strong></li>
                <li>연결 <strong>${countConnections }</strong></li>
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
 							<li><a href="initFollowing.us?userNo=${loginUser.userNo }">팔로잉</a></li>
			                <li><a href="initFollower.us?userNo=${loginUser.userNo }">팔로워</a></li>
			                <li><a href="list.bk?userNo=${loginUser.userNo}">북마크</a></li>
			                <li><a href="list.sub?userNo=${loginUser.userNo}">구독기업</a></li>
			                <li><a href="profileLikePost.us?userNo=${loginUser.userNo }">좋아요게시물</a></li>
			                <li><a href="initConnect.us?userNo=${loginUser.userNo }">연결</a></li>
                      </ul>
                    </div>
                </div>
                <div class="main__section__right">
                    
                    
                  <div class="content__wrapper follower-list">
                  
                    <div class="section__content__title">
                        <strong>FOLLOWER</strong>
                    </div><br>
                          <span class="following__much">&nbsp;
                            <strong>${count}</strong> 명이 팔로우
                          </span>
                    <br><br>
                    
                    <c:forEach var="userInfo" items="${follower}">
                    
	                    
	                      <div class="content__profile">
	                      
	                      <c:choose>
	                      	<c:when test="${userInfo.userAvatar eq null }">
		                        <img class="circle" src="resources/assets/moomin.jpg" alt="img">
	                      	</c:when>
	                      	<c:otherwise>
		                        <img class="circle" src="${pageContext.request.contextPath}/${userInfo.userAvatar} " alt="img">
	                      	</c:otherwise>
	                      </c:choose>
	                      
	                        <div class="content__introduce">
	                            <strong>${userInfo.userName }</strong>
	                            <p>${userInfo.userComp}</p>
	                        </div>
	                   	  </div><!-- content__profile -->
	                        <span class="toProfile" onclick="location.href=''">프로필</span> &nbsp;
	                        
                    
                    </c:forEach>
                    
              

                 </div><!-- content__wrapper-->

                </div><!-- main__section__right -->
             </div>
           </div>




          </main>


<!-- 유저리스트 불러오는 자바스크립트 -->
<script defer>

	let userNo = ${loginUser.userNo};
	let currentPageNum = 2;
	let stopLoad = false;
	
	//현재페이지가 마지막페이지면 그만로드시키도록 만든다.
	if(${frPi.currentPage}==${frPi.maxPage}) stopLoad=false;
	
	//리스트 추가해주는 메소드
	const loadList = (list,area)=>{
		list.forEach((v)=>{ //리스트의 각 요소 v에 대해

			
			//유저회사 비어있는 경우 ''로 대체
			if(v.userComp==undefined) v.userComp='';

			
			let profile = '<div class="profile-wrapper">'
					+'<div class="content__profile">';
					
				//유저이미지 없으면 기본이미지 세팅해준다.
				if(v.userAvatar==undefined){
					profile = profile
					+'<img'
					+' class="circle"'
					+' src="resources/assets/moomin.jpg"'
					+' alt="img"'+'/>';
				}else{
					profile = profile
					+'<img'
					+' class="circle"'
					+' src="${pageContext.request.contextPath}/'+v.userAvatar+'"'
					+' alt="img"'+'/>';
				}
				
				profile = profile
					+'<div class="content_introduce">'
					+'<strong>'+v.userName+'</strong>'
					+'<p>'+v.userComp+'</p>'
					+'</div>'
					+'</div>'
					+'<span class="toProfile" onclick="location.href='+'""'+'>프로필</span>';
				+'</div>';
			area.insertAdjacentHTML('beforeend',profile);

		});
	};
	
	//스크롤 바닥까지 내리면 리스트 추가 로드(스크롤 바닥이면 추가로드 안함)
	window.addEventListener('scroll',()=>{
	  if(window.pageYOffset + document.documentElement.clientHeight >
	          document.documentElement.scrollHeight - 1 && stopLoad!=true){
	    console.log('로드!')
	    axios.get('loadFollowerList.us', {
	      params: {
	        currentPage: currentPageNum++,
	        userNo: userNo
	      }
	    })
	    .then(function(loadedInfo){
	  	  	
	    	let pi = loadedInfo.data.piBox[0];
	    	let list = loadedInfo.data.follower;
	    	let area = document.querySelector('.follower-list');
	    	console.log('list출력');
	    	console.log(list);
	    	console.log('area출력');
	    	console.log(area);
	    	
	    	loadList(list,area);
	    	
	    	if(pi.currentPage==pi.maxPage) stopLoad=true;
	    	
		})
		.catch(function(error){
			console.log(error);            		  
		});
	  }
	});
		  
</script>


</body>
</html>