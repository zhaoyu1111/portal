package com.zy.portal.service;

import com.zy.portal.entity.RecruitUnit;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

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

    /**
     * 查询公司列表
     * @param unitIds
     * @return
     */
    List<RecruitUnit> listUnit(List<Long> unitIds);

    List<RecruitUnit> listUnit();

    void saveUnit(RecruitUnit unit);
}
