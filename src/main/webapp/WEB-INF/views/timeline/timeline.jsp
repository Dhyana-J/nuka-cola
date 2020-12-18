<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TIMELINE || NUKA-COLA</title>
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
    <link rel="stylesheet" href="resources/css/timeline.css" />
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  </head>
  <body>
  	
    <jsp:include page="../common/mainMenu.jsp"/>

    <!-- 컨텐츠 -->
    <main>
      <div class="inner">
        <div class="timeline__section-left">
          <h1>TIMELINE</h1>

          <!-- 타임라인배너 -->
          <div class="content__wrapper content_title_banner">
            <p>WHAT HAPPENED TODAY?</p>
<%--                <p>${loginUser.userName}</p>--%>
            <img src="resources/assets/timeline_title_img.png" alt="배너이미지" />
          </div>

          <!-- 게시글작성 -->
          <div class="content__wrapper post_form_wrapper">
            <h3>새로운 게시글 작성</h3>
            <form action="insert.pos" method="post" class="post_form" enctype="multipart/form-data">
              <span>오늘은 무슨일이 있었나요?</span>
              <textarea name="postContent" id=""></textarea>
              <input type="hidden" name="userNo" value="${loginUser.userNo}">
              <div class="post_form-btn-wrapper">
                <div onclick="imgUpload()" class="image__input_box">
                  <input name="upfile" id="img-input" type="file" hidden />
                  <p>이미지</p>
                  <i class="material-icons"> wallpaper </i>
                </div>
                <button type="submit" class="btn btn-blue">등록</button>
              </div>
            </form>
            <button class="post_form-btn">+</button>
          </div>

          <script defer>
            const imgUpload = ()=>{
              document.querySelector('#img-input').click();
            }
          </script>

        <c:forEach var="p" items="${ list }">
          <!-- 게시글아이템 -->
          <div class="content__wrapper post__item-wrapper">
            <input type="hidden" class="user_no_input" value="${p.userNo}">
            <div class="post__user-info">
              <div class="avatar-small">
                <img src="../../assets/avatar.png" alt="" />
              </div>
              <div class="user__summary">
                <strong>${p.userName}</strong>
                <small>${p.userComp}</small>
              </div>
              <div class="follow__btn">
                <i class="material-icons">person_add</i>
                <p>FOLLOW</p>
              </div>
            </div>
            <article>
              ${p.postContent}
            </article>
            <span class="post__date">${p.createdAt}</span>
            <div class="post__btn__wrapper">
              <div class="like_btn">
                <i class="material-icons"> thumb_up_alt </i>
                <span>LIKE</span>
              </div>
              <div class="comment-open like_btn">
                <i class="material-icons"> comment </i>
                <span>COMMENT</span>
              </div>
            </div>

            <!-- 댓글목록 -->
            <ul class="post__comment_list">
              <input class='post-id' type="hidden" name="postNo" value='${p.postNo}'>
              <div class="comment_input">
                <span>댓글등록</span>
                <textarea class='comment-input' name="commentContent"></textarea>
                <button type='button' class='btn btn-blue comment-insert-btn'>ADD</button>
              </div>

            </ul>
          </div>

          </c:forEach>


        </div>
        <div class="timeline__section-rifht">
          <div class="content__wrapper profile__content">
            <div class="user__profile">
              <div class="avatar-mid">
                <img src="../../assets/avatar.png" alt="" />
              </div>
              <ul>
                <li><span>팔로워</span> <b>18</b></li>
                <li><span>팔로잉</span> <b>28</b></li>
                <li><span>연결</span> <b>8</b></li>
              </ul>
            </div>
            <div class="profile__summary">
              <p>${ loginUser.userName }님</p>
              <span>MicroSoft@AzureInterfaceEngineer</span>
            </div>
            <div class="profile__btn_wrapper">
              <button class="btn">PROFILE</button>
              <button class="btn btn-blue" onClick='location.href="logout.me"'>LOGOUT</button>
            </div>
          </div>
          <div class="content__wrapper recommend__comp">
            <p class="rec__comp_title">기업추천</p>
            <ul>
              <li>
                <div class="comp_avatar">
                  <img src="resources/assets/loginImage.jpg" alt="" />
                </div>
                <div class="comp_summary">
                  <b>Rocket Punch</b>
                  <span>Social Network</span>
                  <span>200명의 구성원</span>
                </div>
              </li>
              <li>
                <div class="comp_avatar">
                  <img src="../../assets/loginImage.jpg" alt="" />
                </div>
                <div class="comp_summary">
                  <b>Rocket Punch</b>
                  <span>Social Network</span>
                  <span>200명의 구성원</span>
                </div>
              </li>
              <li>
                <div class="comp_avatar">
                  <img src="../../assets/loginImage.jpg" alt="" />
                </div>
                <div class="comp_summary">
                  <b>Rocket Punch</b>
                  <span>Social Network</span>
                  <span>200명의 구성원</span>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </main>
  </body>
  <script defer>

    const createCommentItem = (v,i)=>{
      const ListContainer = document.querySelectorAll(".post__comment_list")[i]
      const commentBox = document.createElement('li')
      const userBox=document.createElement('div')
      userBox.className='post__user-info'
      const avatarBox=document.createElement('div')
      avatarBox.className='avatar-small'
      const userAvatar = document.createElement('img')
              userAvatar.src = v.userAvatar;
      avatarBox.appendChild(userAvatar);
      const userSummary = document.createElement('div');
            userSummary.className='user__summary'
      const userName = document.createElement('strong')
            userName.innerText = v.userName;
      const userComp = document.createElement('small');
            userComp.innerText = v.userComp;
      const postDate = document.createElement('span')
            postDate.className='post__date'
            postDate.innerText = v.createdAt;
      const commentContent = document.createElement('p');
            commentContent.className='comment_content';
            commentContent.innerText=v.commentContent;
      const userNo = document.createElement('input');
            userNo.type='hidden';
            userNo.value=v.userNo;
            userNo.className = 'comment-user-no';
      userSummary.appendChild(userName);
      userSummary.appendChild(userComp);
      userBox.appendChild(avatarBox);
      userBox.appendChild(userSummary);
      userBox.appendChild(postDate);
      commentBox.appendChild(userBox);
      commentBox.appendChild(commentContent);
      ListContainer.appendChild(userNo);
      ListContainer.appendChild(commentBox);
    }

    document.querySelectorAll('.comment-insert-btn').forEach((v,i)=>
            v.addEventListener('click',()=>{
              axios.get('insert.com?postNo='+document.querySelectorAll('.post-id')[i].value+"&userNo="+'${loginUser.userNo}'+'&commentContent='+document.querySelectorAll('.comment-input')[i].value)
                      .then((res)=>{
                        const data = {
                          userAvatar:"${loginUser.userAvatar}",
                          commentContent:document.querySelectorAll('.comment-input')[i].value,
                          userComp:"${loginUser.userComp}",
                          userNo:"${loginUser.userNo}",
                          userName:"${loginUser.userName}",
                        }
                        createCommentItem(data,i);
                      })
                      .catch((e)=>{
                        console.error(e)
                      })
            })
    )

    let currentBtnNumber = 0;
    const loadComment=()=>{
      document.querySelectorAll('.comment-open').forEach((v,i)=>{
        v.addEventListener('click',()=>{
          if(currentBtnNumber!==i){
            currentBtnNumber = i;
            axios.get('load.com', {
              params: {
                pno: document.querySelectorAll('.post-id')[i].value
              }
            })
            .then((res) =>{
              // const ListContainer = document.querySelectorAll(".post__comment_list")[i]
              res.data.forEach(v=>{
                createCommentItem(v,i);
              })
            })
          }else{
            currentBtnNumber = 0;
            console.log(document.querySelectorAll(".post__comment_list"));
            const ListContainer = document.querySelectorAll(".post__comment_list")[i]
            ListContainer.childNodes.forEach(v=>{
              if(v.nodeName==='LI'){
                v.remove();
              }
            })
          }
        })
      })
    }

    loadComment()

    document.querySelector(".post_form-btn").addEventListener("click", (e) => {
      document
        .querySelector(".post_form_wrapper")
        .classList.toggle("post_form-active");
    });
    document.querySelectorAll(".comment-open").forEach((v, i) =>
      v.addEventListener("click", () => {
        v.classList.toggle("comment_btn_active");
        document
          .querySelectorAll(".post__comment_list")
          [i].classList.toggle("comment_list_active");
      })
    );


  </script>
</html>
