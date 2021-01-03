let posiList=[];//업무분야태그 리스트
let skillList=[];// 활동분야태그 리스트
let schoolList=[];//학교명태그 리스트


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
 createETCTag(userPosiText,userPosi,posiList);
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
       createSkillTag(skillText,skillNo,skillList);
      	
      });



//학교명 작성
//keyword작성
const schoolBox = document.querySelector('.user_edu');
const userNameBox = document.querySelector('.userName');
const formBox = document.querySelector('.search__form');
formBox.addEventListener('submit',(event)=>{
event.preventDefault();
let schoolName = schoolBox.value;
const newId = schoolList.length+1;
const userName = userNameBox.value; // 키워드(이름)
if(schoolName.length>0){
createETCTag(schoolName,newId,schoolList);
}
schoolBox.value = "";
console.log(typeof(posiList));
console.log(typeof(skillList));
console.log(schoolList);
console.log(typeof (userName));

let pList="";
let skList="";
let scList="";
posiList.forEach(c=>{
 pList+=(c.id);
 
})
/*
for(int i=0;i<skillList.lenght;i++){
if(i=skillList.lenght)
}
*/
skillList.forEach(function(c,i,a){
if(a.length-1!=i){
skList+=(c.id)+","
}else{
  skList+=(c.id)
}
})

schoolList.forEach(c=>{
 scList+=(c.keyword);
 
})
console.log(skList);
console.log(pList);
console.log(typeof(pList));

/* 검색내용 넘기기*/
axios.get('search.pa', {
			params:{
               posiList:pList,
               skillList:skList,
               schoolList:scList,
               keyword:userName
             }
            })
                  .then(function (res) {
                  	console.log(res);
                  })
                  .catch(function (error) {
                     console.log(error);
                  })
                  .then(function () {
                     // ...
                  });


})
/*
		schoolBox.addEventListener("keyup", () => {
		 let schoolName = schoolBox.value;
         console.log(schoolName);
         console.log(schoolName.length);
         if(schoolName.length>0)   {
            axios.get('search.sc', {
               params: {
                  schoolName: schoolName
               }
            })
                  .then(function (response) {
                  	console.log("성공");
                     let searchResult = "";
                     response.data.forEach(v=>{
                        searchResult += "<span id='" + v.user_edu + "'>" + v.user_edu + "</span> <br>"
 						document.getElementById("user-filed-search-list").innerHTML = searchResult
                     })
                     document.getElementById("user-filed-search-list").innerHTML = searchResult
                  })
                  .catch(function (error) {
                     console.log(error);
                  })
                  .then(function () {
                     // ...
                  });
         }
      });

*/

/*--------------------------------------------------------------------------------------------------*/


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
			localStorage.setItem(TAG_LS, JSON.stringify(schoolList));
		}
		
//업무분야태그함수, 학교명
const createETCTag = (text, no, list) => {

				if(list.length===0){
					tag(text,no,list);
			    	saveTag();
				}else{
					let val = list[0].keyword;
					console.log(val);
					//리스트에 있는내용 삭제
				let span;
			document.querySelectorAll('.tag').forEach(v=>{
				  console.log(v.querySelector('span').innerText, val);
				  if(v.querySelector('span').innerText===val){
				    span = v
				    console.log(span);
				  }else{
				    return null;
				  }
				})
	    		console.log("리스트안에 있는 내용"+span);
	    		tagList.removeChild(span);
	    		
	    	     const cleanPosiTag = list.filter(function(tagfilter) {
	    	     console.log(typeof(tagfilter.id));
	    	     console.log(typeof(parseInt(span.id)));
			         return tagfilter.id !== parseInt(span.id);
		    	
				});
			console.log("after"+list);     
			list.pop();
			saveTag();
			tag(text,no,list);
	    	}
	    	console.log(posiList);
	    	
		}
		
		
//업무분야태그함수		
const createSkillTag = (text, no, list) => {
			
			tag(text,no,list);
	    	saveTag();
	    	console.log(list); 	
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
		const cleanSchoolTag = schoolList.filter(function(tagfilter) {
			return tagfilter.id !== parseInt(tagBox.id);
		});
		posiList = cleanPosiTag;
		skillList = cleanSkillTag;
		schoolList = cleanSchoolTag;
		console.log(posiList);
		console.log(skillList);
		console.log(schoolList);
		saveTag();
		
    }