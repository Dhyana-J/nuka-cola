
//userPosi(select)선택
const posiListBox = document.querySelector('.userPosi');
let userPosi;
let userPosiText=""; // userPosi변수에 선택한 옵션의 text를 저장

 posiListBox.addEventListener('change',()=>{
  // 업무분야 value -> controller보내기
 let value=posiListBox.options[posiListBox.selectedIndex].value;
  //업무분야 태그의 text
 let text=posiListBox.options[posiListBox.selectedIndex].innerText;
 userPosiText=text;
 userPosi=parseInt(value);
 
 
 console.log(userPosiText);
 console.log(userPosi);
 createPosiTag(userPosiText,userPosi);
});



//skillNo(select)선택

      const skillListBox = document.querySelector('.skillNo');
      let skillNo;
      let skillText; // userPosi변수에 선택한 옵션의 text를 저장

       skillListBox.addEventListener('change',()=>{
        //활동분야 value -> controller보내기
       let value=parseInt(skillListBox.options[skillListBox.selectedIndex].value);
        //활동분야 태그의 text
       let text=skillListBox.options[skillListBox.selectedIndex].innerText;
		skillText=text;
    	skillNo=parseInt(value);

       console.log(skillText);
       console.log(skillNo);
       createskillTag(skillText,skillNo);
      	
      });




/*--------------------------------------------------------------------------------------------------*/
let posiList=[];//업무분야태그 리스트
let skillList=[];// 활동분야태그 리스트

const TAG_LS = "tag";
const tagList = document.querySelector('.result_tag');



//태그 생성
 const tag=(text,no,list)=>{
 			const tagBox = document.createElement("div");
	    		tagBox.className= "tag";
	    	const tagText = document.createElement("span");
	    		tagText.innerText=text;
	    	const delIcon = document.createElement("i");
	    	 	delIcon.className="material-icons md-18 md-light";
	    	 	delIcon.innerText = "close";
	    	
	    	
	    	delIcon.addEventListener("click", deleteTag);
	    	tagBox.appendChild(tagText);
	    	tagBox.appendChild(delIcon);
	    	tagBox.appendChild(delIcon);
	 		tagBox.id =no;
	 		tagList.appendChild(tagBox);
	    	
	    	const TagObj = {
	    		keyword : text,	
	    		id : no
	    	};
	    	list.push(TagObj);
 }
 
 //태그 저장함수
 const saveTag = () => {
			localStorage.setItem(TAG_LS, JSON.stringify(posiList)); // 자바스크립트object를 string으로 변환
			localStorage.setItem(TAG_LS, JSON.stringify(skillList));
		}
//업무분야태그함수
const createPosiTag = (text, no) => {
			if(posiList.length===0){
				tag(text,no,posiList);
		    	saveTag();
			}else{
				let val = posiList[0].keyword;
				console.log(val);
				//리스트에 있는내용 삭제
	    		const span = tagList.querySelector('span[val]');
	    		console.log("리스트안에 있는 내용"+span);
	    		const tagBox = span.parentNode;
	    		tagList.removeChild(tagBox);
	    			
	    	     const cleanPosiTag = posiList.filter(function(tagfilter) {
			         return tagfilter.id !== parseInt(tagBox.id);
			    posiList = cleanPosiTag;
			         
			    tag(text,no,posiList);
		    	saveTag();
		});
	    	}
	    	console.log(posiList);
	    	
		}
		
		
//업무분야태그함수		
const createskillTag = (text, no) => {
			
			tag(text,no,skillList);
	    	saveTag();
	    	
	    	console.log(skillList);
	    	
		}
    
	
    
    // 태그 삭제용 함수
    const deleteTag = (event) => {
    	const span = event.target;
    	console.log(span);
    	const tagBox = span.parentNode;
    	console.log(tagBox);
    	tagList.removeChild(tagBox);
		
    	/*삭제시 list에서 제거*/
		const cleanPosiTag = posiList.filter(function(tagfilter) {
			return tagfilter.id !== parseInt(tagBox.id);
		});
		const cleanSkillTag = skillList.filter(function(tagfilter) {
			return tagfilter.id !== parseInt(tagBox.id);
		});
		posiList = cleanPosiTag;
		skillList = cleanSkillTag;
		console.log(posiList);
		console.log(skillList);
		saveTag();
		
    }