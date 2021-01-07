package com.devcat.nucacola.common.model.vo;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString

public class Chatrooms {

	private int chatroomNo;
	private String createdAt;
	private int userOne;
	private int userTwo;
	
	
	
	//메세지를 주고받는 사람들을 간단히 볼수 있는 데이터 조회
	private String userName;
	private String userAvatar;
	private String messageContent;
	private String messageCreate;
	
}
