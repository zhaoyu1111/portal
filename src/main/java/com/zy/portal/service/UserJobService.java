package com.zy.portal.service;

import com.zy.portal.entity.UserJob;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-04-16
 */
public interface UserJobService extends IService<UserJob> {

    /**
     * 更新工作信息
     * @param userJob
     */
    void userJobUpdate(UserJob userJob);
}
