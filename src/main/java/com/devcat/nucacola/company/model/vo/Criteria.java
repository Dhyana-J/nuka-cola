package com.devcat.nucacola.company.model.vo;

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

public class Criteria {

	private int pageNum=1;
	private int amount=10;
	
	private String type;  // 산업분야 넘겼을 경우
	private String keyword;
	
	
}
