package com.zy.portal.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zy.portal.common.Anonymous;
import com.zy.portal.entity.Activity;
import com.zy.portal.entity.ActivityUserApply;
import com.zy.portal.entity.User;
import com.zy.portal.service.ActivityService;
import com.zy.portal.service.ActivityUserApplyService;
import com.zy.portal.util.PostEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
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

    @Autowired
    private PostEmail postEmail;

    @RequestMapping("")
    public String index(Model model,@RequestParam(defaultValue = "1") Integer currentPage) {
        model.addAttribute("page", activityService.listActivity(currentPage, null));
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

    @Anonymous
    @RequestMapping("/apply")
    public String apply(RedirectAttributes attributes, Long activityId, String mobile, String email, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        ActivityUserApply apply = new ActivityUserApply();
        apply.setActivityId(activityId);
        apply.setUserId(user.getStudentId());
        apply.setMobile(mobile);
        String activityCode = (int)(Math.random()*9+1)*100000 + "";
        apply.setActivityCode(activityCode);
        apply.setEmail(email);
        activityUserApplyService.insert(apply);
        activityService.updateSignNumber(activityId);
        attributes.addAttribute("activityId", activityId);
        postEmail.email("南昌航空大学活动通知", activityCode , email);

        return "redirect:/activity/detail";
    }
}

