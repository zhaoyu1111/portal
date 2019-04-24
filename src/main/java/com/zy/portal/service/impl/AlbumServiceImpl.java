package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.entity.Album;
import com.zy.portal.mapper.AlbumMapper;
import com.zy.portal.service.AlbumService;
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
public class AlbumServiceImpl extends ServiceImpl<AlbumMapper, Album> implements AlbumService {

    @Override
    public IPage<Album> listAlbum(Long classId, Integer currentPage) {
        QueryWrapper<Album> query = new QueryWrapper<>();
        Page<Album> page = new Page<>(currentPage, 1000);
        query.eq("origin_id", classId);
        return baseMapper.selectPage(page, query);
    }

    @Override
    public IPage<Album> listAlbumByOrigin(Long studentId, Integer currentPage) {
        QueryWrapper<Album> query = new QueryWrapper<>();
        Page<Album> page = new Page<>(currentPage, 7);
        query.eq("origin_id", studentId);
        return baseMapper.selectPage(page, query);
    }
}
