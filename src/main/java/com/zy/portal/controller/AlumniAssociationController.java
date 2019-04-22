package com.zy.portal.controller;


import com.baomidou.mybatisplus.core.toolkit.CollectionUtils;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.zy.portal.dto.UserDto;
import com.zy.portal.entity.*;
import com.zy.portal.service.*;
import com.zy.portal.util.IOUtil;
import com.zy.portal.util.ImageUtil;
import com.zy.portal.util.PathConstant;
import com.zy.portal.util.UtilException;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
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
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-03-31
 */
@Controller
@RequestMapping("/origin")
public class AlumniAssociationController {

    @Autowired
    private AlumniAssociationService alumniAssociationService;

    @Autowired
    private UserService userService;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private UserJobService userJobService;

    @Autowired
    private RecruitUnitService recruitUnitService;

    @RequestMapping("")
    public String index(Model model) {
        List<AlumniAssociation> associations = alumniAssociationService.listAssocia();
        // TODO: 2019/3/31
        List<String> address = associations.stream().map(AlumniAssociation::getAddress).distinct().collect(Collectors.toList());


        model.addAttribute("associa", associations);
        return "org/org-institute";
    }

    @RequestMapping("/index")
    public String indexDetail(Model model, Long associaId) {
        AlumniAssociation association = alumniAssociationService.getAssociation(associaId);
        model.addAttribute("orgroom", association);
        List<User> users = userService.getUser(association.getAddress());
        Integer member = CollectionUtils.isEmpty(users) ? 0 : users.size();
        model.addAttribute("member", member);
        return "org/orgroom/orgroom-index";
    }

    @RequestMapping("/member")
    public String getMembers(String address, Model model) {
        model.addAttribute("orgroom", alumniAssociationService.getAssociation(address));
        List<User> users = userService.getUser(address);
        model.addAttribute("user", users);
        Integer member = CollectionUtils.isEmpty(users) ? 0 : users.size();
        model.addAttribute("member", member);
        return "org/orgroom/orgroom-member";
    }

    @RequestMapping("/directory")
    public String getDirectory(Model model, String address) {
        model.addAttribute("orgroom", alumniAssociationService.getAssociation(address));
        List<User> users = userService.getUser(address);

        List<Long> studentIds = users.stream().map(User::getStudentId).distinct().collect(Collectors.toList());
        List<UserJob> job = userJobService.getUserJob(studentIds);
        Map<Long, UserJob> jobMap = Maps.newHashMap();
        job.forEach(userJob -> jobMap.put(userJob.getStudentId(), userJob));

        List<Long> unitIds = job.stream().map(UserJob::getUnitId).distinct().collect(Collectors.toList());
        List<RecruitUnit> units = recruitUnitService.listUnit(unitIds);
        Map<Long, String> unitMap = Maps.newHashMap();
        units.forEach(unit -> unitMap.put(unit.getUnitId(), unit.getUnitName()));

        List<UserDto> userDtos = Lists.newArrayList();
        for (User user : users) {
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(user, userDto);
            UserJob job1 = jobMap.get(user.getStudentId());
            if(null != job1) {
                userDto.setJobName(job1.getJobName());
                userDto.setUnitName(unitMap.get(job1.getUnitId()));
            }
            userDtos.add(userDto);
        }

        model.addAttribute("user", userDtos);
        Integer member = CollectionUtils.isEmpty(users) ? 0 : users.size();
        model.addAttribute("member", member);
        return "org/orgroom/orgroom-directory";
    }

    @RequestMapping("/album")
    public String album(Model model, Long associaId) {
        model.addAttribute("album", albumService.listAlbum(associaId));
        getOrigin(model, associaId);
        return "org/orgroom/orgroom-album";
    }

    private Model getOrigin(Model model, Long associaId) {
        AlumniAssociation association = alumniAssociationService.selectById(associaId);
        model.addAttribute("orgroom", association);
        model.addAttribute("member", userService.getUser(association.getAddress()).size());
        return model;
    }

    @RequestMapping("/album/add")
    public String albumAdd(Model model, Long associaId) {
        getOrigin(model, associaId);
        return "org/orgroom/orgroom-album-add";
    }

    @RequestMapping(value = "/album/saveOrUpdate", method = RequestMethod.POST)
    public String saveOrUpdateAlbum(RedirectAttributes attributes, Album album, @RequestParam(value = "file") MultipartFile coverImg) throws UtilException {
        String imagePath = null;
        if (coverImg != null && coverImg.getSize() > 0) {
            // 保存到硬盘
            imagePath = ImageUtil.saveAlbumCoverImg(coverImg);
        }
        album.setCoverImg(imagePath);
        albumService.insertOrUpdate(album);
        attributes.addAttribute("associaId", album.getOriginId());
        return "redirect:/origin/album";
    }

    @RequestMapping("/album/edit")
    public String edit(Model model, Long associaId, Long albumId) {
        getOrigin(model, associaId);
        model.addAttribute("album", albumService.selectById(albumId));
        return "org/orgroom/orgroom-album-edit";
    }

    @RequestMapping("/album/image")
    public String imgae(Model model, Long albumId, Long associaId) {
        getOrigin(model, associaId);
        model.addAttribute("images", imageService.listImage(albumId));
        model.addAttribute("album", albumService.selectById(albumId));
        return "org/orgroom/orgroom-album-image";
    }

    @RequestMapping("/album/upload")
    public String upload(Model model, Long albumId, Long associaId) {
        getOrigin(model, associaId);
        model.addAttribute("album", albumService.selectById(albumId));
        return "org/orgroom/orgroom-album-upload";
    }

    @RequestMapping("/album/image/upload")
    public String imageUpload(Long associaId, Long albumId, RedirectAttributes attributes,
                              MultipartFile images[]) throws UtilException {
        // 参数校验
        if (null != associaId && null != albumId
                && null != images && images.length > 0) {
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
        attributes.addAttribute("associaId", associaId);
        attributes.addAttribute("albumId", albumId);
        return "redirect:/origin/album/image";
    }

    @RequestMapping(value = "/album/delete", method = RequestMethod.POST)
    public String deleteAlbum(RedirectAttributes attributes, Long associaId, Long albumId) {
        // 参数校验
        if (null != albumId && null != associaId) {
            // 删除相册
            albumService.deleteById(albumId);
        }
        // 跳转页面
        attributes.addAttribute("associaId", associaId);

        return "redirect:/origin/album";
    }

    @RequestMapping("/album/image/delete")
    public String deleteImage(RedirectAttributes attributes, Long associaId, Long albumId, Long imageId) {
        // 删除图片
        if (null != imageId) {
            imageService.deleteById(imageId);
        }
        // 参数传递
        attributes.addAttribute("associaId", associaId);
        attributes.addAttribute("albumId", albumId);

        return "redirect:/origin/album/image";
    }

    @RequestMapping("/album/coverImg")
    public String cover(RedirectAttributes attributes, Long associaId, Long albumId, Long imageId) {
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
        attributes.addAttribute("associaId", associaId);
        attributes.addAttribute("albumId", albumId);

        return "redirect:/origin/album";
    }

    @RequestMapping("/album/download")
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

