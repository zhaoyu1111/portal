package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.portal.entity.ActivityUserApply;
import com.zy.portal.mapper.ActivityUserApplyMapper;
import com.zy.portal.service.ActivityUserApplyService;
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
public class ActivityUserApplyServiceImpl extends ServiceImpl<ActivityUserApplyMapper, ActivityUserApply> implements ActivityUserApplyService {

    @Override
    public ActivityUserApply getApply(Long studentId, Long activityId) {
        QueryWrapper<ActivityUserApply> query = new QueryWrapper<>();
        query.eq("user_id", studentId);
        query.eq("activity_id", activityId);
        return baseMapper.selectOne(query);
    }

    @Override
    public List<ActivityUserApply> getApply(List<Long> activityIds) {
        QueryWrapper<ActivityUserApply> query = new QueryWrapper<>();
        query.in("activity_id", activityIds);
        return baseMapper.selectList(query);
    }
}
