package com.zy.portal.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableName;
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
 * @since 2019-04-16
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("user_job")
public class UserJob extends SuperEntity<UserJob> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "student_id", type = IdType.ID_WORKER)
    private Long studentId;
    @TableField("job_name")
    private String jobName;
    @TableField("unit_id")
    private Long unitId;
    @TableField("post")
    private String post;
    @TableField("start_time")
    private String startTime;

    @TableField("descrip")
    private String descrip;

    @TableField("status")
    private Integer status;


    @Override
    protected Serializable pkVal() {
        return this.studentId;
    }

}
