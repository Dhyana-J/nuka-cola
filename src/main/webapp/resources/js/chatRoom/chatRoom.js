'use strict';


/*----------- 대화상대 검색 -----------*/


//area에 구성원 정보 추가해주는 메소드
const loadSearchedList = (list, area) => {

   
    list.forEach((v) => {
        
        if(v.userNo!=userNo){//검색결과에 본인 이외의 사람들만 뜨도록한다.

            let member = 
                            `<div class="user-info__wrapper" onclick="letsChat(userNo,${v.userNo})">
                                <input type="hidden" value="${v.userNo}"/>
                                <div class="img-wrapper">`;
                            if(v.userAvatar==undefined){
                            member+=`<img src="resources/assets/elon.jpg" alt="profileImg">`;
                            }else{
                            member+=`<img src="${v.userAvatar}" alt="profileImg">`;
                            }
                        member+=`</div>
                                <div class="user-info">
                                    <strong>${v.userName}</strong>`;
                                if(v.userEdu!=null){
                                member+=`<span>${v.userEdu}</span>`;
                                }
                                if(v.userComp!=null){
                                member+=`<span>${v.userComp}</span>`;
                                }
                        member+=`</div>
                            </div>`;
    
    
            area.insertAdjacentHTML('beforeend', member);

        }

        
    });

};

document.querySelector('#user-search').addEventListener('input',(e)=>{
    console.log(e.target.value);
    axios.get('searchMemberList.ch',{
        params:{
            keyword:e.target.value
        }
    })
    .then((searchedList)=>{

        //searchResult는 한 개 이상의 검색된 일반회원 리스트임
        let list = searchedList.data;
        let area = document.querySelector('.search-list');//리스트 추가해줄 요소

		console.log(list);
        if(searchedList.data.length==0){ //검색결과가 없다면
            area.innerHTML='<p class="no-result">검색 결과가 없습니다.</p>';
        }else{//검색결과 있다면
            area.innerHTML=''; //기존 리스트 초기화
            loadSearchedList(list,area);
        }


    })
    .catch((err)=>{
        console.log(err);
    })
})


/*----------- 웹소켓 채팅 기능 ---------*/
const letsChat=(myNo,userNo)=>{//내 회원번호ㅡ 상대회원번호 인자로 받음
    

}

document.querySelector('.close-btn').addEventListener('click', ()=>{
    document.querySelector('.chatting-box').remove();
})
