package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.portal.entity.UserJob;
import com.zy.portal.mapper.UserJobMapper;
import com.zy.portal.service.UserJobService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-04-16
 */
@Service
public class UserJobServiceImpl extends ServiceImpl<UserJobMapper, UserJob> implements UserJobService {

    @Override
    public void userJobUpdate(UserJob userJob) {
        baseMapper.updateById(userJob);
    }

    @Override
    public List<UserJob> getUserJob(List<Long> studentIds) {
        QueryWrapper<UserJob> query = new QueryWrapper<>();
        query.in("student_id", studentIds);
        return baseMapper.selectList(query);
    }
}
