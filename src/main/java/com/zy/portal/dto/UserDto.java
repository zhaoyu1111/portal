package com.zy.portal.dto;

import lombok.Data;

@Data
public class UserDto {

    private String userName;
    /**
     * 学号
     */
    private Long studentId;
    /**
     * 班级ID
     */
    private Long classId;
    /**
     * 学院ID
     */
    private Long collegeId;
    /**
     * 手机号
     */
    private String mobile;
    /**
     * 性别0-男 1-女
     */
    private Integer gender;
    /**
     * 生日
     */
    private String birthday;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 个人简介
     */
    private String introduce;
    /**
     * 家庭住址
     */
    private String homeAddress;
    /**
     * 当前城市
     */
    private String currentCity;
    /**
     * 用户状态0-正常 1-冻结
     */
    private Integer status;
    /**
     * 密码
     */
    private String pwd;
    /**
     * 专业ID
     */
    private Long majorId;

    private String qq;

    private String wechat;

    private String tikTok;

    private String jobName;

    private String unitName;
}
