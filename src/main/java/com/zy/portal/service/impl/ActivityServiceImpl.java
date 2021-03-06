package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.entity.Activity;
import com.zy.portal.mapper.ActivityMapper;
import com.zy.portal.service.ActivityService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
        query.orderByDesc("start_time");
        query.ne("status", 1);
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

    @Override
    public void updateSignNumber(Long activityId) {
        Activity activity = baseMapper.selectById(activityId);
        if(null != activity) {
            activity.setSignNumber(activity.getSignNumber() + 1);
        }
        baseMapper.updateById(activity);
    }

    @Override
    public List<Activity> listActivity() {
        QueryWrapper<Activity> query = new QueryWrapper<>();
        Page<Activity> page = new Page<>(1, 10);
        query.orderByDesc("utime");
        return baseMapper.selectPage(page, query).getRecords();
    }

    @Override
    public List<Activity> batchGet() {
        QueryWrapper<Activity> query = new QueryWrapper<>();
        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
        String now = sm.format(new Date());
        query.lt("end_time", now);
        query.eq("status", 2);
        return baseMapper.selectList(query);
    }

    @Override
    public List<Activity> getActivity() {
        QueryWrapper<Activity> query = new QueryWrapper<>();
        SimpleDateFormat sm = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.DATE, 1);
        String yestady =  sm.format(calendar.getTime());
        query.eq("start_time", yestady);
        query.eq("status", 2);
        return baseMapper.selectList(query);
    }
}
