package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.portal.entity.DictionaryData;
import com.zy.portal.mapper.DictionaryDataMapper;
import com.zy.portal.service.DictionaryDataService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-04-13
 */
@Service
public class DictionaryDataServiceImpl extends ServiceImpl<DictionaryDataMapper, DictionaryData> implements DictionaryDataService {

    @Override
    public List<DictionaryData> listData(String value) {
        QueryWrapper<DictionaryData> query = new QueryWrapper<>();
        query.eq("dict_value", value);
        return baseMapper.selectList(query);
    }
}
