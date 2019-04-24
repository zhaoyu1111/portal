package com.zy.portal.controller;


import com.zy.portal.common.Anonymous;
import com.zy.portal.common.RequestUser;
import com.zy.portal.dto.ResumeDetail;
import com.zy.portal.entity.Resume;
import com.zy.portal.entity.User;
import com.zy.portal.service.DictionaryDataService;
import com.zy.portal.service.ResumeService;
import com.zy.portal.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-04-13
 */
@Controller
@RequestMapping("/resume")
public class ResumeController {

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private UserService userService;

    @Autowired
    private DictionaryDataService dictionaryDataService;

    @Anonymous
    @RequestMapping("")
    public String index(Model model) {
        model.addAttribute("salary", dictionaryDataService.listData("sl"));
        model.addAttribute("resume", resumeService.listResume(RequestUser.getCurrentUser().getStudentId()));
        return "my/recruit/resume-index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, Long resumeId) {
        Resume resume = resumeService.getResume(resumeId);
        if(null == resume) {
            model.addAttribute("resume", new ResumeDetail());
            return "my/recruit/resume-detail";
        }
        getDetail(model, resume);
        model.addAttribute("salary", dictionaryDataService.listData("sl"));
        model.addAttribute("gender", dictionaryDataService.listData("sex"));
        return "my/recruit/resume-detail";
    }

    @Anonymous
    @RequestMapping("addResume")
    public String addResume(Model model) {
        model.addAttribute("salary", dictionaryDataService.listData("sl"));
        return "my/recruit/resume-add";
    }

    private Model getDetail(Model model, Resume resume) {
        User user = userService.getUserInfo(resume.getStudentId());
        ResumeDetail detail = new ResumeDetail();
        BeanUtils.copyProperties(user, detail);
        BeanUtils.copyProperties(resume, detail);
        model.addAttribute("resume", detail);
        return model;
    }

    @Anonymous
    @RequestMapping("edit")
    public String edit(Model model, Long resumeId) {
        Resume resume = resumeService.getResume(resumeId);
        if(null == resume) {
            model.addAttribute("resume", new ResumeDetail());
            return "my/recruit/resume-detail";
        }
        model.addAttribute("salary", dictionaryDataService.listData("sl"));
        getDetail(model, resume);
        return "my/recruit/resume-edit";
    }

    @Anonymous
    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(ResumeDetail detail) {
        User user =  userService.selectById(RequestUser.getCurrentUser().getStudentId());
        Resume resume = new Resume();
        BeanUtils.copyProperties(detail, resume);
        resume.setStudentId(user.getStudentId());
        BeanUtils.copyProperties(detail, user);
        userService.insertOrUpdate(user);
        resumeService.insertOrUpdate(resume);
        return "redirect:/resume";
    }

    @Anonymous
    @RequestMapping("/delete")
    public String delete(Long resumeId) {
        resumeService.deleteById(resumeId);
        return "redirect:/resume";
    }
}

