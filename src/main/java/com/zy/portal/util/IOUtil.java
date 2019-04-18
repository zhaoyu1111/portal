/**  
* @Title: IOUtil.java <br>
* @Package com.xzit.ar.common.util <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月10日 下午8:23:32 <br>
* @version V1.0 <br>
*/
package com.zy.portal.util;

import org.apache.commons.lang3.StringUtils;

import java.io.*;


/**
 * @ClassName: IOUtil <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月10日 下午8:23:32 <br>
 * @version V1.0 <br>
 *          <br>
 */
public final class IOUtil {

	/**
	 * @Title: createFileName
	 * @Description: TODO 下载文件时设置文件名称
	 */
	public static String createFileName(String name) throws UtilException {
		String newName = "";
		if (StringUtils.isNotEmpty(name)) {
			try {
				newName = new String(name.getBytes("UTF-8"), "iso-8859-1");
			} catch (UnsupportedEncodingException e) {
				throw new UtilException("生成文件名时发生错误");
			}
		}
		return newName;
	}
}
