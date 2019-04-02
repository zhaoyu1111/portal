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
 * @since 2019-04-01
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Class extends SuperEntity<Class> {

    private static final long serialVersionUID = 1L;

    /**
     * 班级ID
     */
    @TableId(value = "class_id", type = IdType.ID_WORKER)
    private Long classId;
    /**
     * 学院ID
     */
    @TableField("college_id")
    private Long collegeId;
    /**
     * 专业ID
     */
    @TableField("major_id")
    private Long majorId;
    /**
     * 班主任
     */
    @TableField("head_master")
    private String headMaster;
    /**
     * 辅导员
     */
    @TableField("counselor")
    private String counselor;
    /**
     * 班级名称
     */
    @TableField("class_name")
    private String className;
    /**
     * 班级联系人
     */
    @TableField("contractor")
    private String contractor;
    /**
     * 年级
     */
    @TableField("grade")
    private String grade;

    @TableField("descript")
    private String descript;


    @Override
    protected Serializable pkVal() {
        return this.classId;
    }

}
