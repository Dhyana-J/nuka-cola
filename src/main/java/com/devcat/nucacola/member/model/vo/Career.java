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
public class Career {


	private int userNo;
	private int compNo;
	private String careerPosi;
	private int careerState;
	private String updatedAt;
	private String enteredAt;
	private String createdAt;
	
}
