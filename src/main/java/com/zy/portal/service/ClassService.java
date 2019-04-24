package com.zy.portal.service;

import com.zy.portal.dto.ClassInfo;
import com.zy.portal.entity.Class;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-04-01
 */
public interface ClassService extends IService<Class> {

    /**
     * 获取年级列表
     * @return
     */
    List<ClassInfo> listGrade();

    /**
     * 模糊查询班级信息
     * @param className
     * @return
     */
    List<Class> queryClass(String className, String grade);

    /**
     * 获取班级信息
     * @param classId
     * @return
     */
    Class getClass(Long classId);

    Integer getClassCount();
}
