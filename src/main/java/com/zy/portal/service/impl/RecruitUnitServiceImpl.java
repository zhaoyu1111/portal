package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.portal.entity.RecruitUnit;
import com.zy.portal.mapper.RecruitUnitMapper;
import com.zy.portal.service.RecruitUnitService;
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
public class RecruitUnitServiceImpl extends ServiceImpl<RecruitUnitMapper, RecruitUnit> implements RecruitUnitService {

    @Override
    public RecruitUnit getRecruitUnit(Long unitId) {
        QueryWrapper<RecruitUnit> query = new QueryWrapper<>();
        query.eq("unit_id", unitId);
        return baseMapper.selectOne(query);
    }

    @Override
    public List<RecruitUnit> listUnit(List<Long> unitIds) {
        QueryWrapper<RecruitUnit> query = new QueryWrapper<>();
        query.in("unit_id", unitIds);
        return baseMapper.selectList(query);
    }
}
