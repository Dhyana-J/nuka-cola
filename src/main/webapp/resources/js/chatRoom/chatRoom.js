'use strict';


/*----------- 대화상대 검색 -----------*/
//area에 구성원 정보 추가해주는 메소드
const loadSearchedList = (list, area) => {

   
    list.forEach((v) => {
        
        if(v.userNo!=userNo){//검색결과에 본인 이외의 사람들만 뜨도록한다.

            let member = 
                            `<div class="user-info__wrapper" onclick="letsChat(${userNo},${v.userNo})">
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
    
    axios.get('searchMemberList.ch',{
        params:{
            keyword:e.target.value
        }
    })
    .then((searchedList)=>{

        //searchResult는 한 개 이상의 검색된 일반회원 리스트임
        let list = searchedList.data;
        let area = document.querySelector('.search-list');//리스트 추가해줄 요소

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

//이 두 변수는 채팅창 띄울 경우 초기화됨 (send message할 때 쓰임)
let deliverNo; //내 회원번호
let reciverNo; //상대방 회원번호
let chatroomNo; //채팅방 식별자

//웹소켓 설정
let sock = new SockJS("http://localhost:8888/nukacola/echo/");


// 서버와 연결을 끊었을 때
let onClose = (evt)=>{
    alert('서버와 연결이 끊겼어요 ㅠㅠ');
}

//-------채팅창 띄웠을 때-------

//채팅창에 메세지 추가해주는 메소드
const loadMsgList = (list,area)=>{

    list.forEach((v)=>{
        
        let msgList = 
                `<li class="clearfix">`;

            if(v.deliverNo==userNo){//내가 보낸 메세지(왼쪽정렬됨)
               msgList+=
                        `<div class="message-data align-left">
                            <span class="message-data-name">${v.deliverName}</span>
                            <span class="message-data-time">${v.createdAt}&nbsp; &nbsp;</span>
                        </div>
                        <div class="message my-message float-left"> 
                            ${v.messageContent}
                        </div>
                        </li>`;

            }else{//상대가 보낸 메세지 (오른쪽정렬됨)
                msgList+=
                        `<div class="message-data align-right">
                            <span class="message-data-time">${v.createdAt}&nbsp; &nbsp;</span>
                            <span class="message-data-name">${v.deliverName}</span>
                        </div>
                        <div class="message other-message float-right">
                            ${v.messageContent}
                        </div>`;
            }

        msgList+=`</li>`;

        area.insertAdjacentHTML('beforeend', msgList);
    });

}

//채팅창 처음 띄울 때 사용되는 메소드
const letsChat=(myNo,mateNo)=>{//내 회원번호ㅡ 상대회원번호 인자로 받음

    //두 변수 초기화
    deliverNo=myNo;
    reciverNo=mateNo;

    //채팅창 처음 뜰 때
    //채팅창에 채팅정보를 불러와 뿌려주고, hidden 해제해서 보이게해야함
    axios.get('selectMsgList.ch',{
        params:{
            myNo:myNo,
            mateNo:mateNo
        }
    })
    .then((msgList)=>{

        let list = msgList.data;
        let area = document.querySelector('#chat-all');//리스트 추가해줄 요소

        if(msgList.data.length!=0){ //대화내역 있으면
            loadMsgList(list,area); //area에 list 추가
            chatroomNo=list[0].chatroomNo;//채팅방식별자 초기화
        }

        document.querySelector('.chatting-box').classList.remove('hidden-box');//채팅창 숨김 해제
        document.querySelector('.chat-history').scrollTop=document.querySelector('.chat-history').scrollHeight;//스크롤 가장 아래로(최근대화로)

    })
    .catch((err)=>{
        console.log(err);
    })
    
}

//메세지 전송버튼 누르면 실행될 메소드
document.querySelector('#send-btn').addEventListener('click', ()=>{
    let msg = document.querySelector('#message-to-send').value;
    if(msg!=''){
        sendMessage(msg);
        document.querySelector('#message-to-send').value='';
    }
})

//send버튼 누르면 axios실행해서 메세지 db에 추가
const sendMessage = (msgContent)=>{

    console.log('sendmessage실행')
    console.log(msgContent);

    axios.post('sendMsg.ch',{
           myNo:deliverNo,
           mateNo:reciverNo,
           chatroomNo:chatroomNo,
           msgContent:msgContent
    })
    .then((response)=>{
        if(response.data.result>0){//DB에 채팅내용 추가 완료한 경우

            console.log(response.data);
            if(response.data.chatroomNo!=undefined){ //기존에 채팅방번호 없었다면 세팅해준다.
                chatroomNo=response.data.chatroomNo;
            }

            //DB 성능때문인지 insert후 바로 최근 메세지 조회가 안되는 경우가 있어
            //sock.send()할 때까지 딜레이 만들었다.
            setTimeout(()=>{
                sock.send();//메세지 보냈다는걸 알리는 용도
                //sock.send()가 이루어지면 바로 onMessage() 실행됨

            },1000);
        }else{
            alert('문제가 발생했습니다. 다시 시도해주세요');
        }

    })
    .catch((err)=>{
        console.log(err);
    })

}

//보내거나 받은거 있으면 채팅창에 바로 추가해주기 sock.onMessage = 자바스크립트추가구문
const onMessage= ()=>{

    axios.get('selectLatestMsg.ch',{
        params:{
            myNo:deliverNo,
            mateNo:reciverNo
        }
    })
    .then((msgList)=>{

        console.log('onmessage실행 조회해와서 채팅창에 추가할 가장 최근 메세지')
        console.log(msgList.data[0].messageContent);

        let list = msgList.data;
        let area = document.querySelector('#chat-all');//리스트 추가해줄 요소
        
        if(msgList.data.length!=0){ //불러온 대화내역 있으면
            loadMsgList(list,area); //area에 list 추가
        }

        document.querySelector('.chat-history').scrollTop=document.querySelector('.chat-history').scrollHeight;//스크롤 가장 아래로(최근대화로)

    })
    .catch((err)=>{
        console.log(err);
    })

}


//채팅창 닫기
document.querySelector('.close-btn').addEventListener('click', ()=>{
    document.querySelector('#chat-all').innerHTML='';
    document.querySelector('.chatting-box').classList.add('hidden-box');

    //사용한 변수 초기화
    deliverNo=null;
    reciverNo=null;
    chatroomNo=null;
})

//sock.onmessage : 본인 또는 상대가 보낸 메세지가 있으면 그 메세지객체 반환함
//여기서는 상대가 메세지 보냈는지 확인하는 용도로만 사용
sock.onmessage = onMessage;
sock.onclose = onClose;
