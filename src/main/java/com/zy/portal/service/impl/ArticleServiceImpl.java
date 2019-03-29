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
    public List<Article> getArticle(Integer currentPage) {
        QueryWrapper<Article> query = new QueryWrapper<>();
        Page<Article> articlePage = new Page<>(currentPage, 10);
        IPage<Article> articleIPage = baseMapper.selectPage(articlePage, query);
        List<Article> articles = articleIPage.getRecords();
        if(CollectionUtils.isEmpty(articles)) {
            return null;
        }
        for (Article article : articles) {
            
        }
        return articleIPage.getRecords();
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

}
