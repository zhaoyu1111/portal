package com.zy.portal.controller;


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

    @RequestMapping("")
    public String index(Model model, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        model.addAttribute("salary", dictionaryDataService.listData("sl"));
        model.addAttribute("resume", resumeService.listResume(user.getStudentId()));
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

    @RequestMapping("addResume")
    public String addResume(Model model, HttpSession session) {
        if(null == session.getAttribute("SESSION_USER")) {
            return "redirect:/login";
        }
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

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Model model, HttpSession session, ResumeDetail detail) {
        User user =  (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        Resume resume = new Resume();
        BeanUtils.copyProperties(detail, resume);
        resume.setStudentId(user.getStudentId());
        BeanUtils.copyProperties(detail, user);
        userService.insertOrUpdate(user);
        resumeService.insertOrUpdate(resume);
        return "redirect:/resume";
    }

    @RequestMapping("/delete")
    public String delete(Long resumeId) {
        resumeService.deleteById(resumeId);
        return "redirect:/resume";
    }
}

