package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.portal.entity.RecruitApply;
import com.zy.portal.mapper.RecruitApplyMapper;
import com.zy.portal.service.RecruitApplyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-03-30
 */
@Service
public class RecruitApplyServiceImpl extends ServiceImpl<RecruitApplyMapper, RecruitApply> implements RecruitApplyService {

    @Override
    public List<RecruitApply> listApplys(Long recuritId, Long unitId) {
        QueryWrapper<RecruitApply> query = new QueryWrapper<>();
        if(null == recuritId || null == unitId) {
            return null;
        }
        query.eq("recurit_id", recuritId);
        query.eq("unit_id", unitId);
        return baseMapper.selectList(query);
    }
}
