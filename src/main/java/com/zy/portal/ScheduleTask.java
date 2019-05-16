package com.zy.portal;

import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.zy.portal.entity.Activity;
import com.zy.portal.entity.ActivityUserApply;
import com.zy.portal.service.ActivityService;
import com.zy.portal.service.ActivityUserApplyService;
import com.zy.portal.util.PostEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
@Configuration
@EnableScheduling
public class ScheduleTask {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private ActivityUserApplyService activityUserApplyService;

    @Autowired
    private PostEmail postEmail;

    @Scheduled(cron = "59 59 23 * * ?")
    public void updateScheduledActivity() {
        List<Activity> activities =  activityService.batchGet();
        for (Activity activity : activities) {
            activity.setStatus(3);
        }
        activityService.updateBatchById(activities);
    }

    @Scheduled(cron = "1 0 0 * * ?")
    public void batchPostEmail() {
        List<Activity> activities =  activityService.getActivity();
        if(CollectionUtils.isEmpty(activities)) {
            return ;
        }
        List<Long> activityIds = activities.stream().map(Activity::getActivityId).distinct().collect(Collectors.toList());
        List<ActivityUserApply> apply = activityUserApplyService.getApply(activityIds);
        if(CollectionUtils.isEmpty(apply)) {
            return ;
        }
        List<String> emails = apply.stream().map(ActivityUserApply::getEmail).distinct().collect(Collectors.toList());
        postEmail.email("南昌航空大学校友会通知", "活动即将开始", emails);
    }
}
