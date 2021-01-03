package com.devcat.nucacola.member.model.vo;

import java.util.List;

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
//사람검색 검색엔진 vo
public class PartnerSearch {
		private int userNo;//로그인한 유저번호
		private int pList;//업무분야
		private List<Integer> skList;
		private String schoolList;
		private String keyword;
}
