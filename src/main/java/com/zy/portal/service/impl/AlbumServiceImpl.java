package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
    public List<Album> listAlbum(Long classId) {
        QueryWrapper<Album> query = new QueryWrapper<>();
        query.eq("origin_id", classId);
        return baseMapper.selectList(query);
    }

}
