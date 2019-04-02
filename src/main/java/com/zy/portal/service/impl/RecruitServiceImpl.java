package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.entity.Recruit;
import com.zy.portal.mapper.RecruitMapper;
import com.zy.portal.service.RecruitService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-03-29
 */
@Service
public class RecruitServiceImpl extends ServiceImpl<RecruitMapper, Recruit> implements RecruitService {

    @Override
    public IPage<Recruit> queryRecruit(Integer currentPage) {
        QueryWrapper<Recruit> query = new QueryWrapper<>();
        query.orderByDesc("ctime");
        query.eq("status", 2);
        query.eq("deleted", 1);
        Page<Recruit> pages = new Page<>(currentPage, 10);
        return baseMapper.selectPage(pages, query);
    }

    @Override
    public Recruit getRecruit(Long recruitId) {
        QueryWrapper<Recruit> query = new QueryWrapper<>();
        query.eq("recurit_id", recruitId);
        query.eq("deleted", 1);
        query.eq("status", 2);
        return baseMapper.selectOne(query);
    }

    @Override
    public List<Recruit> listRecruit(Long unitId, Long recuritId) {
        QueryWrapper<Recruit> query = new QueryWrapper<>();
        query.eq("unit_id", unitId);
        query.ne("recurit_id", recuritId);
        query.orderByDesc("ctime");
        Page<Recruit> recruitPage = new Page<>(1, 4);
        IPage<Recruit> recruitIPage = baseMapper.selectPage(recruitPage, query);
        return recruitIPage.getRecords();
    }
}
