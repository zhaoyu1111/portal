package com.zy.portal.service;

import com.zy.portal.entity.Resume;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-04-13
 */
public interface ResumeService extends IService<Resume> {

    /**
     * 获取简历列表
     * @param studentId
     * @return
     */
    List<Resume> listResume(Long studentId);

    /**
     * 获取简历详情
     * @param resumeId
     * @return
     */
    Resume getResume(Long resumeId);

    /**
     * 获取简历信息
     * @param resumeIds
     * @return
     */
    List<Resume> getResume(List<Long> resumeIds);
}
