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
public class Member {
	
	private int userNo;
	private String loginType;
	private String email;
	private String userPwd;
	private String userName;
	private String userBirth;
	private int userPosi;
	private int status;
	private String userInfo;
	private String userEdu;
	private String userAvatar;
	private String createdAt;
	private String updatedAt;
	private String accessToken;
	private String certifyQues;
	private String certifyAns;

}
