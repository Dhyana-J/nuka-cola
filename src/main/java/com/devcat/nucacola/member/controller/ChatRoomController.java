package com.devcat.nucacola.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.Chatrooms;
import com.devcat.nucacola.common.model.vo.messages;
import com.devcat.nucacola.member.model.service.MemberService;
import com.devcat.nucacola.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class ChatRoomController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("test.ch")
	public String chatRoomView2() {
		return "common/websocket";
	}

	
	@RequestMapping("chat.ch")
	public String chatRoomView() {
		return "chatRooms/chatRoom";
	}
	
	@ResponseBody
	@RequestMapping(value = "selectChatRoomList.ch", produces="application/json; charset=utf-8")
	public String selectChatRoomList(int userNo) {
		
		
		ArrayList<Chatrooms> chatList = new ArrayList<>();
		
		chatList = mService.selectChatRoomList(userNo);
		
		return new Gson().toJson(chatList);
		
	}
	
	//준호작성
	@ResponseBody
	@RequestMapping(value = "searchMemberList.ch", produces="application/json; charset=utf-8")
	public ArrayList<Member> searchMemberList(String keyword) {
		
		ArrayList<Member> searchedList = mService.searchMemberList(keyword);
		
		return searchedList;
	}
	
	//준호작성
	@ResponseBody
	@RequestMapping(value = "selectMsgList.ch", produces="application/json; charset=utf-8")
	public ArrayList<messages> selectMsgList(int myNo, int mateNo) {
		
		ArrayList<Integer> noList = new ArrayList<>();
		noList.add(myNo);//로그인된 회원번호
		noList.add(mateNo);//채팅 상대방 회원번호
		
		return mService.selectMsgList(noList);
	}
	
	//준호작성
	@ResponseBody
	@RequestMapping(value = "sendMsg.ch", produces="application/json; charset=utf-8")
	public HashMap<String,String> sendMsg(@RequestBody Map<String,Object> msgInfo) {
		
		HashMap<String,String> resultMap = new HashMap<>();
		
		if (msgInfo.get("chatroomNo")==null) {//채팅방 번호 안넘어온 경우(기존에 상대와 대화내역이 없는 경우&& 상대와 동시에 채팅창 켠 경우)
			//대화내역이 없는 상대와 동시에 채팅창 켠 경우 애초에 chatroomNo가 안넘어온다. 그래서 따로 검색해보고 채팅방 없으면 채팅방만들고 채팅방번호설정하고,
			//채팅방 있으면 채팅방번호만 설정해준다.
			
			if(mService.selectChatroomNo(msgInfo)==null) {//채팅방이 DB에 없는 경우
				
				int result = mService.createChatroom(msgInfo);//채팅방 만들어준다.
				
				if(result>0) {//채팅방 생성 성공했으면 채팅방번호 가져와서 리턴할 맵에 세팅해준다.
					String chatroomNo = mService.selectChatroomNo(msgInfo);
					resultMap.put("chatroomNo",chatroomNo);
					msgInfo.put("chatroomNo",chatroomNo);
				}else {//방 생성 실패하면 실패코드 리턴
					resultMap.put("result","0");
					return resultMap;
				}
				
			}else {//채팅방이 DB에 있는 경우
				String chatroomNo = mService.selectChatroomNo(msgInfo);
				resultMap.put("chatroomNo",chatroomNo);
				msgInfo.put("chatroomNo",chatroomNo);
			}
			
		}
		
		//채팅방번호 있으면 채팅 전송 결과값 리턴한다.
		int result = mService.sendMsg(msgInfo);
		
		
		if(result>0) {
			resultMap.put("result","1");
		}else {
			resultMap.put("result","0");
		}
		
		
		return resultMap;
	}
	
	//준호작성
	@ResponseBody
	@RequestMapping(value = "selectLatestMsg.ch", produces="application/json; charset=utf-8")
	public ArrayList<messages> selectLatestMsg(int myNo, int mateNo) {
		
		ArrayList<Integer> noList = new ArrayList<>();
		noList.add(myNo);//로그인된 회원번호
		noList.add(mateNo);//채팅 상대방 회원번호
		
		ArrayList<messages> result = mService.selectLatestMsg(noList);
		System.out.println("**************selectLatestMsg.ch 실행됨");
		System.out.println(result);
		for(messages e:result) {
			System.out.println(e);
		}
		
		return result;
	}
	
	

}
