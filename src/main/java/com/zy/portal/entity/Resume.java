package com.zy.portal.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.IdType;
import com.zy.portal.entity.SuperEntity;

import com.baomidou.mybatisplus.annotation.Version;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zy
 * @since 2019-04-13
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Resume extends SuperEntity<Resume> {

    private static final long serialVersionUID = 1L;

    /**
     * 简历ID
     */
    @TableId(value = "resume_id", type = IdType.ID_WORKER)
    private Long resumeId;
    /**
     * 简历标题
     */
    @TableField("resume_title")
    private String resumeTitle;
    /**
     * 职业类型
     */
    @TableField("career_type")
    private String careerType;
    /**
     * 期望薪资
     */
    @TableField("salary")
    private Integer salary;
    /**
     * 个人简介
     */
    @TableField("descrip")
    private String descrip;
    /**
     * 用户Id
     */
    @TableField("student_id")
    private Long studentId;


    @Override
    protected Serializable pkVal() {
        return this.resumeId;
    }

}
