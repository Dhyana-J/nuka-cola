package com.devcat.nucacola.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.devcat.nucacola.member.model.service.MemberService;

@Controller
public class ChatRoomController {
	
	@Autowired
	private MemberService mService;
	
	
	@RequestMapping("chat.ch")
	public String chatRoomView() {
		return "chatRooms/chatRoom";
	}
	

}
