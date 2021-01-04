 
  const recruitItem1 =(v,i)=>{
  	const itemList = document.querySelector('.employ__box__ing');
  	const recruitItemBox = document.createElement('div');
  		recruitItemBox.className='content__wrapper';
    const contentLeft = document.createElement('div');
  		contentLeft.className='content__left';
  	const recruitNo = document.createElement('input');
		recruitNo.type='hidden';
		recruitNo.name='recruitNo';
  		recruitNo.className='recruit-no';
  		recruitNo.value=v.recruitNo;

  	/*채용 공고 정보(회사,소개, 관련업무분야,마감일)*/
  	const ItemText = document.createElement('ul');
  		ItemText.className='employ__box__info';
  	const title= document.createElement('li');
      	title.innerText=v.compName;
  	const content = document.createElement('li');
  	const contentTextStrong = document.createElement('strong');
  		contentTextStrong.innerText=v.recruitTitle;
  	let recruit = document.createElement('li');
  		const recruitRequ = v.recruitRequ;           	
  		if(v.recruitRequ =='0'){
  			recruit.innerText='신입';
  		}else if(v.recruitRequ =='1'){
  			recruit.innerText='경력';
  		}else if(v.recruitRequ =='2'){
  			recruit.innerText='신입 경력';
  		}
  	const skillBox = document.createElement("div");
  		  skillBox.className = "tag__box";
  		if(i !=null){
  		  i.forEach((v) => {
  		    const skill = document.createElement("span");
  		    skill.className ="tag";
  		    skill.innerText = "" + v;
  		    skillBox.appendChild(skill);
  		  });
  		}
  	const date = document.createElement('div');
  		date.className='date';
  	const dateSpan = document.createElement('span');
  		dateSpan.innerText = v.createdAt;
    const contentRight = document.createElement('div');
  		contentRight.className='content__right';	
  	const deadLine = document.createElement('div');
  		deadLine.className='deadlineBtn';
  		deadLine.innerText='공고마감';
  	content.appendChild(contentTextStrong);
  	console.log(content);
  	ItemText.appendChild(title);
  	ItemText.appendChild(content);
  	ItemText.appendChild(recruit);
  	date.appendChild(dateSpan);	

  	
  	contentLeft.appendChild(recruitNo);
  	contentLeft.appendChild(ItemText);
  	contentLeft.appendChild(skillBox);
  	contentLeft.appendChild(date);
  	contentRight.appendChild(deadLine);
  	recruitItemBox.appendChild(contentLeft);
  	recruitItemBox.appendChild(contentRight);
	itemList.appendChild(recruitItemBox);
  }
  
    const recruitItem2 =(v,i)=>{
      	const itemList = document.querySelector('.employ__box__end');
      	const recruitItemBox = document.createElement('div');
      		recruitItemBox.className='content__wrapper';
        const contentLeft = document.createElement('div');
  			contentLeft.className='content__left';
      	const recruitNo = document.createElement('input');
    		recruitNo.type='hidden';
    		recruitNo.name='recruitNo';
      		recruitNo.className='recruit-no';
      		recruitNo.value=v.recruitNo;

      	/*채용 공고 정보(회사,소개, 관련업무분야,마감일)*/
      	const ItemText = document.createElement('ul');
      		ItemText.className='employ__box__info';
      	const title= document.createElement('li');
          	title.innerText=v.compName;
      	const content = document.createElement('li');
      	const contentTextStrong = document.createElement('strong');
      		contentTextStrong.innerText=v.recruitTitle;
      	let recruit = document.createElement('li');
      		const recruitRequ = v.recruitRequ;           	
      		if(v.recruitRequ =='0'){
      			recruit.innerText='신입';
      		}else if(v.recruitRequ =='1'){
      			recruit.innerText='경력';
      		}else if(v.recruitRequ =='2'){
      			recruit.innerText='신입 경력';
      		}
      	const skillBox = document.createElement("div");
      		  skillBox.className = "tag__box";
      		  if(i !=null){
	      		  i.forEach((v) => {
	      		    const skill = document.createElement("span");
	      		    skill.className ="tag";
	      		    skill.innerText = "" + v;
	      		    skillBox.appendChild(skill);
	      		  });
      		  }

      	const date = document.createElement('div');
      		date.className='date';
      	const dateSpan = document.createElement('span');
      		dateSpan.innerText = v.createdAt;
      	const contentRight = document.createElement('div');
  			contentRight.className='content__right';
  			
  					
      	content.appendChild(contentTextStrong);
      	console.log(content);
      	ItemText.appendChild(title);
      	ItemText.appendChild(content);
      	ItemText.appendChild(recruit);
      	date.appendChild(dateSpan);	
      	contentLeft.appendChild(recruitNo);
      	contentLeft.appendChild(ItemText);
      	contentLeft.appendChild(skillBox);
      	contentLeftappendChild(date);
      	recruitItemBox.appendChild(contentLeft);
      	recruitItemBox.appendChild(contentRight);
    	itemList.appendChild(recruitItemBox);
      }
  


	let href =()=>{
	  		 const ingBox1 = document.querySelector('.employ__box__ing');
				 ingBox1.querySelectorAll('.content__left').forEach((v,i)=>{
		              v.addEventListener('click',()=>{
			              let rno = v.querySelector('.recruit-no').value;
			              console.log(rno);
			              location.href="detail.re?rno="+rno;
			         	 
		         	    });
		    	      });
			const ingBox2 = document.querySelector('.employ__box__end');
				 ingBox2.querySelectorAll('.content__left').forEach((v,i)=>{
		              v.addEventListener('click',()=>{
			              let rno = v.querySelector('.recruit-no').value;
			              console.log(rno);
			             location.href="detail.re?rno="+rno;
			         	 
		         	    });
		    	      });		
	  }
	  


  
 href();
  
  <!-- 진행중인 채용공고 load--> 
   const IngMoreBtn1= document.querySelector('.more1');
	  console.log(IngMoreBtn1);
	  let pi1 = document.querySelector('.pi1').value;
	  pi1 = parseInt(pi1);
	  console.log(pi1);
   let currentPageNum1 = 1;
	  const cno = document.querySelector('.nowCno').value;
  const recruitINGLoad =()=>{
	  
	  IngMoreBtn1.addEventListener('click',()=>{ 
	
	 
	  axios.get('recruitINGLoad.co', {
	        params: {
	          currentPage: ++currentPageNum1,
	          compNo:cno
	        }
	      }) .then((result)=>{
	
	          result.data["rlist1"].forEach((v) => {
	        	console.log(currentPageNum1);
	        	disabledBtn1();
	          recruitItem1(v, result.data["skillMap"][v.recruitNo]);
	          });
	
	        }).catch(function(error){
	      	  console.log(error);
	        })
	        .then(function(){
	        	  href();
	        })
	      })
    }
    
   
   let disabledBtn1 =()=>{
		if(currentPageNum1 >= pi1){
			IngMoreBtn1.disabled=true;
			IngMoreBtn1.style.background="#e5e5e5";
			IngMoreBtn1.style.color="#30409f";
		}
	}     
	
   <!-- 진행완료인 채용공고 load-->      
  const IngMoreBtn2= document.querySelector('.more2');
	  console.log(IngMoreBtn2);
	  let pi2 = document.querySelector('.pi2').value;
	  pi2 = parseInt(pi2);
	  console.log("pi2:"+pi2);
	  let currentPageNum2 = 1;
      
 
   const recruitENDLoad =()=>{ 
	  
	  console.log("currentPageNum2:"+ currentPageNum2);
	  console.log(IngMoreBtn2);
	  IngMoreBtn2.addEventListener('click',()=>{ 
	  
	  
	  axios.get('recruitENDLoad.co', {
	        params: {
	          
	          currentPage: ++currentPageNum2,
	          compNo:cno
	        }
	      }) .then((result)=>{
	    	  
	    	  
	          result.data["rlist2"].forEach((v) => {
	        	console.log(currentPageNum2);
	        	disabledBtn2();
	          recruitItem2(v, result.data["skillMap"][v.recruitNo]);
	          });
	
	        }).catch(function(error){
	      	  console.log(error);
	        })
	        .then(function(){
	        	  href();
	        })
	      })

	}
  
  
	

	const disabledBtn2 =()=> {
	  if(currentPageNum2 >=pi2){
		IngMoreBtn2.disabled=true;
		IngMoreBtn2.style.background="#e5e5e5";
		IngMoreBtn2.style.color="#30409f";
	  }
	}
	
	  // 마감처리 버튼 클릭시	
	  let deadlineBtn =()=>{
		 const btnBox = document.querySelector('.employ__box__ing');
			 btnBox.querySelectorAll('.deadlineBtn').forEach((v,i)=>{
	              v.addEventListener('click',()=>{
	              let rno = document.querySelectorAll('.recruit-no')[i].value;
	              rno = parseInt(rno);
	              console.log(rno);
	              	  if(confirm("현재 공고를 마감하시겠습니까?")==true){
	              	  	 axios.get('deadlineProcess.co', {
					        params: {
					          rno:rno
					        }
					      }) .then((result)=>{
					      		if(result.data==1){
					      		location.href="recruit.co?cno="+cno;
					      		alert("마감처리되었습니다.");
								
								
								
								
								
								
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
		
	
  
  disabledBtn2();
  deadlineBtn();
  disabledBtn1();
  recruitINGLoad();
  recruitENDLoad();

  

  
  