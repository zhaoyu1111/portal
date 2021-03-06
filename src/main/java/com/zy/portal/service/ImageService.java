package com.zy.portal.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zy.portal.entity.Image;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-04-17
 */
public interface ImageService extends IService<Image> {

    IPage<Image> listImage(Long albumId, Integer currentPage);
}
