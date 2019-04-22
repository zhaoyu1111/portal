package com.zy.portal.dto;

import lombok.Data;

@Data
public class RecruitDetail {

    private Long recuritId;
    /**
     * 标题
     */
    private String title;
    /**
     * 工资
     */
    private String salary;
    /**
     * 招聘人数
     */
    private Integer members;
    /**
     * 简历投递数
     */
    private Integer resumes;
    /**
     * 结束时间
     */
    private String endTime;
    /**
     * 联系人姓名
     */
    private String contractor;
    /**
     * 电话
     */
    private String mobile;
    /**
     * 职位名称
     */
    private String posName;
    /**
     * 职位描述
     */
    private String posDescript;
    /**
     * 福利
     */
    private String welfare;
    /**
     * 工作地点
     */
    private String workPlace;
    /**
     * 职位所属单位
     */
    private Long unitId;
    /**
     * 简历发送邮箱
     */
    private String email;

    /**
     * 单位名称
     */
    private String unitName;
    /**
     * 所属行业
     */
    private String industry;
    /**
     * 单位性质
     */
    private Integer property;
    /**
     * 单位规模
     */
    private Integer scale;
    /**
     * 单位网站
     */
    private String unitWeb;

    /**
     * 公司电话
     */
    private String companyPhone;
    /**
     * 公司描述
     */
    private String direct;
    /**
     * 公司地址
     */
    private String address;

    private Long ctime;

    private Long utime;
}
