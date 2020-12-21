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
<<<<<<< HEAD
  
    <!-- 메인메뉴 -->
    <div class="main__menu__container">
      <div class="inner">
        <div class="menu__left">
          <div class="search__box">
            <input type="text" placeholder="검색어를 입력해주세요" />
            <i class="material-icons"> search </i>
          </div>
          <ul class="menu__nav">
            <li><a href="#">TIME LINE</a></li>
            <li><a href="#">PARTNERS</a></li>
            <li><a href="#">COMPANIES</a></li>
            <li><a href="#">EMPLOYMENT</a></li>
          </ul>
        </div>
        <div class="menu__right">
          <p>어서오세요 <b>가나다</b>님</p>
          <ul>
            <li>알림</li>
            <li>메시지</li>
            <li><a herf="profile.me">PROFILE</a></li>
            <li>LOGOUT</li>
          </ul>
        </div>
      </div>
    </div>
    <script>
      document.querySelector(".right__header").addEventListener("click", () => {
        if (
          document
            .querySelector(".main__menu__container")
            .classList.contains("main__menu-active")
        ) {
          document.querySelector(".main__menu__container").style.animation =
            "slideOffMenu 0.5s ease-in-out forwards";
          setTimeout(() => {
            document
              .querySelector(".main__menu__container")
              .classList.toggle("main__menu-active");
            document.querySelector(".main__menu__container").style.animation =
              "slideMenu 0.5s ease-in-out forwards";
          }, 300);
        } else {
          document
            .querySelector(".main__menu__container")
            .classList.toggle("main__menu-active");
        }
      });
    </script>
