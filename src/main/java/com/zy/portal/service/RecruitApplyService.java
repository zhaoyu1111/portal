package com.zy.portal.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zy.portal.entity.RecruitApply;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-03-30
 */
public interface RecruitApplyService extends IService<RecruitApply> {

    /**
     * 获取职位申请列表
     * @param recuritId
     * @param unitId
     * @return
     */
    List<RecruitApply> listApplys(Long recuritId, Long unitId);

    /**
     * 分页查询职位申请
     * @param currentPage
     * @return
     */
    IPage<RecruitApply> queryRecruitApply(Integer currentPage);
}
