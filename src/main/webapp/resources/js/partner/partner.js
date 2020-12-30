
//userPosi(select)선택
const posiList = document.querySelector('.userPosi');
let userPosi;
let userPosiText=""; // userPosi변수에 선택한 옵션의 text를 저장

 posiList.addEventListener('change',()=>{
  // 업무분야 value -> controller보내기
 let value=posiList.options[posiList.selectedIndex].value;
  //업무분야 태그의 text
 let text=posiList.options[posiList.selectedIndex].innerText;
 userPosiText=text;
 userPosi=parseInt(value);
 console.log(userPosiText);
 console.log(userPosi);
});

//skillNo(select)선택
      const skillList = document.querySelector('.skillNo');
      let skillNo=[];
      let skillText=[]; // userPosi변수에 선택한 옵션의 text를 저장

       skillList.addEventListener('change',()=>{
        //활동분야 value -> controller보내기
       let value=parseInt(skillList.options[skillList.selectedIndex].value);
        //활동분야 태그의 text
       let text=skillList.options[skillList.selectedIndex].innerText;


    		 skillNo.forEach=(function(v,text,value){
    			 if(v == value ){
    			 }else{
    			  skillText.push(text);
    			  skillNo.push(value);
    			 }
    		 });

       console.log(skillText);
       console.log(skillNo);
      	
      });


//

//태그생성함수
const saveTag = () => {
			localStorage.setItem(TAG_LS, JSON.stringify(TagList)); // 자바스크립트object를 string으로 변환
		}

const createTag = (tagName) => {
    	
    	const searchSpan = document.createElement("span");
    	const delIcon = document.createElement("span");
    	
    	searchSpan.className = "search-span";
    	delIcon.innerText = "clear";
    	delIcon.className = "material-icons md-18 md-light";
    	searchSpan.innerText = tagName;
		
    	const newId = TagList.length + 1;
    	
    	
    	delIcon.addEventListener("click", deleteTag);
    	tagList.appendChild(searchSpan);
    	searchSpan.appendChild(delIcon);
 		searchSpan.id = newId;
    	
    	const TagObj = {
    		keyword : tagName,	
    		id : newId
    	};
    	
    	TagList.push(TagObj);
    	saveTag();
    	
    	console.log(TagList);
    	
	}
	
    const filter = (tagfilter) => {
		return tagfilter.id === 1;
	}
    
    // 태그 삭제용 함수
    const deleteTag = (event) => {
    	const span = event.target;
    	const searchSpan = span.parentNode;
    	tagList.removeChild(searchSpan);
		
    	/*삭제시 list에서 제거*/
		const cleanTag = TagList.filter(function(tagfilter) {
			return tagfilter.id !== parseInt(searchSpan.id);
		});
		TagList = cleanTag;
		saveTag();
		
    }