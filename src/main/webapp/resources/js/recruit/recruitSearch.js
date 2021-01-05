'use strict';

let mySlider = new rSlider({
    target: '#sampleSlider',
    values: [3000, 4000, 5000, 6000, 7000, 8000, 9000,10000,11000,12000,13000,14000,15000,16000,17000,18000,19000,20000],
    range: true,
    step:10,
    tooltip: true,
    scale: true,
    labels: false,
    set: [3000, 20000],
    width:190
});



//연봉버튼 및 모달 플래그
//연봉버튼 토글로 모달이 열리면 1 닫히면 0
let btnFlag = 0;

//연봉 버튼 클릭하면 연봉 선택바 보여주거나 숨김
document.querySelector('.salary').addEventListener("click", ()=>{
    if(btnFlag){
        document.querySelector('.salary-bar').style.height="0";
        document.querySelector('.salary-bar').style.border="none";
        btnFlag=0; //모달 닫았어
    }else{
        document.querySelector('.salary-bar').style.height="170px";
        document.querySelector('.salary-bar').style.border="1px solid #c7c7c7";
        btnFlag=1; //모달 열었어
    }
})




//연봉 적용버튼 클릭하면 태그 추가해주기
document.querySelector('.salary-bar button').addEventListener('click',()=>{
    document.querySelector('.salary-bar').style.height="0";
    document.querySelector('.salary-bar').style.border="none";
    btnFlag=0; //모달 닫았어
})


//요소 바깥 클릭 감지 메소드
document.addEventListener('click', (e)=>{

    if(btnFlag){//연봉버튼 눌러서 모달이 띄워진 경우

        //연봉모달 제어용 변수
        let salaryModal = document.querySelector('.salary-bar');

        //연봉버튼클릭 제어용 변수
        let salaryBtn = document.querySelector('.salary');

        let clicked = e.target;//클릭된 요소 담을 변수

    
        //클릭된 요소부터 시작해 부모요소들로 거슬러 올라가며 클래스명 탐색
        while(clicked){

            if(clicked.className==salaryModal.className
                ||clicked.className==salaryBtn.className){
                //클릭된 요소가 salaryModal에 포함되는 경우
                //혹은 연봉버튼에 포함되는 경우
                return; //아무것도 안하고 빠져나간다.
            }

            clicked = clicked.parentNode;//클릭된 요소의 부모요소 세팅
        }

        //만약 처음에 연봉버튼 클릭하고 연봉모달이 열렸는데, 
        //아래 명령이 바로 실행되면 연봉모달이 열리자마자 닫혀버리게된다.
        //그래서 위에 while문에 바로 안닫히게 조건걸어줌
        document.querySelector('.salary-bar').style.height="0";
        document.querySelector('.salary-bar').style.border="none";
        btnFlag=0;
    }
    
})

//태그 없을 때 나타나는 안내문구
if(!document.querySelector('.selected-tag')){
    document.querySelector('.info-search__tags').innerHTML="<span class='tag-guide'>태그를 추가해보세요 :)</span>";
}

//각각의 셀렉트값들 담을 배열 (백엔드로 넘겨줄 것들)
let position = [];
let industry = [];
let techStack = [];
let condition = [];
let salary = [];
let address = [];
let keywordList;


//태그 추가 메소드
let addTag = (name,value)=>{

    //태그 추가 안내문구 삭제
    let deleteThis = document.querySelector('.tag-guide');
    if(deleteThis){
        document.querySelector('.info-search__tags').removeChild(deleteThis);
    }

    //이미 있는 태그면 추가 안함
    let tags = document.querySelectorAll('.selected-tag');
    let stop = false;
    tags.forEach((v)=>{
        if(v.firstElementChild.innerText==`${name} : ${value}`){
            alert('이미 추가된 태그입니다.');
            stop=true; //추가하지마
        }
    })

    //추가 안되어있는 태그면 추가해주자
    if(!stop){
        let newTag = '<div class="selected-tag"><span>'+`${name} : ${value}`
        +'</span><span class="material-icons clear-btn" onclick="deleteTag(event)">clear</span></div>'
        
        document.querySelector('.info-search__tags').insertAdjacentHTML('afterbegin',newTag);

        //태그 추가와 동시에 배열에도 담아주자
        switch(name){
            case '활동분야' : position.push(value); break;
            case '산업분야' : industry.push(value); break;
            case '테크스택' : techStack.push(value); break;
            case '채용조건' : condition.push(value); break;
            case '연봉' : salary.push(value.replace('만원','').replace(/(\s*)/g, "").split('~')[0]); 
                            salary.push(value.replace('만원','').replace(/(\s*)/g, "").split('~')[1]);
                            break; //연봉은 숫자만 잘라서 배열에 push해준다.
            case '지역' : address.push(value); break;
            default:console.log('insert err');
        }


    }
}

