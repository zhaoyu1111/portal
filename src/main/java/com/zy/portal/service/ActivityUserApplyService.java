package com.zy.portal.service;

import com.zy.portal.entity.ActivityUserApply;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-04-02
 */
public interface ActivityUserApplyService extends IService<ActivityUserApply> {

    ActivityUserApply getApply(Long studentId, Long activityId);
}
