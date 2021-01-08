//post
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
	 const itemBox = document.querySelectorAll('.content__wrapper').forEach((v)=>{
	 const likeBox = v.querySelector('.section__content__right');
	 let pno = v.querySelector('.pno').value;
	 const likeBtn = likeBox.querySelector('.fa-heart');
	 

	 likeBtn.addEventListener('click',()=>{
	 let color = likeBtn.style.color;
	 	      
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
				   	  let span = parseInt(likeBox.querySelector('span').innerText);
				   	  console.log(span);
					  likeBox.querySelector('span').innerText = span-1;
				        }).catch(function(error){
				      	  console.log(error);
				        })
	 	      }else{
	 	      	//좋아요 취소
	 	      	const islike = parseInt(0);
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
				   	  const span = parseInt(likeBox.querySelector('span').innerText);
					  console.log(span);
					  likeBox.querySelector('span').innerText=span+1;
				        }).catch(function(error){
				      	  console.log(error);
				        })
	 	      }
              pno = parseInt(pno);
              console.log(v);
              console.log(pno);
              /*
              	  if(confirm("게시물을 삭제하시겠습니까?")==true){
              	  	 axios.get('load.com', {
				        params: {
				          	pno:pno					     
				        }
				      }) .then((result)=>{
				      console.log(result);
				   
				
				        }).catch(function(error){
				      	  console.log(error);
				        })
			        
				      }else{
		              	  return;
				      }
				      
				      
				      })
			*/	      
              	 
      })
	 
	 })
}





// 댓글 보기
let commentView =()=>{
	 const itemBox = document.querySelectorAll('.content__wrapper').forEach((v)=>{
	 const commentBox = v.querySelector('.content__comment');
	 let pno = v.querySelector('.pno').value;
	 const commentBtn = commentBox.querySelector('p');
	 

	 commentBtn.addEventListener('click',()=>{
	 	      console.log(commentBox);
              pno = parseInt(pno);
              console.log(v);
              console.log(pno);
              	 
              	  	 axios.get('load.com', {
				        params: {
				          	pno:pno					     
				        }
				      }) .then((result)=>{
				      console.log(result);
				   
				
				        }).catch(function(error){
				      	  console.log(error);
				        })
				      
				      
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