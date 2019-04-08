package com.zy.portal.dto;

import lombok.Data;

@Data
public class DonationDto {

    private Long donationId;

    private String avatar;

    private Long donationUid;
    private String donationName;

    private String grade;

    private Long utime;
}
