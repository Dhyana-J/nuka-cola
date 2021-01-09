
let loginUno = document.querySelector('.loginUser').value;

loginUno = parseInt(loginUno);
const uno = document.querySelector('.userNo').value;
console.log(uno);
const write =document.querySelector('.content__section');
const inner = write.querySelector('.inner');



//post
const createPostItem = (v) =>{
      const contentWrapper = document.createElement('div')
        contentWrapper.className = 'content__wrapper';
        
	  const contentTitle = document.createElement('div')
        contentTitle.className ='section__content__title';
        
      const pno = document.createElement('input');
        pno.type='hidden';
        pno.className = 'pno';
        pno.value = v.postNo;

      const img=document.createElement('img');
        img.className='circle';
        if(v.userAvatar==null){
        img.src = "resources/assets/conn.png"
        }else{
        img.src = v.userAvatar	
        }
      const introduce = document.createElement('div');
      	introduce.className='content__introduce';
      const introduceStrong = document.createElement('strong');
        introduceStrong.innerText = v.userName;
      const introduceP= document.createElement('p');
      	introduceP.innerText = v.userComp;
      const editandDelete = document.createElement('div');
      	 editandDelete.className='content__editandDelete';
      const editButton = document.createElement('button');
        	editButton.className ='btn-green';
        	editButton.innerText = 'EDIT';
      const deleteButton = document.createElement('button');
        	deleteButton.className = 'btn-red'
        	deleteButton.innerText = 'DELETE';
        
        if(uno==v.userNo){
       	editandDelete.style.display='block';
        }else{
        editandDelete.style.display='none';
        }
      const sysdate  =  document.createElement('div');
      	sysdate.className = 'sysdate';
      	sysdate.innerText = v.updatedAt;
      const justText = document.createElement('div');
      	justText.className = 'just__text__dv';
      const form = document.createElement('form');
       form.className = 'post_form';
       form.method = 'post';
       form.action = 'postUpdate.us'
       form.style.display='none';
      const textarea = document.createElement('textarea');
       textarea.name = 'postContent';
       textarea.innerText=v.postContent;
      const postNo = document.createElement('input');
        postNo.type='hidden';
        postNo.name = 'postNo';
        postNo.value = v.postNo;
      const userNo = document.createElement('input');
        userNo.type='hidden';
        userNo.name = 'postNo';
        userNo.value = uno;
      const formBtnBox = document.createElement('div');
        formBtnBox.className = 'post_form-btn-wrapper';
      const formBtn = document.createElement('button');
        formBtn.className = 'btn btn-blue';
        formBtn.type='submit';
        formBtn.innerText='수정';
      const postContent = document.createElement('span');
        postContent.className='just__text';
        postContent.innerText = v.postContent;
      const commentBox = document.createElement('div');
      	commentBox.className = 'content__comment';
      const commentSpan =  document.createElement('span');
      	commentSpan.className = 'icono-comment';
      const commentP = document.createElement('p');
      	commentP.innerText = 'COMMENT';
      	commentP.style.color = 'rgb(226, 229, 255)';
      const likeBox =  document.createElement('div');
        likeBox.className = 'section__content__right';
      const likeI = document.createElement('i');
        likeI.className = 'fas fa-heart';
      	if(v.isFollowing!=0){
      	likeI.style.color="rgb(216, 92, 92)"
        }
       const likeSpan = document.createElement('span');
       const nbsp = String.fromCharCode(160)+String.fromCharCode(160);
      	likeSpan.innerText = nbsp+v.isLiked

      contentTitle.appendChild(pno);
      contentTitle.appendChild(img);
      contentTitle.appendChild(pno); 
      introduce.appendChild(introduceStrong);
      introduce.appendChild(introduceP);
      contentTitle.appendChild(introduce);
      editandDelete.appendChild(editButton);
      editandDelete.appendChild(deleteButton);
      contentTitle.appendChild( editandDelete);
      
      form.appendChild(textarea);
      form.appendChild(postNo);
      form.appendChild(userNo);
      formBtnBox.appendChild(formBtn);
      form.appendChild(formBtnBox);
      justText.appendChild(postContent);
      justText.appendChild(form);
      commentBox.appendChild(commentSpan);
      commentBox.appendChild(commentP);
      likeBox.appendChild(likeI);
      likeBox.appendChild(likeSpan);
	  contentWrapper.appendChild(contentTitle);
	  contentWrapper.appendChild(sysdate);
	  contentWrapper.appendChild(justText);
	  contentWrapper.appendChild(commentBox);
	  contentWrapper.appendChild(likeBox);
	  inner.appendChild(contentWrapper);

}

