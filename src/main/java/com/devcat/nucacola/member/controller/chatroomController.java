package com.devcat.nucacola.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.member.model.service.MemberService;

@Controller
public class chatroomController {

	@Autowired
	private MemberService mService;
	
	@RequestMapping("chatRoom.me")
	public String profileUser() {
			
		return "chatRooms/chatRoomView";
	}
	
	@RequestMapping("websocket.me")
	public String websocket() {
			
		return "common/websocket";
	}
	
	
	
}
