package com.zy.portal.service;

import com.zy.portal.entity.Donation;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-04-08
 */
public interface DonationService extends IService<Donation> {

    /**
     * 获取捐赠列表
     * @return
     */
    List<Donation> listDonation();
}
