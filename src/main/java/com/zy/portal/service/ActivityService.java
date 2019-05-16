package com.zy.portal.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zy.portal.entity.Activity;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-04-02
 */
public interface ActivityService extends IService<Activity> {

    /**
     * 查询活动信息
     * @param currentPage
     * @return
     */
    IPage<Activity> listActivity(Integer currentPage, Long activityId);

    List<Activity> listActivity();

    /**
     * 获取活动详情
     * @param activityId
     * @return
     */
    Activity getActivity(Long activityId);

    void updateSignNumber(Long activityId);

    List<Activity> batchGet();

    List<Activity> getActivity();
}
