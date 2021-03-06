package com.zy.portal.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.zy.portal.common.Anonymous;
import com.zy.portal.common.MyPage;
import com.zy.portal.common.RequestUser;
import com.zy.portal.dto.RecruitApplyInfo;
import com.zy.portal.dto.RecruitDetail;
import com.zy.portal.entity.*;
import com.zy.portal.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    @Autowired
    private DictionaryDataService dictionaryDataService;

    @Autowired
    private UserJobService userJobService;

    @Autowired
    private ResumeService resumeService;

    @RequestMapping("")
    public String index(Model model,@RequestParam(defaultValue = "1") Integer currentPage) {
        IPage<Recruit> recruitIPage = recruitService.queryRecruit(currentPage);
        List<Recruit> recruits = recruitIPage.getRecords();
        if(CollectionUtils.isEmpty(recruits)) {
            model.addAttribute("page", new Page<>());
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
        IPage<RecruitDetail> detailIPage = new Page<>();
        detailIPage.setRecords(details);
        detailIPage.setTotal(recruitIPage.getTotal());
        detailIPage.setCurrent(recruitIPage.getCurrent());
        detailIPage.setSize(recruitIPage.getSize());
        model.addAttribute("page", detailIPage);
        return "recruit/recruit-index";
    }

    @RequestMapping("/detailRecruit")
    public String getRecruit(Model model, Long recuritId, HttpSession session) {
        Recruit recruit = recruitService.getRecruit(recuritId);
        model.addAttribute("recruit", new RecruitDetail());
        if(null == recruit) {
            return "recruit/recruit-detail";
        }
        RecruitUnit unit = recruitUnitService.getRecruitUnit(recruit.getUnitId());

        RecruitDetail detail = new RecruitDetail();
        BeanUtils.copyProperties(unit, detail);
        detail.setUnitStatus(unit.getStatus());
        BeanUtils.copyProperties(recruit, detail);
        detail.setJobStatus(recruit.getStatus());
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
        User user = (User) session.getAttribute("SESSION_USER");
        if(null != user) {
            model.addAttribute("resume", resumeService.listResume(user.getStudentId()));
        }
        return "recruit/recruit-detail";
    }

    @Anonymous
    @RequestMapping("/queryUserRecruit")
    public String queryUserRecruit(Model model) {
        model.addAttribute("myrecruit", recruitService.queryRecruit(RequestUser.getCurrentUser().getStudentId(), 1).getRecords());
        return "my/recruit/recruit-index";
    }

    @RequestMapping("/delete")
    public String delete(Long recuritId) {
        recruitService.deleteRecruit(recuritId);
        return "redirect:/my/recruit/recruit-index";
    }

    @Anonymous
    @RequestMapping("/add")
    public String addRecruit(Model model) {
        UserJob job = userJobService.getUserJob(RequestUser.getCurrentUser().getStudentId(), true);
        if(null == job) {
            return "forward:/recruitUnit/add";
        }
        model.addAttribute("salary", dictionaryDataService.listData("sl"));
        model.addAttribute("benefit", dictionaryDataService.listData("be"));
        return "recruit/recruit-add";
    }

    @Anonymous
    @RequestMapping("/addRecruit")
    public String addRecruit(Recruit recruit) {
        Long studentId = RequestUser.getCurrentUser().getStudentId();
        UserJob job = userJobService.selectById(studentId);
        if(null == job) {
            return "forward:/recruitUnit/add";
        }
        recruit.setUnitId(job.getUnitId());
        recruit.setUserId(studentId);
        recruit.setStatus(1);
        recruit.setDeleted(1);
        recruitService.insert(recruit);
        return "redirect:/recruit/recruitSuccess";
    }

    @RequestMapping("/recruitSuccess")
    public String recruitSuccess(Model model) {
        model.addAttribute("_message","提交成功，等待审核！");
        return "recruit/recruit-success";
    }

}

