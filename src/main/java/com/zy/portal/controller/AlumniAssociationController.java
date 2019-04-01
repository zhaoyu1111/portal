package com.zy.portal.controller;


import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.zy.portal.entity.AlumniAssociation;
import com.zy.portal.entity.User;
import com.zy.portal.service.AlumniAssociationService;
import com.zy.portal.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-03-31
 */
@Controller
@RequestMapping("/origin")
public class AlumniAssociationController {

    @Autowired
    private AlumniAssociationService alumniAssociationService;

    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String index(Model model) {
        List<AlumniAssociation> associations = alumniAssociationService.listAssocia();
        // TODO: 2019/3/31
        List<String> address = associations.stream().map(AlumniAssociation::getAddress).distinct().collect(Collectors.toList());

        model.addAttribute("associa", associations);
        return "org/org-institute";
    }

    @RequestMapping("/index")
    public String indexDetail(Model model, Long associaId) {
        AlumniAssociation association = alumniAssociationService.getAssociation(associaId);
        model.addAttribute("orgroom", association);
        List<User> users = userService.getUser(association.getAddress());
        Integer member = CollectionUtils.isEmpty(users) ? 0 : users.size();
        model.addAttribute("member", member);
        return "org/orgroom/orgroom-index";
    }

    @RequestMapping("/member")
    public String getMembers(String address, Model model) {
        model.addAttribute("orgroom", alumniAssociationService.getAssociation(address));
        List<User> users = userService.getUser(address);
        model.addAttribute("user", users);
        Integer member = CollectionUtils.isEmpty(users) ? 0 : users.size();
        model.addAttribute("member", member);
        return "org/orgroom/orgroom-member";
    }

    @RequestMapping("/directory")
    public String getDirectory(Model model, String address) {
        model.addAttribute("orgroom", alumniAssociationService.getAssociation(address));
        List<User> users = userService.getUser(address);
        model.addAttribute("user", users);
        Integer member = CollectionUtils.isEmpty(users) ? 0 : users.size();
        model.addAttribute("member", member);
        return "org/orgroom/orgroom-directory";
    }
}

