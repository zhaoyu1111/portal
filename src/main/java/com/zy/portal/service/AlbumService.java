package com.zy.portal.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zy.portal.entity.Album;
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
public interface AlbumService extends IService<Album> {

    IPage<Album> listAlbum(Long classId, Integer currentPage);

    IPage<Album> listAlbumByOrigin(Long studentId, Integer currentPage);

}
