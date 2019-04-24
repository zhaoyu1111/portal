package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.entity.Image;
import com.zy.portal.mapper.ImageMapper;
import com.zy.portal.service.ImageService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-04-17
 */
@Service
public class ImageServiceImpl extends ServiceImpl<ImageMapper, Image> implements ImageService {

    @Override
    public IPage<Image> listImage(Long albumId, Integer currentPage) {
        QueryWrapper<Image> query = new QueryWrapper<>();
        Page<Image> page = new Page<>(currentPage, 8);
        query.eq("album_id", albumId);
        return baseMapper.selectPage(page, query);
    }
}
