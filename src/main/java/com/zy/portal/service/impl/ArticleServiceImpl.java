package com.zy.portal.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zy.portal.entity.Article;
import com.zy.portal.mapper.ArticleMapper;
import com.zy.portal.service.ArticleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zy
 * @since 2019-03-27
 */
@Service
public class ArticleServiceImpl extends ServiceImpl<ArticleMapper, Article> implements ArticleService {

    @Override
    public IPage<Article> getArticle(Integer currentPage, Integer size, Long menuId) {
        QueryWrapper<Article> query = new QueryWrapper<>();
        Page<Article> articlePage = new Page<>(currentPage, size);
        query.eq("menu_id", menuId);

        return baseMapper.selectPage(articlePage, query);
    }

    @Override
    public Article getArticle(Long articleId) {
        QueryWrapper<Article> query = new QueryWrapper<>();
        query.eq("article_id", articleId);
        Article article = baseMapper.selectById(articleId);
        article.setCount(article.getCount() + 1);
        baseMapper.updateById(article);
        return article;
    }

    @Override
    public IPage<Article> listArticle(Long menuId, Integer currentPage) {
        QueryWrapper<Article> query = new QueryWrapper<>();
        Page<Article> page = new Page<>(currentPage, 10);
        query.eq("menu_id", menuId);
        return baseMapper.selectPage(page, query);
    }

    @Override
    public List<Article> getArticle() {
        QueryWrapper<Article> query = new QueryWrapper<>();
        Page<Article> page = new Page<>(1, 5);
        query.orderByDesc("count");
        return baseMapper.selectPage(page, query).getRecords();
    }
}
