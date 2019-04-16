package com.zy.portal.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zy.portal.entity.Recruit;
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
public interface RecruitService extends IService<Recruit> {

    /**
     * 分页查询招聘信息
     * @param currentPage
     * @return
     */
    IPage<Recruit> queryRecruit(Integer currentPage);

    /**
     * 获取招聘信息
     * @param recruitId
     * @return
     */
    Recruit getRecruit(Long recruitId);

    /**
     * 获取职位列表
     * @return
     */
    List<Recruit> listRecruit(Long unitId, Long recuritId);

    /**
     * 查询我发布的职位
     * @param userId
     * @param currentPage
     * @return
     */
    IPage<Recruit> queryRecruit(Long userId, Integer currentPage);

    /**
     * 删除职位信息
     * @param recuritId
     */
    void deleteRecruit(Long recuritId);

    /**
     * 获取职位信息
     * @param recruitIds
     * @return
     */
    List<Recruit> getRecruit(List<Long> recruitIds);
}
