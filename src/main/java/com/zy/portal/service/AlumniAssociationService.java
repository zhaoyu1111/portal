package com.zy.portal.service;

import com.zy.portal.dto.AlumniAssociaIndex;
import com.zy.portal.dto.OrgSortInfo;
import com.zy.portal.entity.AlumniAssociation;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-03-31
 */
public interface AlumniAssociationService extends IService<AlumniAssociation> {

    /**
     * 获取组织列表
     * @return
     */
    List<AlumniAssociation> listAssocia();

    /**
     * 获取校友会信息
     * @param assocaitId
     * @return
     */
    AlumniAssociation getAssociation(Long assocaitId);

    /**
     * 获取校友会信息
     * @param address
     * @return
     */
    AlumniAssociation getAssociation(String address);

    List<OrgSortInfo> getOrgSort(Boolean flag);
}
