package com.zy.portal.controller;


import com.zy.portal.entity.Album;
import com.zy.portal.entity.Class;
import com.zy.portal.entity.Image;
import com.zy.portal.service.AlbumService;
import com.zy.portal.service.ClassService;
import com.zy.portal.service.ImageService;
import com.zy.portal.service.UserService;
import com.zy.portal.util.IOUtil;
import com.zy.portal.util.ImageUtil;
import com.zy.portal.util.PathConstant;
import com.zy.portal.util.UtilException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-04-17
 */
@Controller
@RequestMapping("/album")
public class AlbumController {

    @Autowired
    private AlbumService albumService;

    @Autowired
    private ClassService classService;

    @Autowired
    private UserService userService;

    @Autowired
    private ImageService imageService;

    @RequestMapping("")
    public String index(Model model, Long classId) {
        model.addAttribute("album", albumService.listAlbum(classId));
        model = getClassInfo(model, classId);
        return "class/classroom/classroom-album";
    }

    @RequestMapping("/add")
    public String addAlbum(Model model, Long classId) {
        getClassInfo(model, classId);
        return "class/classroom/classroom-album-add";
    }

    @RequestMapping("/edit")
    public String edit(Model model, Long classId, Long albumId) {
        getClassInfo(model, classId);
        model.addAttribute("album", albumService.selectById(albumId));
        return "class/classroom/classroom-album-edit";
    }

    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    public String saveOrUpdateAlbum(RedirectAttributes attributes, Album album,@RequestParam(value = "file") MultipartFile coverImg) throws UtilException {
        String imagePath = null;
        if (coverImg != null && coverImg.getSize() > 0) {
            // 保存到硬盘
            imagePath = ImageUtil.saveAlbumCoverImg(coverImg);
        }
        album.setCoverImg(imagePath);
        albumService.insertOrUpdate(album);
        attributes.addAttribute("classId", 152072L);
        return "redirect:/album";
    }

    private Model getClassInfo(Model model, Long classId) {
        model.addAttribute("classInfo", classService.getClass(classId));
        model.addAttribute("classCount", userService.getClassNum(classId));
        return model;
    }

    @RequestMapping("/image")
    public String imgae(Model model, Long albumId, Long classId) {
        getClassInfo(model, classId);
        model.addAttribute("images", imageService.listImage(albumId));
        model.addAttribute("album", albumService.selectById(albumId));
        return "class/classroom/classroom-album-image";
    }

    @RequestMapping("/upload")
    public String upload(Model model, Long albumId, Long classId) {
        getClassInfo(model, classId);
        model.addAttribute("album", albumService.selectById(albumId));
        return "class/classroom/classroom-album-upload";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAlbum(RedirectAttributes attributes, Long classId, Long albumId) {
        // 参数校验
        if (null != albumId && null != classId) {
            // 删除相册
            albumService.deleteById(albumId);
        }
        // 跳转页面
        attributes.addAttribute("classId", classId);

        return "redirect:/album";
    }

    @RequestMapping("/image/upload")
    public String imageUpload(Long classId, Long albumId, RedirectAttributes attributes,
                              MultipartFile images[]) throws UtilException {
        // 参数校验
        if (null != classId && null != albumId
                && null != images && images.length > 0) {
            System.out.println(images.length);
            System.out.println(images[0].getName());
            Album album = albumService.selectById(albumId);
            if (album != null) {
                // 图片存储
                for (int i = 0; i < images.length; i++) {
                    // 存储图片
                    String imagePath = ImageUtil.saveAlbumImage(images[i]);
                    // 图片对象
                    Image image = new Image();
                    image.setImageName(images[i].getOriginalFilename());
                    image.setImageUrl(imagePath);
                    image.setAlbumId(albumId);

                    // 存储照片
                    imageService.insert(image);

                    // 设置相册封面
                    String albumCover = album.getCoverImg();
                    if (i == 0 && StringUtils.isEmpty(albumCover)) {
                        // 设置第一张照片为相册封面
                        album.setCoverImg(image.getImageUrl());
                        albumService.updateById(album);
                    }
                }
            }
        }
        // 参数传递
        attributes.addAttribute("classId", classId);
        attributes.addAttribute("albumId", albumId);
        return "redirect:/album/image";
    }

    @RequestMapping("/image/delete")
    public String deleteImage(RedirectAttributes attributes, Long classId, Long albumId, Long imageId) {
        // 删除图片
        if (null != imageId) {
            imageService.deleteById(imageId);
        }
        // 参数传递
        attributes.addAttribute("classId", classId);
        attributes.addAttribute("albumId", albumId);

        return "redirect:/album/image";
    }

    @RequestMapping("/coverImg")
    public String cover(RedirectAttributes attributes, Long classId, Long albumId, Long imageId) {
        // 参数校验
        if (null != imageId) {
            // image
            Image image = imageService.selectById(imageId);
            // 更新相册封面
            Album album = albumService.selectById(albumId);
            album.setCoverImg(image.getImageUrl());
            albumService.updateById(album);
        }

        // 参数传递
        attributes.addAttribute("classId", classId);
        attributes.addAttribute("albumId", albumId);

        return "redirect:/album";
    }

    @RequestMapping("/download")
    public String download(HttpServletResponse response, String fileRelPath, String fileName) throws UtilException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition",
                "attachment;fileName=" + IOUtil.createFileName(fileName));

        // 读取文件
        try {
            File file = new File(PathConstant.contextAbsolutePath + fileRelPath);
            InputStream inputStream = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[1024];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}

