/**  
 * @Title: PathConstant.java
 * @Package com.xzit.ar.common.constant
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月28日 下午8:24:55
 * @version V1.0  
 */
package com.zy.portal.util;

/**
 * @ClassName: PathConstant
 * @Description: TODO 设置相关路径
 * @author Mr.Black
 * @date 2016年2月28日 下午8:24:55
 */
public interface PathConstant {

	String contextAbsolutePath = "E://cache//";

	/**
	 * 项目的相对路径
	 */
	String contextRelativePath = "/zy";

	/**
	 * 上传的图片的相对路径
	 */
	String pictureRelativePath = contextRelativePath + "/pic/upload";

	/**
	 * 相册封面路径
	 */
	String albumCoverImgPath =  contextRelativePath + "/album/upload";

	/**
	 * 相册图片路径
	 */
	String albumImagePath =  contextRelativePath + "/image/upload";

	/**
	 * 图片上传文件夹
	 */
	String pictureUploadAbsolutePath = contextAbsolutePath + pictureRelativePath;

	/**
	 * 相册封面上传文件夹
	 */
	String albumCoverImgAbsolutePath = contextAbsolutePath + albumCoverImgPath;

	/**
	 * 相册图片上传文件夹
	 */
	String albumImageAbsolutePath = contextAbsolutePath + albumImagePath;

	/**
	 * 相册默认封面图片路径
	 */
	String albumCoverDefaultRelPath = "zy/images/example/ablum-cover/media-audio.png";

}
