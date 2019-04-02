package com.zy.portal.mapper;

import com.zy.portal.dto.ClassUser;
import com.zy.portal.entity.User;
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
 * @since 2019-03-30
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * 获取班级人数
     * @param classids
     * @return
     */
    List<ClassUser> getClassUserNum(@Param("classIds") List<Long> classids);
}
