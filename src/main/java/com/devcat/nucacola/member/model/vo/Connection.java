package com.devcat.nucacola.member.model.vo;

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
public class Connection {

	
	private int followerNo;
	private int followingNo;
	private String createdAt;
	
	public Connection(int followerNo, int followingNo) {
		super();
		this.followerNo = followerNo;
		this.followingNo = followingNo;
	}
	
	

}
