package com.zy.portal.dto;

import lombok.Data;

@Data
public class ResumeDetail {

    private String userName;

    private String mobile;

    private Integer gender;

    private String currentCity;

    private Long resumeId;
    /**
     * 简历标题
     */
    private String resumeTitle;
    /**
     * 职业类型
     */
    private String careerType;
    /**
     * 期望薪资
     */
    private Integer salary;
    /**
     * 个人简介
     */
    private String descrip;
}
