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
let userName="";
const formBox = document.querySelector('.search__form');

//검색 결과 총 명수 나타내는 영역
let connCount = document.querySelector(".resultCount1");
let ETCCount = document.querySelector(".resultCount2");

const ETCBox = document.querySelectorAll('.connecting_people')[1];
const ConnBox = document.querySelectorAll('.connecting_people')[0];


formBox.addEventListener('submit',(event)=>{
event.preventDefault();
let schoolName = schoolBox.value;
const newId = schoolList.length+1;
userName= userNameBox.value; // 키워드(이름)
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
/*
document.querySelectorAll('.connecting_people').forEach((v)=>{
	v.querySelectorAll('.search_result').forEach((f)=>{
	f.remove();
})
})
*/

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
                  	
                  	const loginUserNo = document.querySelector('.loginUser').value;
                  	let ConPeopleCount = res.data["ConPeopleCount"]
                  	let ETCPeopleCount = res.data["ETCPeopleCount"]
                  	console.log(pList);
                  	
                  	/*연결된 사람들 중 검색결과 출력*/
                  	if(res.data["ConPeople"].length>0){
                  		const non1= document.querySelectorAll('.result_none')[0];
	                  	non1.style.display='none';
	                  	res.data["ConPeople"].forEach((v)=>{
	                  	createConnResult(v);
	                  	
	                  	})
	                  	createdMore(ConPeopleCount,0);
	                  	if(ConPeopleCount>4){
	                  		ConnLoad(pList,skList,scList,userName);
	                  	}
	                  	
	                  	// 취소버튼 누를때
	                  	ConnBox.querySelectorAll('.search_resultBox').forEach((v)=>{
		                  	let fgNo=v.querySelector('.user-no').value;
		                  	let et = v.querySelector('.btn');
		                  	et.addEventListener('click',(e)=>{
		                  	let target = e.target;
		                  	cancelFollowing(loginUserNo,fgNo,target);
		                  	
	                  		})
	                  	})
	                  	Connhref();
                  	}
                  	/*그 외 사람들 중 검색결과 출력*/
                  	if(res.data["ETCPeople"].length>0){
	                  	const non2= document.querySelectorAll('.result_none')[1];
		                non2.style.display='none';
		                res.data["ETCPeople"].forEach((v)=>{
	                  	createETCResult(v);

	                  	})
	                  	createdMore(ETCPeopleCount,1);
	                  	if(ETCPeopleCount>4){
	                  		ETCLoad(pList,skList,scList,userName);
	                  	}
	                  	
	                  	// 팔로우 버튼 누를때
	                  	ETCBox.querySelectorAll('.search_resultBox').forEach((v)=>{
		                  	let fgNo=v.querySelector('.user-no').value;
		                  	let et = v.querySelector('.btn');
		                  	et.addEventListener('click',(e)=>{
		                  	let target = e.target;
		                  	console.log(target)
		                  	addFollowing(loginUserNo,fgNo,target);
		                  	
	                  		})
	                  	})
	                  	ETChref();
                  	}
                  	
                  	
                  	
                  	// 검색 결과 개수
                  	connCount.innerText="검색결과 ("+ ConPeopleCount +")";
                  	ETCCount.innerText ="검색결과 ("+ ETCPeopleCount +")";
                  	
                  	
                  	 
                  	
                  	
                  	
                  	
                  	
                  	
                  	
                  })
                  .catch(function (error) {
                     console.log(error);
                  })
                  .then(function () {
                     // ...
                  });


})


/*--------------------------------------------------------------------------------------------------*/
/*검색태그*/

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
    
    
    
/*-------------------------------------------------------------------------------*/
//검색 결과
    
