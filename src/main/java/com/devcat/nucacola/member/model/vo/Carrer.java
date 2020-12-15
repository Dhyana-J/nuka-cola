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
public class Carrer {


	private int userNo;
	private int compNo;
	private String carrerPosi;
	private int carrerState;
	private String udatedAt;
	private String enteredAt;
	private String createdAt;
	
}
