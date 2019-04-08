package com.zy.portal.service;

import com.zy.portal.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zy
 * @since 2019-03-27
 */
public interface ArticleService extends IService<Article> {

    /**
     * 获取文章信息
     * @param currentPage
     * @return
     */
    List<Article> getArticle(Integer currentPage);

    /**
     * 获取文章详细信息
     * @param articleId
     * @return
     */
    Article getArticle(Long articleId);

    /**
     * 查询文章列表
     * @param menuId
     * @return
     */
    List<Article> listArticle(Long menuId);

}