// 연결된 사람정보생성
    const createConnResult=(v)=>{
	const connPeopleBox = document.querySelectorAll('.connecting_people')[0];
	const searchResult = connPeopleBox.querySelector('.search_result');
	searchResult.style.display='block';
    const searchResultBox = document.createElement('div');
    	searchResultBox.className='search_resultBox';
    const resultLeft = document.createElement('div');
    	resultLeft.className = 'result__left';
    const userNo = document.createElement('input');
		userNo.type='hidden';
		userNo.name='userNo';
  		userNo.className='user-no';
  		userNo.value=v.userNo;
    const avatar = document.createElement('div');
    	avatar.className = 'avatar';
    const img = document.createElement('img');
    	if(v.userAvatar==null){
	       img.src="resources/assets/conn.png";
	    }else{
	       img.src = v.userAvatar;
	    }

    const avatarInfo = document.createElement('ul');
    	avatarInfo.className='avatar__info';
    const name = document.createElement('li');
    const nameStrong = document.createElement('strong');
    	nameStrong.innerText=v.userName;
    const edu = document.createElement('li');
    	if(v.userComp===null){
    	edu.innerText=v.userEdu;
    	}
    	if(v.userEdu===null){
    	edu.innerText=v.userComp;
    	}
    const posi = document.createElement('li');
    	if(v.userPosi ==="0"){
    	posi.innerText='기획자';
    	}else if(v.userPosi ==="1"){
    	posi.innerText='개발자';
    	}else if(v.userPosi ==="2"){
    	posi.innerText='디자이너';
    	}
    const resultRight = document.createElement('div');
    	resultRight.className = 'result__right';
    const btn =  document.createElement('button');
        btn.className = 'btn';
        btn.innerText = '취소';
    
    
    avatar.appendChild(img);
    name.appendChild(nameStrong);
    avatarInfo.appendChild(name);
    avatarInfo.appendChild(edu);
    avatarInfo.appendChild(posi); 
    resultLeft.appendChild(avatar);
    resultLeft.appendChild(avatarInfo); 
    resultLeft.appendChild(userNo);    
    resultRight.appendChild(btn); 
    searchResultBox.appendChild(resultLeft);
    searchResultBox.appendChild(resultRight);
    searchResult.appendChild(searchResultBox);
       
    
    }	
    
    
// 그외 사람정보생성
    const createETCResult=(v)=>{
	const connPeopleBox = document.querySelectorAll('.connecting_people')[1];
	const searchResult = connPeopleBox.querySelector('.search_result2');
	searchResult.style.display='block';
    const searchResultBox = document.createElement('div');
    	searchResultBox.className='search_resultBox';
    const resultLeft = document.createElement('div');
    	resultLeft.className = 'result__left';
    const userNo = document.createElement('input');
		userNo.type='hidden';
		userNo.name='userNo';
  		userNo.className='user-no';
  		userNo.value=v.userNo;
    const avatar = document.createElement('div');
    	avatar.className = 'avatar';
    const img = document.createElement('img');
    	if(v.userAvatar==null){
	       img.src="resources/assets/conn.png";
	    }else{
	       img.src = v.userAvatar;
	    }
    const avatarInfo = document.createElement('ul');
    	avatarInfo.className='avatar__info';
    const name = document.createElement('li');
    const nameStrong = document.createElement('strong');
    	nameStrong.innerText=v.userName;
    const edu = document.createElement('li');
    	if(v.userComp==null){
    	edu.innerText=v.userEdu;
    	}else if(v.userEdu==null){
    	edu.innerText=v.userComp;
    	}
    const posi = document.createElement('li');
    	if(v.userPosi ==="0"){
    	posi.innerText='기획자';
    	}else if(v.userPosi ==="1"){
    	posi.innerText='개발자';
    	}else if(v.userPosi ==="2"){
    	posi.innerText='디자이너';
    	}
    const resultRight = document.createElement('div');
    	resultRight.className = 'result__right';
    const btn =  document.createElement('button');
        btn.className = 'btn';
        btn.innerText = '팔로우';
    
    
    
    name.appendChild(nameStrong);
    avatarInfo.appendChild(name);
    avatarInfo.appendChild(edu);
    avatarInfo.appendChild(posi); 
    avatar.appendChild(img);
    resultLeft.appendChild(avatar);
    resultLeft.appendChild(avatarInfo); 
    resultLeft.appendChild(userNo);    
    resultRight.appendChild(btn); 
    searchResultBox.appendChild(resultLeft);
    searchResultBox.appendChild(resultRight);
    searchResult.appendChild(searchResultBox);

       
    
    }
    	
 const Connmore=()=>{   
 const Box = document.querySelectorAll('.connecting_people')[0];
 const moreBox = document.createElement('div');
 	moreBox.className='more'
 const more =document.createElement('button');
 	more.className='btn';
 	more.innerText='more';
 	
 moreBox.appendChild(more);
 Box.appendChild(moreBox);    
} 

 const more=(i)=>{//i로 ETC, Conn 구분   
 const Box = document.querySelectorAll('.connecting_people')[i];
 const moreBox = document.createElement('div');
 	moreBox.className='more'
 const more =document.createElement('button');
 	more.className='btn';
 	more.innerText='more';
 	
 moreBox.appendChild(more);
 Box.appendChild(moreBox);    
}    
    
 //more 버튼
 const createdMore=(v,i)=>{
	 if(v<0){
	 }else if(v>4){
		more(i);
						
	 }
 }
