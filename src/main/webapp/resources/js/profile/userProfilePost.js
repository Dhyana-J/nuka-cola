//삭제

 
 let cancleBtn =()=>{
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
				      }})
              	 
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
        /*
          addLike();
          addFollow();
          commentOpenWatcher();
          commentInsertWatcher();
          loadComment();
          */
          console.log(res.data)
          //timeline__section-left 에 추가
          //res.data.forEach(v=>{
          //  createPostItem(v);
          //})
          /*
          addLike()
          addFollow();
          removeCommentOpenWatcher()
          commentOpenWatcher();
          commentInsertWatcher();
          loadComment();
          */
        })
      }
    })
    
 cancleBtn();