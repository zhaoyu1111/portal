package com.zy.portal.controller;


import com.zy.portal.entity.Class;
import com.zy.portal.entity.User;
import com.zy.portal.service.ClassService;
import com.zy.portal.service.UserService;
import com.zy.portal.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/login")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ClassService classService;

    @RequestMapping("")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/val", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> loginVal(HttpSession session, String studentId, String password) {
        Map<String, Object> rs = new HashMap<>();
        password = MD5Utils.encode(password);
        System.out.println(password);
        User user = userService.validateUser(studentId);
        if(null != user) {
            if(user.getPwd().equals(password)) {
                rs.put("msg", "OK");
                session.setAttribute("SESSION_USER", user);
                return rs;
            }else {
                rs.put("msg", "密码错误");
                rs.put("type", "p");
                return rs;
            }
        }else {
            rs.put("msg", "用户名不存在");
            rs.put("type", "a");
            return rs;
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("SESSION_USER");
        return "portal-main/index";
    }

    @RequestMapping("/basic")
    public String basic(Model model, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "portal-main/index";
        }
        model.addAttribute("info", userService.getUserInfo(user.getStudentId()));
        return "my/profile/profile-basic";
    }

    @RequestMapping("/account")
    public String account(Model model, HttpSession session) {
        User user = (User)session.getAttribute("SESSION_USER");
        if(null == user) {
            return "portal-main/index";
        }
        model.addAttribute("account", userService.getUserInfo(user.getStudentId()));
        return "my/account/account-index";
    }

    @RequestMapping("/password")
    public String password() {
        return "my/account/account-password";
    }

    @RequestMapping("/updatePwd")
    public String updatePwd(Model model, HttpSession session, String password, String confirmPwd, String oldPwd) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        if(!user.getPwd().equals(MD5Utils.encode(oldPwd))) {
            model.addAttribute("old", "原始密码错误");
        }else if(!confirmPwd.equals(password)){
            model.addAttribute("confirm", "两次输入不一致");
        }else {
            user.setPwd(MD5Utils.encode(password));
            userService.updatePassword(user);
        }
        return "my/account/account-password";
    }

    @RequestMapping("/email")
    public String email() {
        return "my/account/account-email";
    }

    @RequestMapping("/updateEmail")
    public String updateEmail(HttpSession session, String email) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        return "redirect:/login/account";
    }

    @RequestMapping("/class")
    public String myClass(HttpSession session, Model model) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            model.addAttribute("myclass", new Class());
        }
        Class myClass = classService.getClass(user.getClassId());
        model.addAttribute("myclass", myClass);
        model.addAttribute("count", userService.getClassNum(user.getClassId()));
        return "my/class/class-index";
    }
}

