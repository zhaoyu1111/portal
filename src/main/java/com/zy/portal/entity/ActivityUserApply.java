package com.zy.portal.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
 * @since 2019-04-02
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@TableName("activity_user_apply")
public class ActivityUserApply extends SuperEntity<ActivityUserApply> implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 申请ID
     */
    @TableId(value = "apply_id", type = IdType.AUTO)
    private Long applyId;
    /**
     * 活动ID
     */
    @TableField("activity_id")
    private Long activityId;
    /**
     * 用户ID
     */
    @TableField("user_id")
    private Long userId;
    /**
     * 手机号
     */
    @TableField("mobile")
    private String mobile;
    /**
     * 活动参与码
     */
    @TableField("activity_code")
    private String activityCode;

    @TableField("email")
    private String email;


    @Override
    protected Serializable pkVal() {
        return this.applyId;
    }

}
