package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.portal.entity.Resume;
import com.zy.portal.mapper.ResumeMapper;
import com.zy.portal.service.ResumeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-04-13
 */
@Service
public class ResumeServiceImpl extends ServiceImpl<ResumeMapper, Resume> implements ResumeService {

    @Override
    public List<Resume> listResume(Long studentId) {
        QueryWrapper<Resume> query = new QueryWrapper<>();
        query.eq("student_id", studentId);
        return baseMapper.selectList(query);
    }

    @Override
    public Resume getResume(Long resumeId) {
        return baseMapper.selectById(resumeId);
    }

    @Override
    public List<Resume> getResume(List<Long> resumeIds) {
        QueryWrapper<Resume> query = new QueryWrapper<>();
        query.in("resume_id", resumeIds);
        return baseMapper.selectList(query);
    }
}
