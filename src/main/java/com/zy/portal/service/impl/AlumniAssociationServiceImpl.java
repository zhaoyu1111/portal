package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.zy.portal.dto.AlumniAssociaIndex;
import com.zy.portal.dto.OrgSortInfo;
import com.zy.portal.entity.AlumniAssociation;
import com.zy.portal.mapper.AlumniAssociationMapper;
import com.zy.portal.service.AlumniAssociationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-03-31
 */
@Service
public class AlumniAssociationServiceImpl extends ServiceImpl<AlumniAssociationMapper, AlumniAssociation> implements AlumniAssociationService {

    @Override
    public List<AlumniAssociation> listAssocia() {
        QueryWrapper<AlumniAssociation> query = new QueryWrapper<>();
        query.orderByDesc("ctime");
        query.eq("deleted", 1);
        return baseMapper.selectList(query);
    }

    @Override
    public AlumniAssociation getAssociation(Long associaId) {
        QueryWrapper<AlumniAssociation> query = new QueryWrapper<>();
        query.eq("associa_id", associaId);
        return baseMapper.selectById(associaId);
    }

    @Override
    public AlumniAssociation getAssociation(String address) {
        QueryWrapper<AlumniAssociation> query = new QueryWrapper<>();
        query.eq("address", address);
        List<AlumniAssociation> associations = baseMapper.selectList(query);
        return CollectionUtils.isEmpty(associations) ? null : associations.get(0);
    }

    @Override
    public List<OrgSortInfo> getOrgSort(Boolean flag) {
        return baseMapper.getOrgSort(flag);
    }
}