//태그관련 메소드들
let getPosition = (v)=>{
    addTag('활동분야',v.value);
}
let getIndustry = (v)=>{
    addTag('산업분야',v.value);
}
let getTechStack = (v)=>{
    addTag('테크스택',v.value);
}
let getCondition = (v)=>{
    addTag('채용조건',v.value);
}
let getAddress = (v)=>{
    addTag('지역',v.value);
}

document.querySelector('.salary-btn').addEventListener('click',()=>{
    let a = mySlider.getValue().split(',');
    if(a[0]==a[1]){ //최소연봉 최대연봉 같은 경우 금액 조절해서 태그추가
        if(a[1]==20000){
            a[0]=Number(a[0])-1000;
        }else{
            a[1]=Number(a[1])+1000;
        }
    }

    addTag('연봉',`${a[0]} ~ ${a[1]}만원`);

})

//태그 삭제버튼 클릭시 삭제
let deleteTag = (e)=>{

    //태그 없을 때 나타나는 안내문구
    if(!document.querySelector('.selected-tag')){
        document.querySelector('.info-search__tags').innerHTML="<span class='tag-guide'>태그를 추가해보세요 :)</span>";
    }
    
    e.target.parentNode.remove();//태그 삭제

    //태그 삭제 후 해당값들 백엔드로 넘길 배열에서 제외시키기
    let tagContent = e.target.parentNode.firstChild.innerText.replace(/(\s*)/g, "").split(':');//카테고리,값 나눠서 배열에 저장
    let name = tagContent[0]; //카테고리이름
    let value = tagContent[1]; //값(select된값)

    switch(name){
        case '활동분야' : position.splice(position.indexOf(value),1); break;
        case '산업분야' : industry.splice(industry.indexOf(value),1); break;
        case '테크스택' : techStack.splice(techStack.indexOf(value),1); break;
        case '채용조건' : condition.splice(condition.indexOf(value),1); break;
        case '연봉' : 
                        let minSalary = value.replace('만원','').replace(/(\s*)/g, "").split('~')[0];
                        let maxSalary = value.replace('만원','').replace(/(\s*)/g, "").split('~')[1];
                        salary.splice(salary.indexOf(minSalary),1);
                        salary.splice(salary.indexOf(maxSalary),1);
                        break; //연봉은 값이 두개씩 들어있으므로 잘라서 둘 다 배열에서 삭제해준다.
        case '지역' : address.splice(address.indexOf(value),1); break;
        default:console.log('delete err');
    }


}



//선택된 정렬옵션 진하게해주는 메소드
document.querySelectorAll('.search-results__align-options>span').forEach((v)=>{
    v.addEventListener('click',()=>{
        //클릭된 정렬옵션을 진하게해준다.
        document.querySelector('.aligning').classList.remove('aligning');
        v.classList.add('aligning');
    })
})


//각 기업별 채용정보 우상단 X버튼 클릭하면 해당 내용 지워주는 메소드
document.querySelectorAll('.close-btn').forEach((v)=>{
    v.addEventListener('click',()=>{
        console.log(v.parentNode);
        v.parentNode.parentNode.remove();//클릭된 버튼 포함된 채용정보 삭제해버린다.
    })
})


//-----------------페이징 처리-----------------------
let currentPage = 2;
let stopLoad = false;

