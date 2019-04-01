package com.zy.portal.entity;

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
 * @since 2019-03-30
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("recruit_apply")
public class RecruitApply extends SuperEntity<RecruitApply> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "recurit_id", type = IdType.INPUT)
    private Long recuritId;
    @TableField("student_id")
    private Long studentId;
    @TableField("unit_id")
    private Long unitId;


    @Override
    protected Serializable pkVal() {
        return this.recuritId;
    }

}
