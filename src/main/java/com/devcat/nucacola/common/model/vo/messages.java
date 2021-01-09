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

public class messages {

	private int messageNo;
	private String messageContent;
	private String createdAt;
	private int deliverNo;
	private int reciverNo;
	private int chatroomNo;
	
	//채팅방 유저이름 나타내기 위해 추가함
	private String deliverName;
	private String reciverName;
	
}
