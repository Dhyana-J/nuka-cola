package com.devcat.nucacola.recruits.model.vo;
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
public class ApplyProg {
	
	private int submitState; // 서류접수
	private int passState; // 서류합격
	private int joinState; // 팀합류
	private int failState; // 탈락
}
