const recruitItem1 =(v,i)=>{
            	console.log(i);
            	const itemList = document.querySelector('.jemploy__box__ing');
            	const recruitItemBox = document.createElement('div');
            		recruitItemBox.className='content__wrapper';
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
            		  i.forEach((v) => {
            		    const skill = document.createElement("span");
            		    skill.className ="tag";
            		    skill.innerText = "" + v;
            		    skillBox.appendChild(skill);
            		  });

            	const date = document.createElement('div');
            		date.className='date';
            	const dateSpan = document.createElement('span');
            		dateSpan.innerText = v.createdAt;
            		
            	content.appendChile(contentTextStrong);
            	ItemText.appendChile(title);
            	ItemText.appendChile(content);
            	ItemText.appendChile(recruit);
            	skillBox.appendChile(skill);
            	date.appendChild(dateSpan);	
            	recruitItemBox.appendChile(recruitNo);
            	recruitItemBox.appendChile(ItemText);
            	recruitItemBox.appendChile(skillBox);
            	recruitItemBox.appendChile(date);
			    itemList.appendChile(recruitItemBox);
            }
            
          	
            
          
            
            
            const IngMoreBtn= document.querySelector('.more1');
            console.log(IngMoreBtn);
            const cno = document.querySelector('.nowCno').value;
            IngMoreBtn.addEventListener('click',()=>{ 
            let currentPageNum = 2;
            axios.get('recruitLoad.co', {
                  params: {
                    currentPage: currentPageNum++,
                    compNo:cno
                  }
                }) .then((result)=>{

                    result.data["rlist1"].forEach((v) => {
                    recruitItem1(v, result.data["skillMap"][v.recruitNo]);
                    
                    });

                  }).catch(function(error){
                	  console.log(error);
                  })
                  .then(function(){
                  	  href();
                  })
                })
            
			
            let href =()=>{
            		 const ingBox = document.querySelector('.employ__box__ing');
					 ingBox.querySelectorAll('.content__wrapper').forEach((v,i)=>{
			              v.addEventListener('click',()=>{
				              let rno = document.querySelectorAll('.recruit-no')[i];
				              console.log(rno);
				             location.href="detail.re?rno="+rno.value;
				         	 
			         	    });
			    	      });
            }
            
            
            href();
