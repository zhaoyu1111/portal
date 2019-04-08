package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.entity.Activity;
import com.zy.portal.mapper.ActivityMapper;
import com.zy.portal.service.ActivityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-04-02
 */
@Service
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper, Activity> implements ActivityService {

    @Override
    public IPage<Activity> listActivity(Integer currentPage, Long activityId) {
        QueryWrapper<Activity> query = new QueryWrapper<>();
        if(null != activityId) {
            query.ne("activity_id", activityId);
        }
        Page<Activity> page = new Page<>(currentPage, 10);
        return baseMapper.selectPage(page, query);
    }

    @Override
    public Activity getActivity(Long activityId) {
        Activity activity = baseMapper.selectById(activityId);
        if(null == activity) {
            return new Activity();
        }
        activity.setInterests(activity.getInterests() + 1);
        baseMapper.updateById(activity);
        return activity;
    }
}
