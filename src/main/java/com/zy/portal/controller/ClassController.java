package com.zy.portal.controller;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.zy.portal.dto.ClassList;
import com.zy.portal.dto.ClassUser;
import com.zy.portal.entity.Class;
import com.zy.portal.service.ClassService;
import com.zy.portal.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-04-01
 */
@Controller
@RequestMapping("/class")
public class ClassController {

    @Autowired
    private ClassService classService;

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String index(Model model) {
        model.addAttribute("grade", classService.listGrade());
        return "class/class-index";
    }

    @RequestMapping("/queryClasses")
    public String queryClass(Model model, String className, String grade) {
        List<Class> classes = classService.queryClass(className, grade);
        List<Long> classIds = classes.stream().map(Class::getClassId).distinct().collect(Collectors.toList());
        List<ClassUser> users = userService.getClassUserNum(classIds);
        Map<Long, Integer> userCount = Maps.newHashMap();
        users.forEach(classUser -> userCount.put(classUser.getClassId(), classUser.getClassNum()));

        List<ClassList> lists = Lists.newArrayList();
        for (Class aClass : classes) {
            ClassList classList = new ClassList();
            BeanUtils.copyProperties(aClass, classList);
            classList.setClassNum(userCount.get(aClass.getClassId()));
            lists.add(classList);
        }
        model.addAttribute("classes", lists);
        model.addAttribute("query", className);
        model.addAttribute("grade", grade);
        return "class/class-query";
    }

    @RequestMapping("/classDetail")
    public String classDetail(Model model, Long classId) {
        commonModel(model, classId);
        return "class/classroom/classroom-index";
    }

    @RequestMapping("/member")
    public String getMember(Model model, Long classId) {
        commonModel(model, classId);
        model.addAttribute("user", userService.listUser(classId));
        return "class/classroom/classroom-member";
    }

    @RequestMapping("/directory")
    public String getDirectory(Long classId, Model model) {
        commonModel(model, classId);
        model.addAttribute("user", userService.listUser(classId));
        return "class/classroom/classroom-directory";
    }

    private Model commonModel(Model model, Long classId) {
        model.addAttribute("classInfo", classService.getClass(classId));
        model.addAttribute("classCount", userService.getClassNum(classId));
        return model;
    }
}

