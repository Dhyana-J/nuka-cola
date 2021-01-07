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
                <strong>방글이</strong>
                <span>Apple.Inc</span>
                <span>Front-end Amazone AWS, github에 관심</span>
              </div>
              <ul class="people__info">
               	<li>팔로워 <strong>${countFollowers }</strong></li>
                <li>팔로잉 <strong class="following-count">${countFollowings }</strong></li>
                <li>연결 <strong class="connection-count">${countConnections }</strong></li>
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
                    
                    
                  <div class="content__wrapper following-list">
                  
                    <div class="section__content__title">
                        <strong>FOLLOWING</strong>
                    </div><br>
                          <span class="following__much">&nbsp;
                            <strong class="following-count">${count}</strong> 명을 팔로잉
                          </span>
                    <br><br>
                    
                    <c:forEach var="userInfo" items="${following}">
                    
	                	<div class="profile-wrapper">
	                	
		                      <div class="content__profile">
		                      
		                         <c:choose>
			                      	<c:when test="${userInfo.userAvatar eq null }">
				                        <img class="circle" src="resources/assets/conn.png" alt="img">
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
		                        <span class="toProfile" onclick="cancelFollowing(event.target,${loginUser.userNo},${userInfo.userNo });">취소</span>
		                        
	                	</div>     
                        
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
	if(${fgPi.currentPage}==${fgPi.maxPage}) stopLoad=false;
	
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
					+' src="resources/assets/conn.png"'
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
					+'<span class="toProfile" onclick="location.href='+'""'+'>프로필 &nbsp;&nbsp;&nbsp;</span>'
					+'<span class="toProfile" onclick="cancelFollowing(event.target,${loginUser.userNo},'+v.userNo+');">취소</span>'
				+'</div>';
			area.insertAdjacentHTML('beforeend',profile);
			
		});
	};
	
	//스크롤 바닥까지 내리면 리스트 추가 로드(스크롤 바닥이면 추가로드 안함)
	window.addEventListener('scroll',()=>{
	  if(window.pageYOffset + document.documentElement.clientHeight >
	          document.documentElement.scrollHeight - 1 && stopLoad!=true){
	    console.log('로드!')
	    axios.get('loadFollowingList.us', {
	      params: {
	        currentPage: currentPageNum++,
	        userNo: userNo
	      }
	    })
	    .then(function(loadedInfo){
	  	  	
	    	let pi = loadedInfo.data.piBox[0];//넘어온 페이지인포객체
	    	let list = loadedInfo.data.following; //넘어온 following리스트
	    	let area = document.querySelector('.following-list');//following리스트 담아줄 구역
	    	
	    	
	    	loadList(list,area);
	    	
	    	if(pi.currentPage==pi.maxPage) stopLoad=true; //현재페이지가 마지막페이지면 로드를 멈춰라!
	    	
		})
		.catch(function(error){
			console.log(error);            		  
		});
	  }
	});
		  

</script>


<!-- 팔로잉 취소 누르면 리스트에서 삭제해주는 자바스크립트 -->
<script defer>

	const cancelFollowing = (v,userNo,followingNo)=>{
		
		axios.get('cancelFollowing.conn',{
			params:{
				userNo:userNo,
				followingNo:followingNo
			}
		})
		.then(function(res){
			if(res.data.result>0){
				console.log('팔로잉 취소 성공!')
				console.log(res.data.connectionCount);
				//클릭된 버튼을 포함한 유저정보 요소를 화면에서 지워준다.(.profile-wrapper 요소들 모두 삭제)
				v.parentNode.remove();
				
				// 뷰에 표시되는 팔로잉하는 사람 숫자 1 감소시켜준다.
				document.querySelectorAll('.following-count').forEach((v)=>{
					v.innerText--;
				})
				// 뷰에 표시되는 연결된 사람 숫자 업데이트
				document.querySelector('.connection-count').innerText=res.data.connectionCount;
				
			}else{
				alert('문제가 발생했습니다.');
			}
			
			
		})
		.catch(function(error){
			console.log(error);
		});
		
		
	}
	
</script>            	  

</body>
</html>