package com.zy.portal.controller;


import com.zy.portal.entity.RecruitUnit;
import com.zy.portal.entity.User;
import com.zy.portal.entity.UserJob;
import com.zy.portal.service.DictionaryDataService;
import com.zy.portal.service.RecruitUnitService;
import com.zy.portal.service.UserJobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-03-29
 */
@Controller
@RequestMapping("/recruitUnit")
public class RecruitUnitController {

    @Autowired
    private DictionaryDataService dictionaryDataService;

    @Autowired
    private RecruitUnitService recruitUnitService;

    @Autowired
    private UserJobService userJobService;

    @RequestMapping("/queryMyUnit")
    public String queryMyUnit(Model model, HttpSession session) {
        return "my/recruit/unit-detail";
    }

    @RequestMapping("/add")
    public String add(Model model, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        model.addAttribute("industry", dictionaryDataService.listData("ind"));
        model.addAttribute("property", dictionaryDataService.listData("pro"));
        model.addAttribute("scale", dictionaryDataService.listData("sca"));
        UserJob userJob = userJobService.getUserJob(user.getStudentId(), false);
        if(null != userJob) {
            model.addAttribute("job", userJob);
            model.addAttribute("unit", recruitUnitService.getRecruitUnit(userJob.getUnitId()));
        }
        return "recruit/unit/unit-add";
    }

    @RequestMapping("/addUnit")
    public String addUnit(RedirectAttributes attributes, HttpSession session,
                          RecruitUnit unit, UserJob userJob) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        unit.setStatus(1);
        unit.setDeleted(1);
        recruitUnitService.insertOrUpdate(unit);
        attributes.addAttribute("unitId", unit.getUnitId());

        userJob.setUnitId(unit.getUnitId());
        userJob.setStudentId(user.getStudentId());
        userJob.setStatus(1);
        userJobService.insertOrUpdate(userJob);
        return "redirect:/recruitUnit/add";
    }
}

