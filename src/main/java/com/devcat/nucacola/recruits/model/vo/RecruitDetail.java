package com.devcat.nucacola.recruits.model.vo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString


public class RecruitDetail {
    private int recruitNo;
    private String recruitTitle;
    private String recruitInfo;
    private int recruitState;
    private String recruitMain;
    private int recruitPosi;
    private String recruitImg;
    private int recruitMinSal;
    private int recruitMaxSal;
    private int recruitRequ;
    private String recruitDl;
    private int recruitCount;
    private int compNo;
    private String createdAt;
    private String compName;
    private String compInfo;
    private String compEmail;
    private String compAddress;
    private String compHeadCount;
    private String compBirth;
    private int compPm;
    private int managerNo;
    private String managerAvatar;
    private String managerName;
    private String managerComp;
}
