package com.zy.portal.mapper;

import com.zy.portal.dto.ClassInfo;
import com.zy.portal.dto.ClassUser;
import com.zy.portal.entity.Class;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zy
 * @since 2019-04-01
 */
@Mapper
public interface ClassMapper extends BaseMapper<Class> {

    List<ClassInfo> listGrade();

}
