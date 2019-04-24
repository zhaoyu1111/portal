package com.zy.portal.mapper;

import com.zy.portal.dto.OrgSortInfo;
import com.zy.portal.entity.AlumniAssociation;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zy
 * @since 2019-03-31
 */
@Mapper
public interface AlumniAssociationMapper extends BaseMapper<AlumniAssociation> {

    List<OrgSortInfo> getOrgSort(@Param("flag") Boolean flag);
}
