package com.zy.portal.service;

import com.zy.portal.entity.UserJob;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

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

    /**
     * 获取用户工作
     * @param studentIds
     * @return
     */
    List<UserJob> getUserJob(List<Long> studentIds);

    UserJob getUserJob(Long studentId, Boolean status);
}
