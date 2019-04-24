package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.dto.ClassUser;
import com.zy.portal.dto.UserClassInfo;
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
    public IPage<User> getUser(String address, Integer currentPage) {
        QueryWrapper<User> query = new QueryWrapper<>();
        query.like("current_city", address);
        query.eq("status", 0);

        Page<User> userPage = new Page<>(currentPage, 12);
        return baseMapper.selectPage(userPage, query);
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
    public IPage<User> listUser(Long classId, Integer currentPage) {
        QueryWrapper<User> query = new QueryWrapper<>();
        Page<User> page = new Page<>(currentPage, 12);
        query.eq("class_id", classId);
        return baseMapper.selectPage(page, query);
    }

    @Override
    public User validateUser(String studentId) {
        return baseMapper.selectById(studentId);
    }

    @Override
    public User getUserInfo(Long studentId) {
        return baseMapper.selectById(studentId);
    }

    @Override
    public void updateEmail(User user) {
        baseMapper.updateById(user);
    }

    @Override
    public void updatePassword(User user) {
        baseMapper.updateById(user);
    }

    @Override
    public Integer getUserCount() {
        QueryWrapper<User> query = new QueryWrapper<>();
        query.isNotNull("current_city");
        return baseMapper.selectCount(query);
    }

    @Override
    public Integer getClassUserCount() {
        QueryWrapper<User> query = new QueryWrapper<>();
        query.isNotNull("class_id");
        return baseMapper.selectCount(query);
    }

    @Override
    public List<UserClassInfo> sortClassUser() {
        return baseMapper.sortClassUser();
    }
}