//댓글
const createCommentItem = (v,i,c=0)=>{
      const ListContainer = document.querySelectorAll(".post__comment_box")[i]
      const commentBox = document.createElement('li')
      const userBox=document.createElement('div')
      userBox.className='post__user-info'
      const avatarBox=document.createElement('div')
      avatarBox.className='avatar-small'
      const userAvatar = document.createElement('img')
      if(v.userAvatar==null){
      		  userAvatar.src = "resources/assets/conn.png";
      }else{
              userAvatar.src = v.userAvatar;
            }
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

// 수정 
 let updateBtnFunction=()=>{
	 const itemBox = document.querySelectorAll('.content__wrapper').forEach((v)=>{
	 	 const updateBox = v.querySelector('.content__editandDelete');
	 	 let pno = v.querySelector('.pno').value;
	 	 const updateBtn = updateBox.querySelector('.btn-green');
	 	 

	 	 updateBtn.addEventListener('click',()=>{
	 	 	      const form = v.querySelector('.post_form');
	 	 	      console.log(form);
	 	 	      form.style.display="block";
	 	 	      const text = v.querySelector('.just__text');
	 	 	      text.style.display="none";
	       })
	       })
	 	 
	 }
//삭제
 let cancleBtnFunction =()=>{
	 const itemBox = document.querySelectorAll('.content__wrapper').forEach((v)=>{
	 const cancleBox = v.querySelector('.content__editandDelete');
	 let pno = v.querySelector('.pno').value;
	 const cancleBtn = cancleBox.querySelector('.btn-red');
	 

	 cancleBtn.addEventListener('click',()=>{
	 	      console.log(cancleBox);
              pno = parseInt(pno);
              console.log(v);
              console.log(pno);
              	  if(confirm("게시물을 삭제하시겠습니까?")==true){
              	  	 axios.get('postCancle.us', {
				        params: {
				          	postNo:pno					     
				        }
				      }) .then((result)=>{
				      console.log(result);
				      		if(result.data>0){
				      		alert("삭제되었습니다.");
				      		v.remove();
				          }else{
				          	alert("마감처리 실패!");
				          }
				
				        }).catch(function(error){
				      	  console.log(error);
				        })
			        
				      }else{
		              	  return;
				      }
				      
				      
				      })
              	 
      })
	 
	 }
		 
// 좋아요 누르기 
let likeView =()=>{
	 const likeBox = document.querySelectorAll('.section__content__right').forEach((v,i)=>{
	 let pno = document.querySelectorAll('.pno')[i].value;
	 const likeBtn = v.querySelector('.fa-heart');
	 

	 likeBtn.addEventListener('click',(event)=>{
	 let color = event.target.style.color;
	 console.log(color);    
	 	      //좋아요 추가
	 	      if(color=="rgb(216, 92, 92)"){
	 	      	const islike = parseInt(1);
	 	      	console.log("마이너스");
	 	      	 axios.get('like.pos', {
				        params: {
				          	postNo:pno,
				          	userNo: loginUno,
				          	islike:islike				     
				        }
				      }) .then((result)=>{
				      console.log(result);
				      likeBtn.style.color='#e2e5ff';
				      let tar=event.target.parentNode;
				      console.log(tar);
				   	  let span = parseInt(tar.querySelector('span').innerText);
				   	  console.log(span);
					  //tar.querySelector('span').innerText = --span;
				        }).catch(function(error){
				      	  console.log(error);
				        })
	 	      }else{
	 	      	//좋아요 취소
	 	      	const islike = parseInt(0);
	 	      	console.log(islike)
	 	      	console.log("플러스");
	 	      	 axios.get('like.pos', {
				        params: {
				          	postNo:pno,
				          	userNo: loginUno,
				          	islike:islike				     
				        }
				      }) .then((result)=>{
				      console.log(result);
				      likeBtn.style.color='rgb(216, 92, 92)';
				   	  let span = parseInt(v.querySelector('span').innerText);
					  console.log(span);
					  v.querySelector('span').innerText= span+1;
				        }).catch(function(error){
				      	  console.log(error);
				        })
	 	      }

     
              	 
      })
	 
	 })
}





// 댓글 보기
let commentView =()=>{
	 const commentBox = document.querySelectorAll('.content__comment').forEach((v,i)=>{

	 v.addEventListener('click',(event)=>{
	 let tar = event.target;
	 console.log(tar);
	if(tar.style.color=="rgb(226, 229, 255)"){
	let pno = document.querySelectorAll('.pno')[i].value;
    pno = parseInt(pno);
              	 
              	  	 axios.get('load.com', {
				        params: {
				          	pno:pno					     
				        }
				      }) .then((res)=>{
				      console.log(res.data);
				      tar.style.color='rgb(0, 0, 0)';
				       res.data.forEach(e=>{
		                createCommentItem(e,i);
		              })
				   	
				
				        }).catch(function(error){
				      	  console.log(error);
				        })
				      
				}else if(tar.style.color=="rgb(0, 0, 0)"){
				    console.log(tar);
				    let item = tar.parentNode.parentNode.parentNode;
					const ListContainer = item.querySelector(".post__comment_box")
					while(ListContainer.firstChild){
						ListContainer.removeChild(ListContainer.firstChild);
					}
					//tar.style.color='rgb(226, 229, 255)';
					console.log(tar.style.color);
				
				}
				
			})
              	 
      })
	 
	 }



let currentPageNum = 2;
 window.addEventListener('scroll',()=>{
   if(window.pageYOffset + document.documentElement.clientHeight >
           document.documentElement.scrollHeight - 1){
     console.log('로드!')
     userNoBox = document.querySelector(".main__info")
     userNo = userNoBox.querySelector(".userNo").value
     console.log(userNo)
     axios.get('profilePostLoad.us', {
       params: {
         currentPage: currentPageNum++,
         userNo:userNo
       }
     })
     .then((res)=>{
     console.log(res.data['plist']);
     res.data['plist'].forEach(v=>{
        createPostItem(v);
        
     })
   if(loginUno==uno){ 
    updateBtnFunction();  
 	cancleBtnFunction();
     }
     likeView();
     commentView();
     })
   }
 })

if(loginUno==uno){ 
 updateBtnFunction();  
 cancleBtnFunction();
}

commentView();
likeView();