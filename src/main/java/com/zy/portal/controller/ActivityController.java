package com.zy.portal.controller;


import com.zy.portal.entity.ActivityUserApply;
import com.zy.portal.entity.User;
import com.zy.portal.service.ActivityService;
import com.zy.portal.service.ActivityUserApplyService;
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
 * @since 2019-04-02
 */
@Controller
@RequestMapping("/activity")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ActivityUserApplyService activityUserApplyService;

    @RequestMapping("")
    public String index(Model model) {
        model.addAttribute("activity", activityService.listActivity(1, null).getRecords());
        return "activity/activity-index";
    }

    @RequestMapping("/detail")
    public String activityDetail(HttpSession session, Model model, Long activityId) {
        model.addAttribute("detail", activityService.getActivity(activityId));
        User user = (User) session.getAttribute("SESSION_USER");
        if(null != user) {
            model.addAttribute("apply", activityUserApplyService.getApply(user.getStudentId(), activityId));
        }
        return "activity/activity-detail";
    }

    @RequestMapping("/outline")
    public String getOutline(Model model, Long activityId) {
        model.addAttribute("outline", activityService.listActivity(1, activityId).getRecords());
        return "activity/activity-outline";
    }

    @RequestMapping("/apply")
    public String apply(RedirectAttributes attributes, Long activityId, String mobile, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        ActivityUserApply apply = new ActivityUserApply();
        apply.setActivityId(activityId);
        apply.setUserId(user.getStudentId());
        apply.setMobile(mobile);
        apply.setActivityCode((Math.random()*9+1)*100000 + "");
        activityUserApplyService.insert(apply);
        activityService.updateSignNumber(activityId);
        attributes.addAttribute("activityId", activityId);
        return "redirect:/activity/detail";
    }
}

