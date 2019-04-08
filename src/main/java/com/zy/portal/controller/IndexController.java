package com.zy.portal.controller;

import com.zy.portal.service.ActivityService;
import com.zy.portal.service.ArticleService;
import com.zy.portal.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private RecruitService recruitService;

    @Autowired
    private ActivityService activityService;

    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("article", articleService.getArticle(1));
        model.addAttribute("recruit", recruitService.queryRecruit(1).getRecords());
        model.addAttribute("activity", activityService.listActivity(1, null).getRecords());
        return "portal-main/index";
    }

}