=======
>>>>>>> 778c28cc3f30161bf063d11cb14d912c80b6927e

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
            <div class="post__comment_list">
              <input class='post-id' type="hidden" name="postNo" value='${p.postNo}'>
              <div class="comment_input">
                <span>댓글등록</span>
                <textarea class='comment-input' name="commentContent"></textarea>
                <button type='button' class='btn btn-blue comment-insert-btn'>ADD</button>
              </div>
              <ul class="post__comment_box">

              </ul>
            </div>
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

    const createCommentItem = (v,i,c=0)=>{
      const ListContainer = document.querySelectorAll(".post__comment_box")[i]
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
      commentBox.appendChild(userNo);
      if(c!==0){
        ListContainer.prepend(commentBox);
      }else{
        ListContainer.appendChild(commentBox);
      }

    }

    const commentInsertWatcher=()=>{
      document.querySelectorAll('.comment-insert-btn').forEach((v, i) =>
              v.addEventListener('click', () => {
                axios.get('insert.com?postNo=' + document.querySelectorAll('.post-id')[i].value + "&userNo=" + '${loginUser.userNo}' + '&commentContent=' + document.querySelectorAll('.comment-input')[i].value)
                        .then((res) => {
                          const data = {
                            userAvatar: "${loginUser.userAvatar}",
                            commentContent: document.querySelectorAll('.comment-input')[i].value,
                            userComp: "${loginUser.userComp}",
                            userNo: "${loginUser.userNo}",
                            userName: "${loginUser.userName}",
                          }
                          createCommentItem(data, i, 1);
                          document.querySelectorAll('.comment-input')[i].value = "";
                        })
                        .catch((e) => {
                          console.error(e)
                        })
              })
      )
    }

    let currentBtnNumber =9999;
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
              res.data.forEach(v=>{
                createCommentItem(v,i);
              })
            })
          }else{
            currentBtnNumber = 9999;
            const ListContainer = document.querySelectorAll(".post__comment_box")[i]
            ListContainer.childNodes.forEach(s=>{
              if(s.nodeName==='LI'){
                s.remove();
              }
            })
          }
        })
      })
    }


    document.querySelector(".post_form-btn").addEventListener("click", (e) => {
      document
        .querySelector(".post_form_wrapper")
        .classList.toggle("post_form-active");
    });

    const commentOpenAll = (v,i)=>{
      console.log(v,i,'댓글열림');
      v.classList.toggle("comment_btn_active");
      document.querySelectorAll(".post__comment_list")[i].classList.toggle("comment_list_active");
    }
    const commentOpenWatcher=()=>{
      document.querySelectorAll(".comment-open").forEach((v, i) =>
              v.addEventListener("click", () => commentOpenAll(v,i))
      );
    }
    const removeCommentOpenWatcher=()=>{
      document.querySelectorAll(".comment-open").forEach((v, i) =>
              v.removeEventListener("click",() => commentOpenAll(v,i))
      );
    }
    const createPostItem = (v) =>{
      const contentWrapper = document.createElement('div')
        contentWrapper.classList.add('content__wrapper');
        contentWrapper.classList.add('post__item-wrapper');

      const postWriter = document.createElement('input');
        postWriter.type='hidden';
        postWriter.className = 'user_no_input';
        postWriter.value = v.userNo;

      const userBox=document.createElement('div')
        userBox.className='post__user-info'
        const avatarBox=document.createElement('div')
          avatarBox.className='avatar-small'
        const userAvatar = document.createElement('img')
          userAvatar.src = v.userAvatar;
        const userSummary = document.createElement('div');
          userSummary.className='user__summary'
          const userName = document.createElement('strong')
            userName.innerText = v.userName;
          const userComp = document.createElement('small');
            userComp.innerText = v.userComp;
        const followBtn = document.createElement('div')
          followBtn.className='follow__btn'
          const followIcon = document.createElement('i');
          followIcon.className='material-icons'
          followIcon.innerText = 'person_add'
          const followText = document.createElement('p')
          followText.innerText = 'FOLLOW'
      avatarBox.appendChild(userAvatar);
      userSummary.appendChild(userName);
      userSummary.append(userComp);
      userBox.appendChild(avatarBox)
      userBox.appendChild(userSummary)
      userBox.appendChild(followBtn)

      //본문
      const postContent = document.createElement('article');
        postContent.innerText=v.postContent;
      const postDate = document.createElement('span');
        postDate.className='post__date'
        postDate.innerText=v.updatedAt

      //버튼
      const postBtnWrapper = document.createElement('div');
        postBtnWrapper.className = 'post__btn__wrapper';

      const likeBtn = document.createElement('div');
        likeBtn.className='like_btn';
      const likeBtnIcon = document.createElement('i');
        likeBtnIcon.className = 'material-icons';
        likeBtnIcon.innerText = 'thumb_up_alt';
      const likeBtnText = document.createElement('span');
        likeBtnText.innerText = 'LIKE';
      likeBtn.appendChild(likeBtnIcon);
      likeBtn.appendChild(likeBtnText);
      const commentBtn = document.createElement('div');
      commentBtn.className='comment-open like_btn';
      const commentBtnIcon = document.createElement('i');
      commentBtnIcon.className = 'material-icons';
      commentBtnIcon.innerText = 'comment';
      const commentBtnText = document.createElement('span');
      commentBtnText.innerText = 'COMMENT';
      commentBtn.appendChild(commentBtnIcon);
      commentBtn.appendChild(commentBtnText);

      postBtnWrapper.appendChild(likeBtn);
      postBtnWrapper.appendChild(commentBtn);

      //댓글
      const commentBox = document.createElement('div');
        commentBox.className = "post__comment_list"

      const postNo = document.createElement('input');
        postNo.type='hidden';
        postNo.className='post-id';
        postNo.value=v.postNo;
        postNo.name='postNo';
      const commentInputBox = document.createElement('div');
        commentInputBox.className='comment_input';
      const commentInputTitle = document.createElement('span');
        commentInputTitle.innerText = '댓글등록';
      const commentInputForm = document.createElement('textarea');
        commentInputForm.className='comment-input';
        commentInputForm.name='commentContent';
      const commentInputBtn = document.createElement('button');
        commentInputBtn.type='button';
        commentInputBtn.className = 'btn btn-blue comment-insert-btn';
        commentInputBtn.innerText='ADD';
      commentInputBox.appendChild(commentInputTitle);
      commentInputBox.appendChild(commentInputForm);
      commentInputBox.appendChild(commentInputBtn);
      commentBox.appendChild(postNo);
      commentBox.appendChild(commentInputBox);

      const postCommentBox = document.createElement('ul');
        postCommentBox.className='post__comment_box';
      commentBox.appendChild(postCommentBox);

      contentWrapper.appendChild(postWriter);
      contentWrapper.appendChild(userBox);
      contentWrapper.appendChild(postContent);
      contentWrapper.appendChild(postDate);
      contentWrapper.appendChild(postBtnWrapper);
      contentWrapper.appendChild(commentBox);

      document.querySelector('.timeline__section-left').appendChild(contentWrapper);
    }
    //infinite
    let currentPageNum = 2;
    window.addEventListener('scroll',()=>{
      if(window.pageYOffset + document.documentElement.clientHeight >
              document.documentElement.scrollHeight - 1){
        console.log('로드!')
        axios.get('load.pos', {
          params: {
            currentPage: currentPageNum++
          }
        })
        .then((res)=>{

          console.log(res.data)
          //timeline__section-left 에 추가
          res.data.forEach(v=>{
            createPostItem(v);
          })
          removeCommentOpenWatcher()
          commentOpenWatcher();
          commentInsertWatcher();
          loadComment();
        })
      }
    })
    loadComment();
    commentOpenWatcher()
    commentInsertWatcher()
  </script>
</html>