// more 버튼 클릭시 페이징처리


let currentPageNum1=1;
let currentPageNum2=1;
const ConnLoad =(pList,skList,scList,userName)=>{	  
			const ConnMore = ConnBox.querySelector('.more').firstChild;   
			        
	        ETCMore.addEventListener('click',()=>{
	        axios.get('ConnPeopleLoad.pa', {
	        params: {
	          currentPage: ++currentPageNum1,
	          posiList:pList,
              skillList:skList,
              schoolList:scList,
              keyword:userName
	        }
	      }) .then((res)=>{
	          res.data["ConPeople"].forEach((v)=>{
	          console.log(currentPageNum1);
	        	//disabledBtn1();
	          createConnResult(v);
	          });
	
	        }).catch(function(error){
	      	  console.log(error);
	        })
	        .then(function(){
	        	  Connhref();
	        })  
	                 
	                 
	                 
	                 }) 
}	

const ETCLoad =(pList,skList,scList,userName)=>{	  
			const ETCMore = ETCBox.querySelector('.more').firstChild;   
			        console.log(ETCMore);
			        
	        ETCMore.addEventListener('click',()=>{
	        axios.get('ETCPeopleLoad.pa', {
	        params: {
	          currentPage: ++currentPageNum2,
	          posiList:pList,
              skillList:skList,
              schoolList:scList,
              keyword:userName
	        }
	      }) .then((res)=>{
	          res.data["ETCPeople"].forEach((v)=>{
	          console.log(currentPageNum2);
	        	//disabledBtn1();
	          createETCResult(v);
	          });
	
	        }).catch(function(error){
	      	  console.log(error);
	        })
	        .then(function(){
	        	  ETChref();
	        })  
	                 
	                 
	                 
	                 }) 
}	

// ETC 프로필 클릭시 
let ETChref =()=>{
			ETCBox.querySelectorAll('.result__left').forEach((v)=>{
			 v.addEventListener('click',()=>{
				 let uno = v.querySelector('.user-no').value;
				 console.log(uno);
				 location.href="profile.me?userNo="+uno;
				         	 
			 });
			 });
            }  
// Conn 프로필 클릭시 
let Connhref =()=>{
			ConnBox.querySelectorAll('.result__left').forEach((v)=>{
			 v.addEventListener('click',()=>{
				 let uno = v.querySelector('.user-no').value;
				 console.log(uno);
				 location.href="profile.me?userNo="+uno;
				         	 
			 });
			 });
            }                         