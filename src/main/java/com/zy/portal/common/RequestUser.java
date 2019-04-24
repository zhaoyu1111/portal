package com.zy.portal.common;

import com.zy.portal.entity.User;
import lombok.Data;

public class RequestUser {

    public static final ThreadLocal<User> currentUser = new ThreadLocal<>();

    public static void put(User user) {
        currentUser.set(user);
    }

    public static User getCurrentUser() {
        User user = currentUser.get();
        return user != null ? user : null;
    }

    public static void clear() {
        currentUser.remove();
    }

    @Data
    public static class ReqUser {
        private User user;
    }
}
