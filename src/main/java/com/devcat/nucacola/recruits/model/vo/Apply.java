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


public class Apply {
	
	private int applyNo; // 지원공고식별자
	private String applyComment; // 지원한마디
	private int applyProg; // 채용단계
	private String createdAt; // 지원날짜
	private String updatedAt; // 삭제날짜
	private int userNo; // 유저식별자
	private int recruitNo; // 채용공고식별자
	
	public Apply(int userNo, int recruitNo) {
		super();
		this.userNo = userNo;
		this.recruitNo = recruitNo;
	}
}
