package com.devcat.nucacola.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.devcat.nucacola.common.model.vo.Chatrooms;
import com.devcat.nucacola.member.model.service.MemberService;
import com.google.gson.Gson;

@Controller
public class ChatRoomController {
	
	@Autowired
	private MemberService mService;
	
	
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

}
