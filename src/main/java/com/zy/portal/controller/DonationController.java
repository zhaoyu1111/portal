package com.zy.portal.controller;


import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.zy.portal.dto.DonationDto;
import com.zy.portal.entity.Donation;
import com.zy.portal.entity.User;
import com.zy.portal.service.DonationService;
import com.zy.portal.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-04-08
 */
@Controller
@RequestMapping("/donation")
public class DonationController {

    @Autowired
    private DonationService donationService;

    @Autowired
    private UserService userService;

    @RequestMapping("/outline")
    public String outline(Model model) {
        List<Donation> donations = donationService.listDonation();

        List<Long> userIds = donations.stream().map(Donation::getDonationUid).distinct().collect(Collectors.toList());
        List<User> users = userService.getUsers(userIds);
        Map<Long, User> userMap = Maps.newHashMap();
        users.forEach(user -> userMap.put(user.getStudentId(), user));

        List<DonationDto> donationDtos = Lists.newArrayList();
        for (Donation donation : donations) {
            DonationDto dto = new DonationDto();
            BeanUtils.copyProperties(donation, dto);
            User user = userMap.get(donation.getDonationUid());
            if(null != user) {
                dto.setGrade(user.getStudentId().toString().substring(0, 2));
                dto.setAvatar(user.getAvatar());
                dto.setDonationName(user.getUserName());
            }
            donationDtos.add(dto);
        }

        model.addAttribute("detail", donationDtos);
        return "donation/donation-outline";
    }
}

