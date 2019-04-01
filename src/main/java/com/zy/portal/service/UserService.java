package com.zy.portal.service;

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

}
