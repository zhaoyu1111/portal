package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.entity.Donation;
import com.zy.portal.mapper.DonationMapper;
import com.zy.portal.service.DonationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-04-08
 */
@Service
public class DonationServiceImpl extends ServiceImpl<DonationMapper, Donation> implements DonationService {

    @Override
    public List<Donation> listDonation() {
        Page<Donation> page = new Page<>(1, 10);
        return baseMapper.selectPage(page, new QueryWrapper<>()).getRecords();
    }
}
