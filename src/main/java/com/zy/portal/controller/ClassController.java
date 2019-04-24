package com.zy.portal.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.zy.portal.dto.ClassList;
import com.zy.portal.dto.ClassUser;
import com.zy.portal.dto.UserDto;
import com.zy.portal.entity.Class;
import com.zy.portal.entity.RecruitUnit;
import com.zy.portal.entity.User;
import com.zy.portal.entity.UserJob;
import com.zy.portal.service.ClassService;
import com.zy.portal.service.RecruitUnitService;
import com.zy.portal.service.UserJobService;
import com.zy.portal.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
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

    @Autowired
    private UserJobService userJobService;

    @Autowired
    private RecruitUnitService recruitUnitService;

    @RequestMapping("")
    public String index(Model model) {
        model.addAttribute("grade", classService.listGrade());
        return "class/class-index";
    }

    @RequestMapping("/outline")
    public String outline(Model model, HttpSession session) {
        model.addAttribute("classCount", classService.getClassCount());
        model.addAttribute("userCount", userService.getClassUserCount());
        model.addAttribute("sortClass", userService.sortClassUser());
        User user = (User) session.getAttribute("SESSION_USER");
        if(null != user) {
            model.addAttribute("myClass", classService.selectById(user.getClassId()));
        }
        return "class/class-outline";
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
    public String getMember(Model model, Long classId, @RequestParam(defaultValue = "1") Integer currentPage) {
        commonModel(model, classId);
        model.addAttribute("page", userService.listUser(classId, currentPage));
        return "class/classroom/classroom-member";
    }

    @RequestMapping("/directory")
    public String getDirectory(Long classId, Model model, @RequestParam(defaultValue = "1") Integer currentPage) {
        commonModel(model, classId);

        IPage<User> userIPage = userService.listUser(classId, currentPage);
        List<User> users = userIPage.getRecords();

        List<Long> studentIds = users.stream().map(User::getStudentId).distinct().collect(Collectors.toList());
        List<UserJob> job = userJobService.getUserJob(studentIds);
        Map<Long, UserJob> jobMap = Maps.newHashMap();
        job.forEach(userJob -> jobMap.put(userJob.getStudentId(), userJob));

        List<Long> unitIds = job.stream().map(UserJob::getUnitId).distinct().collect(Collectors.toList());
        List<RecruitUnit> units = recruitUnitService.listUnit(unitIds);
        Map<Long, String> unitMap = Maps.newHashMap();
        units.forEach(unit -> unitMap.put(unit.getUnitId(), unit.getUnitName()));

        List<UserDto> userDtos = Lists.newArrayList();
        for (User user : users) {
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(user, userDto);
            UserJob userJob = jobMap.get(user.getStudentId());
            if(null != userJob) {
                userDto.setJobName(userJob.getJobName());
                userDto.setUnitName(unitMap.get(userJob.getUnitId()));
            }
            userDtos.add(userDto);
        }

        IPage<UserDto> iPage = new Page<>();
        iPage.setRecords(userDtos);
        iPage.setTotal(userIPage.getTotal());
        iPage.setSize(userIPage.getSize());
        iPage.setCurrent(userIPage.getCurrent());

        model.addAttribute("page", iPage);
        return "class/classroom/classroom-directory";
    }

    private Model commonModel(Model model, Long classId) {
        model.addAttribute("classInfo", classService.getClass(classId));
        model.addAttribute("classCount", userService.getClassNum(classId));
        return model;
    }
}

