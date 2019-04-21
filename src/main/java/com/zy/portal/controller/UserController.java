package com.zy.portal.controller;


import com.zy.portal.entity.*;
import com.zy.portal.entity.Class;
import com.zy.portal.service.*;
import com.zy.portal.util.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zy
 * @since 2019-03-30
 */
@Controller
@RequestMapping("/login")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private ClassService classService;

    @Autowired
    private UserJobService userJobService;

    @Autowired
    private RecruitUnitService recruitUnitService;

    @Autowired
    private AlbumService albumService;

    @Autowired
    private ImageService imageService;

    @RequestMapping("")
    public String login() {
        return "login";
    }

    @RequestMapping("/index")
    public String index(Model model, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        model.addAttribute("user", userService.getUserInfo(user.getStudentId()));
        UserJob job = userJobService.selectById(user.getStudentId());
        model.addAttribute("job", job);
        if(null != job) {
            model.addAttribute("unit", recruitUnitService.getRecruitUnit(job.getUnitId()));
        }
        return "my/my-index";
    }

    @RequestMapping(value = "/val", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> loginVal(HttpSession session, String studentId, String password) {
        Map<String, Object> rs = new HashMap<>();
        password = MD5Utils.encode(password);
        System.out.println(password);
        User user = userService.validateUser(studentId);
        if(null != user) {
            if(user.getPwd().equals(password)) {
                rs.put("msg", "OK");
                session.setAttribute("SESSION_USER", user);
                return rs;
            }else {
                rs.put("msg", "密码错误");
                rs.put("type", "p");
                return rs;
            }
        }else {
            rs.put("msg", "用户名不存在");
            rs.put("type", "a");
            return rs;
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("SESSION_USER");
        return "portal-main/index";
    }

    @RequestMapping("/basic")
    public String basic(Model model, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "portal-main/index";
        }
        model.addAttribute("info", userService.getUserInfo(user.getStudentId()));
        return "my/profile/profile-basic";
    }

    @RequestMapping("/account")
    public String account(Model model, HttpSession session) {
        User user = (User)session.getAttribute("SESSION_USER");
        if(null == user) {
            return "portal-main/index";
        }
        model.addAttribute("account", userService.getUserInfo(user.getStudentId()));
        return "my/account/account-index";
    }

    @RequestMapping("/password")
    public String password() {
        return "my/account/account-password";
    }

    @RequestMapping("/updatePwd")
    public String updatePwd(Model model, HttpSession session, String password, String confirmPwd, String oldPwd) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        if(!user.getPwd().equals(MD5Utils.encode(oldPwd))) {
            model.addAttribute("old", "原始密码错误");
        }else if(!confirmPwd.equals(password)){
            model.addAttribute("confirm", "两次输入不一致");
        }else {
            user.setPwd(MD5Utils.encode(password));
            userService.updatePassword(user);
        }
        return "my/account/account-password";
    }

    @RequestMapping("/email")
    public String email() {
        return "my/account/account-email";
    }

    @RequestMapping("/updateEmail")
    public String updateEmail(HttpSession session, String email) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        return "redirect:/login/account";
    }

    @RequestMapping("/class")
    public String myClass(HttpSession session, Model model) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        Class myClass = classService.getClass(user.getClassId());
        model.addAttribute("myclass", myClass);
        model.addAttribute("count", userService.getClassNum(user.getClassId()));
        return "my/class/class-index";
    }

    @RequestMapping("/avatar")
    public String portrait() {
        return "my/profile/profile-portrait";
    }

    @RequestMapping("/avatar/upload")
    public String upload(HttpSession session, MultipartFile portrait) throws UtilException {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        // 参数校验
        if (portrait != null && portrait.getSize() > 0) {
            // 保存到硬盘
            String imagePath = ImageUtil.saveImage(portrait);

            // 更新头像信息
            if (StringUtils.isNotEmpty(imagePath)) {
                user.setAvatar(imagePath);
                userService.updateById(user);
                // 更新并刷新session
                session.setAttribute("SESSION_USER", user);
            }
        }
        return "my/profile/profile-portrait";
    }

    @RequestMapping("/job")
    public String job(HttpSession session, Model model) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        model.addAttribute("job", userJobService.selectById(user.getStudentId()));
        model.addAttribute("unit", recruitUnitService.listUnit());
        return "my/profile/profile-job";
    }

    @RequestMapping("/album")
    public String album(Model model, HttpSession session) {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        model.addAttribute("album", albumService.listAlbumByOrigin(user.getStudentId()));
        return "my/profile/profile-album";
    }

    @RequestMapping("/jobUpdate")
    public String jobUpdate(HttpSession session, UserJob userJob) {
        if(null == session.getAttribute("SESSION_USER")) {
            return "redirect:/login";
        }
        userJobService.userJobUpdate(userJob);
        return "redirect:/login/job";
    }

    @RequestMapping("/userIndex")
    public String userIndex(Model model, Long studentId) {
        getTaInfo(model, studentId);
        return "my/ta/ta-index";
    }

    @RequestMapping("/userImage")
    public String userImage(Model model, Long albumId) {
        Album album = albumService.selectById(albumId);
        List<Image> images = imageService.listImage(albumId);
        if(null == album) {
            getTaInfo(model, null);
        }
        getTaInfo(model, album.getOriginId());
        model.addAttribute("images", images);
        return "my/ta/ta-image";
    }

    @RequestMapping("/image")
    public String imgae(HttpSession session, Model model, Long albumId) {
        if(null == session.getAttribute("SESSION_USER")) {
            return "redirect:/login";
        }
        model.addAttribute("images", imageService.listImage(albumId));
        model.addAttribute("album", albumService.selectById(albumId));
        return "my/profile/profile-image";
    }

    @RequestMapping("/upload")
    public String upload(Model model, Long albumId) {
        model.addAttribute("album", albumService.selectById(albumId));
        return "my/profile/profile-image-upload";
    }

    @RequestMapping("/image/upload")
    public String imageUpload(Long albumId, RedirectAttributes attributes,
                              MultipartFile images[]) throws UtilException {
        // 参数校验
        if (null != albumId && null != images && images.length > 0) {
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
        attributes.addAttribute("albumId", albumId);
        return "redirect:/login/image";
    }

    @RequestMapping("/addAlbum")
    public String addAlbum() {
        return "my/profile/profile-album-add";
    }

    @RequestMapping(value = "/saveOrUpdate", method = RequestMethod.POST)
    public String saveOrUpdateAlbum(HttpSession session, Album album, @RequestParam(value = "file") MultipartFile coverImg) throws UtilException {
        User user = (User) session.getAttribute("SESSION_USER");
        if(null == user) {
            return "redirect:/login";
        }
        String imagePath = null;
        if (coverImg != null && coverImg.getSize() > 0) {
            // 保存到硬盘
            imagePath = ImageUtil.saveAlbumCoverImg(coverImg);
        }
        album.setCoverImg(imagePath);
        album.setOriginId(user.getStudentId());
        albumService.insertOrUpdate(album);
        return "redirect:/login/album";
    }

    private Model getTaInfo(Model model, Long studentId) {
        model.addAttribute("user", userService.getUserInfo(studentId));
        UserJob job = userJobService.selectById(studentId);
        model.addAttribute("job", job);
        model.addAttribute("album", albumService.listAlbum(studentId));
        if(null != job) {
            model.addAttribute("unit", recruitUnitService.getRecruitUnit(job.getUnitId()));
        }
        return model;
    }

    @RequestMapping("/edit")
    public String edit(Model model, Long albumId) {
        model.addAttribute("album", albumService.selectById(albumId));
        return "my/profile/profile-album-add";
    }

    @RequestMapping("/coverImg")
    public String cover(RedirectAttributes attributes, Long albumId, Long imageId) {
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
        attributes.addAttribute("albumId", albumId);

        return "redirect:/login/album";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deleteAlbum(Long albumId) {
        // 参数校验
        if (null != albumId) {
            // 删除相册
            albumService.deleteById(albumId);
        }
        // 跳转页面

        return "redirect:/login/album";
    }

    @RequestMapping("/image/delete")
    public String deleteImage(RedirectAttributes attributes, Long albumId, Long imageId) {
        // 删除图片
        if (null != imageId) {
            imageService.deleteById(imageId);
        }
        // 参数传递
        attributes.addAttribute("albumId", albumId);

        return "redirect:/login/image";
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

