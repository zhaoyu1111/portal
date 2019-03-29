package com.zy.portal.controller;

import com.zy.portal.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/index")
    public String index(Model model) {
        model.addAttribute("article", articleService.getArticle(1));
        return "portal-main/index";
    }

}
