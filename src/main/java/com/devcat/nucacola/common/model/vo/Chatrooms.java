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
	
}