let addList = (list,area)=>{
    list.forEach((v)=>{
        let company = v.company;
        let industries = v.industries;
        let recruitList = v.recruitList;

        let recruitInfo;   
        
    recruitInfo = '<div class="recruit-info">' 
                     +'<div class="recruit-info__icons">'
                        +'<span class="material-icons">close</span>'
                     +'</div>'
                     +'<div class="recruit-info__contents">'
                        +'<div class="company__thumb-area">'
                            +'<div class="company__thumbnail">';
                                if(company.compLogo=='(null)'||company.compLogo==null){
                                    recruitInfo+='<img src="resources/assets/conn.png" alt="company-thumb"/>';
                                }else{
                                    recruitInfo+='<img src="'+company.compLogo+'" alt="company-thumb"/>';
                                }
                recruitInfo+='</div>'
                        +'</div>'
                        +'<div class="company__info-wrapper">'
                            +'<div class="company__info-area">'
                                +'<input type="hidden" value="'+company.compNo+'"/>'
                                +'<div class="company-name">'+company.compName+'</div>'
                                +'<div class="company-desc">'+company.compInfo+'</div>'
                                +'<div class="company-industry">';
                                let count = 0;
                                industries.forEach((industry)=>{
                                    recruitInfo+='<span>'+industry.indusName+'</span>';
                                    if(count<industries.length-1){//마지막인덱스가 아닌 경우
                                        recruitInfo+='<span>&nbsp;·&nbsp;</span>';
                                        count++;
                                    }
                                })
                    recruitInfo+='</div>'
                                +'<div class="company-address">'+company.compAddress+'</div>'
                            +'</div>';//company__info-area
                            recruitList.forEach((recruit)=>{
                recruitInfo+='<div class="recruit-summary__wrapper">'
                                +'<div class="recruit-summary">'
                                    +'<div class="summary__contents">'
                                        +'<input type="hidden" value="'+recruit.recruitNo+'"/>'
                                        +'<div class="recruit-title">'+recruit.recruitTitle+'</div>'
                                        +'<span>'+recruit.recruitMinSal+' - '+recruit.recruitMaxSal+'만원</span>'
                                        +'<span> / </span>';
                                        if(recruit.recruitRequ==0){
                                            recruitInfo+='<span>신입</span>';
                                        }else if(recruit.recruitRequ==1){
                                            recruitInfo+='<span>경력</span>';
                                        }else{
                                            recruitInfo+='<span>신입,경력</span>';
                                        }
                        recruitInfo+='</div>'
                                    +'<div class="summary__icon">'
                                        +'<span class="material-icons">turned_in_not</span>'
                                        //<span class="material-icons">turned_in</span> 안채워진 북마크
                                    +'</div>'
                                +'</div>'
                                +'<div class="recruit-period">';
                                    if(recruit.recruitDl!=null||recruit.recruitDl!='(null)'){
                                        recruitInfo+='<span>'+recruit.recruitDl+'마감,</span>';
                                    }
                                    if(recruit.createdAt!=null||recruit.createdAt!='(null)'){
                                        recruitInfo+='<span>'+recruit.createdAt+'등록,</span>';
                                    }
                    recruitInfo+='</div>'
                            +'</div>';//recruit-summary__wrapper
                            });
            recruitInfo+='</div>'//company__info-wrapper
                    +'</div>'//recruit-info__contents
                +'</div>';//recruit-info

        area.insertAdjacentHTML('beforeend',recruitInfo);
    });
};

//스크롤 바닥까지 내리면 리스트 추가 로드(스크롤 바닥이면 추가로드 안함)
window.addEventListener('scroll',()=>{
    if(window.pageYOffset + document.documentElement.clientHeight >
            document.documentElement.scrollHeight - 1 && stopLoad!=true){
      console.log('로드!');
      axios.get('loadMoreList.re', {
        params: {
          currentPage: currentPage++,
          rawKeywordList:keywordList
        }
      })
      .then(function(container){
          console.log(container.data.pi);
          console.log(container.data.recruitInfoList);

          let pi = container.data.pi;
          let recruitInfoList = container.data.recruitInfoList
          let area = document.querySelector('.recruit-search__search-list');

          addList(recruitInfoList,area);

          if(pi.currentPage==pi.maxPage){
              stopLoad=true;
          }

      })
      .catch(function(error){
          console.log(error);            		  
      });
    }
  });


//검색창에서 엔터치면 버튼클릭이벤트 발생시키기
document.querySelector('.search-keyword').addEventListener('keydown',(e)=>{
    if(e.keyCode==13){
        document.querySelector('.search-btn').click();
    }
})

//검색돋보기버튼 클릭시
document.querySelector('.search-btn').addEventListener('click',()=>{

    let keyword = [];
    keyword.push(document.querySelector('.search-keyword').value); //다른 keyword처럼 ArrayList로 넘기기 위해 배열에담는다.

    //선택된 셀렉트박스값들, 검색키워드를 객체에 한번에 담는다.
    keywordList = {
        keyword:keyword,
        position:position,
        industry:industry,
        techStack:techStack,
        condition:condition,
        salary:salary,
        address:address
    };

    console.log(keywordList);

    stopLoad=false; //검색결과 스크롤 추가로드를 위해 세팅

    axios.get('loadMoreList.re', {
        params: {
          currentPage:1,
         rawKeywordList:keywordList
        }
      })
      .then(function(container){

          let pi = container.data.pi;
          let recruitInfoList = container.data.recruitInfoList
          let area = document.querySelector('.recruit-search__search-list');
        
          area.innerHTML="";//검색결과 초기화

          addList(recruitInfoList,area);

          if(pi.currentPage==pi.maxPage){
              stopLoad=true;
          }

      })
      .catch(function(error){
          console.log(error);            		  
      });

})