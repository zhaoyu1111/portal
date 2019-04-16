package com.zy.portal.controller;


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
 * @since 2019-03-29
 */
@Controller
@RequestMapping("/recruitUnit")
public class RecruitUnitController {

    @RequestMapping("/queryMyUnit")
    public String queryMyUnit(Model model, HttpSession session) {
        return "my/recruit/unit-detail";
    }
}

