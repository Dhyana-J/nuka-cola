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
	private String compName;
	
	//기업구성원 추가할 때 쓰일 생성자
	public Career(int userNo, int compNo, String careerPosi) {
		super();
		this.userNo = userNo;
		this.compNo = compNo;
		this.careerPosi = careerPosi;
	}
		
	
}
