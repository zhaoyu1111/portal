package com.zy.portal.service;

import com.zy.portal.entity.RecruitUnit;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-03-29
 */
public interface RecruitUnitService extends IService<RecruitUnit> {

    /**
     * 获取公司信息
     * @param unitId
     * @return
     */
    RecruitUnit getRecruitUnit(Long unitId);
}
