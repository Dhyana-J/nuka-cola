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
	
	@ResponseBody
	@RequestMapping(value = "searchMemberList.ch", produces="application/json; charset=utf-8")
	public ArrayList<Member> searchMemberList(String keyword) {
		
		ArrayList<Member> searchedList = mService.searchMemberList(keyword);
		
		return searchedList;
	}
	
	@ResponseBody
	@RequestMapping(value = "selectMsgList.ch", produces="application/json; charset=utf-8")
	public ArrayList<messages> selectMsgList(int myNo, int mateNo) {
		
		ArrayList<Integer> noList = new ArrayList<>();
		noList.add(myNo);//로그인된 회원번호
		noList.add(mateNo);//채팅 상대방 회원번호
		
		return mService.selectMsgList(noList);
	}
	
	@ResponseBody
	@RequestMapping(value = "sendMsg.ch", produces="application/json; charset=utf-8")
	public HashMap<String,Integer> sendMsg(@RequestBody Map<String,Object> msgInfo) {
		
		HashMap<String,Integer> resultMap = new HashMap<>();
		
		//채팅방 번호 없는 경우(아직 채팅방 생성 안된 경우)
		//채팅방 생성 후, 채팅방 번호 세팅
		if (msgInfo.get("chatroomNo")==null) {
			int result = mService.createChatroom(msgInfo);
			
			if(result>0) {//채팅방 생성 성공했으면 채팅방번호 가져와서 리턴할 맵에 세팅해준다.
				int chatroomNo = mService.selectChatroomNo(msgInfo);
				resultMap.put("chatroomNo",chatroomNo);
				msgInfo.put("chatroomNo",chatroomNo);
			}else {//방 생성 실패하면 실패코드 리턴
				resultMap.put("result",0);
				return resultMap;
			}
		}
		
		//기존에 채팅방번호 있었다면 그냥 채팅 전송 결과값만 리턴한다.
		int result = mService.sendMsg(msgInfo);
		resultMap.put("result",result);
		
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "selectLatestMsg.ch", produces="application/json; charset=utf-8")
	public ArrayList<messages> selectLatestMsg(int myNo, int mateNo) {
		
		ArrayList<Integer> noList = new ArrayList<>();
		noList.add(myNo);//로그인된 회원번호
		noList.add(mateNo);//채팅 상대방 회원번호
		
		return mService.selectLatestMsg(noList);
	}
	
	

}
