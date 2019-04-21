package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.portal.entity.ActivityUserApply;
import com.zy.portal.mapper.ActivityUserApplyMapper;
import com.zy.portal.service.ActivityUserApplyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

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
        return baseMapper.selectOne(query);
    }
}
