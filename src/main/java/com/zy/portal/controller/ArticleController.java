package com.zy.portal.controller;

import com.zy.portal.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.constraints.NotNull;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-03-27
 */
@Validated
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping("/detail")
    public String getArticle(Model model,  @NotNull(message = "文章丢失") Long articleId) {

        model.addAttribute("article", articleService.getArticle(articleId));
        return "news/news-detail";
    }

    @RequestMapping("/outline")
    public String getArticle(Model model) {
        model.addAttribute("news", articleService.getArticle(1));
        return "news/news-outline";
    }

    @RequestMapping("")
    public String articleIndex(Model model) {
        model.addAttribute("article", articleService.getArticle(1));
        return "news/news-index";
    }

    @RequestMapping("/donation")
    public String donation(Model model) {
        model.addAttribute("donation", articleService.listArticle(2L));
        return "donation/donation-index";
    }

    @RequestMapping("/donationDetail")
    public String doantionDetail(Model model, Long articleId) {
        model.addAttribute("donation", articleService.getArticle(articleId));
        return "donation/donation-detail";
    }

    @RequestMapping("/outstandAlumni")
    public String outstandAlumni(Model model) {
        model.addAttribute("alumni", articleService.listArticle(3L));
        return "alumni/alumni-index";
    }

    @RequestMapping("/newsOutline")
    public String newsOutline(Model model) {
        model.addAttribute("hotnews", articleService.getArticle());
        return "news/news-outline";
    }
}

