package com.zy.portal.service;

import com.zy.portal.entity.DictionaryData;
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
public interface DictionaryDataService extends IService<DictionaryData> {

    List<DictionaryData> listData(String value);
}
