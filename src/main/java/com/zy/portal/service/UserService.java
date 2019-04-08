package com.zy.portal.service;

import com.zy.portal.dto.ClassUser;
import com.zy.portal.entity.User;
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
public interface UserService extends IService<User> {

    /**
     * 获取用户信息
     * @param studentId
     * @return
     */
    List<User> getUsers(List<Long> studentId);

    /**
     * 获取用户列表
     * @return
     */
    List<User> getUser(String address);

    /**
     * 获取班级人数
     * @param classIds
     * @return
     */
    List<ClassUser> getClassUserNum(List<Long> classIds);

    /**
     * 获取班级总人数
     * @param classId
     * @return
     */
    Integer getClassNum(Long classId);

    /**
     * 获取班级用户
     * @param classId
     * @return
     */
    List<User> listUser(Long classId);

    /**
     * 登录验证
     * @param studentId
     * @param password
     * @return
     */
    User validateUser(String studentId);

    /**
     * 获取用户信息
     * @param studentId
     * @return
     */
    User getUserInfo(Long studentId);

    /**
     * 更新邮箱信息
     * @param user
     */
    void updateEmail(User user);

    /**
     * 修改密码
     * @param user
     */
    void updatePassword(User user);
}
