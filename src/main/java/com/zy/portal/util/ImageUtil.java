/**
 * @Title: ImageUtil.java <br>
 * @Package com.xzit.ar.common.util <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月10日 下午8:15:28 <br>
 * @version V1.0 <br>
 */
package com.zy.portal.util;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.imageio.ImageIO;

import com.zy.portal.common.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author Mr.Black <br>
 * @version V1.0  <br> <br>
 * @ClassName: ImageUtil <br>
 * @Description: TODO <br>
 * @date 2015年12月10日 下午8:15:28 <br>
 */
public final class ImageUtil {

    /**
     * TODO 保存上传的图片到硬盘
     * @param image
     * @return 图片的相对路径
     * @throws UtilException
     */
    public static String saveImage(MultipartFile image) throws UtilException {
        if (image != null) {
            // 原始名称
            String originalImageName = image.getOriginalFilename();
            if (StringUtils.isNotEmpty(originalImageName)) {
                // 新的图片名称
                String newImageName = UUID.randomUUID()
                        + originalImageName.substring(originalImageName.lastIndexOf("."));
                // 设置物理存储路径
                String dateDir = CommonUtil.createDateDir(PathConstant.pictureUploadAbsolutePath);
                File newImage = new File(PathConstant.pictureUploadAbsolutePath + dateDir + "/" + newImageName);
                try {
                    // 文件保存
                    image.transferTo(newImage);
                } catch (Exception e) {
                    throw new UtilException("图片存储时发生异常");
                }
                // 返回相对路径
                return PathConstant.pictureRelativePath + dateDir + "/" + newImageName;
            }
        }
        return null;
    }

    public static String saveAlbumCoverImg(MultipartFile image) throws UtilException {
        if (image != null) {
            // 原始名称
            String newImageName = getNewName(image);
                // 设置物理存储路径
            String dateDir = CommonUtil.createDateDir(PathConstant.albumCoverImgAbsolutePath);
            File newImage = new File(PathConstant.albumCoverImgAbsolutePath + dateDir + "/" + newImageName);
            try {
                    // 文件保存
                image.transferTo(newImage);
            } catch (Exception e) {
                throw new UtilException("图片存储时发生异常");
            }
                // 返回相对路径
            return PathConstant.albumCoverImgPath + dateDir + "/" + newImageName;
        }
        return null;
    }

    public static String saveAlbumImage(MultipartFile image) throws UtilException {
        if (image != null) {
            // 原始名称
            String newImageName = getNewName(image);
            // 设置物理存储路径
            String dateDir = CommonUtil.createDateDir(PathConstant.albumImageAbsolutePath);
            File newImage = new File(PathConstant.albumImageAbsolutePath + dateDir + "/" + newImageName);
            transTo(image, newImage);
            // 返回相对路径
            return PathConstant.albumImagePath + dateDir + "/" + newImageName;
        }
        return null;
    }

    public static String getNewName(MultipartFile image) {
        String newImageName = null;
        if(null != image) {
            String originalImageName = image.getOriginalFilename();
            if (StringUtils.isNotEmpty(originalImageName)) {
                // 新的图片名称
                 newImageName = UUID.randomUUID()
                        + originalImageName.substring(originalImageName.lastIndexOf("."));
            }
        }
        return newImageName;
    }

    private static void  transTo(MultipartFile image, File newImage) throws UtilException {
        try {
            // 文件保存
            image.transferTo(newImage);
        } catch (Exception e) {
            throw new UtilException("图片存储时发生异常");
        }
    }
}
