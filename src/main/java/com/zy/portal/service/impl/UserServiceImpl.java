package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.dto.ClassUser;
import com.zy.portal.entity.User;
import com.zy.portal.mapper.UserMapper;
import com.zy.portal.service.UserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-03-30
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Override
    public List<User> getUsers(List<Long> studentIds) {
        if(CollectionUtils.isEmpty(studentIds)) {
            return null;
        }
        QueryWrapper<User> query = new QueryWrapper<>();
        query.in("student_id", studentIds);
        return baseMapper.selectList(query);
    }

    @Override
    public List<User> getUser(String address) {
        QueryWrapper<User> query = new QueryWrapper<>();
        query.eq("current_city", address);
        query.eq("status", 0);

        Page<User> userPage = new Page<>(1, 20);
        return baseMapper.selectPage(userPage, query).getRecords();
    }

    @Override
    public List<ClassUser> getClassUserNum(List<Long> classIds) {
        return baseMapper.getClassUserNum(classIds);
    }

    @Override
    public Integer getClassNum(Long classId) {
        QueryWrapper<User> query = new QueryWrapper<>();
        query.eq("class_id", classId);
        return selectCount(query);
    }

    @Override
    public List<User> listUser(Long classId) {
        QueryWrapper<User> query = new QueryWrapper<>();
        query.eq("class_id", classId);
        return baseMapper.selectList(query);
    }
}
