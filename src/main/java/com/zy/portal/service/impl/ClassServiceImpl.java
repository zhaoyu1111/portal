package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.portal.dto.ClassInfo;
import com.zy.portal.entity.Class;
import com.zy.portal.mapper.ClassMapper;
import com.zy.portal.service.ClassService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-04-01
 */
@Service
public class ClassServiceImpl extends ServiceImpl<ClassMapper, Class> implements ClassService {

    @Override
    public List<ClassInfo> listGrade() {
        return baseMapper.listGrade();
    }

    @Override
    public List<Class> queryClass(String className, String grade) {
        QueryWrapper<Class> query = new QueryWrapper<>();
        if(StringUtils.isNotEmpty(className)) {
            query.like("class_name", className);
        }
        if(StringUtils.isNotEmpty(grade)) {
            query.eq("grade", grade);
        }
        return baseMapper.selectList(query);
    }

    @Override
    public Class getClass(Long classId) {
        QueryWrapper<Class> query = new QueryWrapper<>();
        query.eq("class_id", classId);
        return baseMapper.selectOne(query);
    }

    @Override
    public Integer getClassCount() {
        return baseMapper.selectCount(new QueryWrapper<>());
    }
}
