package com.zy.portal.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.zy.portal.common.MyPage;
import com.zy.portal.dto.RecruitApplyInfo;
import com.zy.portal.dto.RecruitDetail;
import com.zy.portal.entity.Recruit;
import com.zy.portal.entity.RecruitApply;
import com.zy.portal.entity.RecruitUnit;
import com.zy.portal.entity.User;
import com.zy.portal.service.RecruitApplyService;
import com.zy.portal.service.RecruitService;
import com.zy.portal.service.RecruitUnitService;
import com.zy.portal.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-03-29
 */
@Controller
@RequestMapping("/recruit")
public class RecruitController {

    @Autowired
    private RecruitService recruitService;

    @Autowired
    private RecruitUnitService recruitUnitService;

    @Autowired
    private RecruitApplyService recruitApplyService;

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String index(Model model) {
        IPage<Recruit> recruitIPage = recruitService.queryRecruit(1);
        List<Recruit> recruits = recruitIPage.getRecords();
        if(CollectionUtils.isEmpty(recruits)) {
            model.addAttribute("page", new MyPage<>());
            return "recruit/recruit-index";
        }
        List<Long> unitIds = recruits.stream().map(Recruit::getUnitId).distinct().collect(Collectors.toList());
        List<RecruitUnit> units = recruitUnitService.listUnit(unitIds);
        Map<Long, RecruitUnit> unitMap = Maps.newHashMap();
        units.forEach(recruitUnit -> unitMap.put(recruitUnit.getUnitId(), recruitUnit));

        List<RecruitDetail> details = Lists.newArrayList();
        for (Recruit recruit : recruits) {
            RecruitDetail detail = new RecruitDetail();
            BeanUtils.copyProperties(recruit, detail);
            RecruitUnit unit = unitMap.get(recruit.getUnitId());
            if(null != unit){
                detail.setUnitName(unit.getUnitName());
            }
            details.add(detail);
        }
        model.addAttribute("page", new MyPage<RecruitDetail>(recruitIPage.getTotal(), details));
        return "recruit/recruit-index";
    }

    @RequestMapping("/detailRecruit")
    public String getRecruit(Model model, @NotNull(message = "招聘信息丢失") Long recuritId) {
        Recruit recruit = recruitService.getRecruit(recuritId);
        model.addAttribute("recruit", new RecruitDetail());
        if(null == recruit) {
            return "recruit/recruit-detail";
        }
        RecruitUnit unit = recruitUnitService.getRecruitUnit(recruit.getUnitId());

        RecruitDetail detail = new RecruitDetail();
        BeanUtils.copyProperties(unit, detail);
        BeanUtils.copyProperties(recruit, detail);
        model.addAttribute("recruit", detail);
        List<RecruitApplyInfo> infos = Lists.newArrayList();
        List<RecruitApply> applys = recruitApplyService.listApplys(recruit.getRecuritId(), recruit.getUnitId());
        if(CollectionUtils.isNotEmpty(applys)) {
            List<Long> studentIds = applys.stream().map(RecruitApply::getStudentId).distinct().collect(Collectors.toList());
            List<User> users = userService.getUsers(studentIds);
            Map<Long, User> userMap = Maps.newHashMap();
            users.forEach(user -> userMap.put(user.getStudentId(), user));

            for (RecruitApply apply : applys) {
                RecruitApplyInfo info = new RecruitApplyInfo();
                BeanUtils.copyProperties(apply, info);
                User user = userMap.get(apply.getStudentId());
                if(null != user) {
                    info.setAvatar(user.getAvatar());
                    info.setUserName(user.getUserName());
                }
                infos.add(info);
            }
        }
        model.addAttribute("otherRecruit", recruitService.listRecruit(recruit.getUnitId(), recruit.getRecuritId()));
        model.addAttribute("applyUser", infos);
        return "recruit/recruit-detail";
    }

    @RequestMapping("/queryUserRecruit")
    public String queryUserRecruit(Model model, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        model.addAttribute("myrecruit", recruitService.queryRecruit(user.getStudentId(), 1).getRecords());
        return "my/recruit/recruit-index";
    }

    @RequestMapping("/delete")
    public String delete(Long recuritId) {
        recruitService.deleteRecruit(recuritId);
        return "redirect:/my/recruit/recruit-index";
    }
}

