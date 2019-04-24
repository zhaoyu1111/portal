package com.zy.portal.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.zy.portal.common.Anonymous;
import com.zy.portal.common.MyPage;
import com.zy.portal.common.RequestUser;
import com.zy.portal.dto.RecruitApplyInfo;
import com.zy.portal.dto.RecruitPostInfo;
import com.zy.portal.entity.Recruit;
import com.zy.portal.entity.RecruitApply;
import com.zy.portal.entity.Resume;
import com.zy.portal.entity.User;
import com.zy.portal.service.RecruitApplyService;
import com.zy.portal.service.RecruitService;
import com.zy.portal.service.ResumeService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/apply")
public class RecruitApplyController {

    @Autowired
    private RecruitApplyService recruitApplyService;

    @Autowired
    private ResumeService resumeService;

    @Autowired
    private RecruitService recruitService;

    @RequestMapping("")
    public String index(Model model,@RequestParam(defaultValue = "1") Integer currentPage) {
        IPage<RecruitApply> applyIPage = recruitApplyService.queryRecruitApply(currentPage);
        List<RecruitApply> applies = applyIPage.getRecords();
        if(CollectionUtils.isEmpty(applies)) {
            model.addAttribute("page", new MyPage<>());
            return "my/recruit/recruit-post";
        }

        List<Long> recruitIds = applies.stream().map(RecruitApply::getRecuritId).distinct().collect(Collectors.toList());
        List<Recruit> recruits = recruitService.getRecruit(recruitIds);
        Map<Long, Recruit> recruitMap = Maps.newHashMap();
        recruits.forEach(recruit -> recruitMap.put(recruit.getRecuritId(), recruit));

        List<Long> resumeIds = applies.stream().map(RecruitApply::getResumeId).distinct().collect(Collectors.toList());
        List<Resume> resumes = resumeService.getResume(resumeIds);
        Map<Long, Resume> resumeMap = Maps.newHashMap();
        resumes.forEach(resume -> resumeMap.put(resume.getResumeId(), resume));

        List<RecruitPostInfo> infos = Lists.newArrayList();
        for (RecruitApply apply : applies) {
            RecruitPostInfo info = new RecruitPostInfo();
            Recruit recruit = recruitMap.get(apply.getRecuritId());
            if(null != recruit) {
                BeanUtils.copyProperties(recruit, info);
            }
            Resume resume = resumeMap.get(apply.getResumeId());
            if(null != resume) {
                info.setResumeTitle(resume.getResumeTitle());
                info.setResumeId(resume.getResumeId());
            }
            infos.add(info);
        }
        model.addAttribute("page", new MyPage<>(applyIPage.getTotal(), infos));
        return "my/recruit/resume-posted";
    }

    @Anonymous
    @RequestMapping("/postRecruit")
    public String postRecruit(RedirectAttributes attributes, RecruitApply apply) {
        apply.setStudentId(RequestUser.getCurrentUser().getStudentId());
        recruitApplyService.insert(apply);
        attributes.addAttribute("recuritId", apply.getRecuritId());
        return "redirect:/recruit/detailRecruit";
    }
}

