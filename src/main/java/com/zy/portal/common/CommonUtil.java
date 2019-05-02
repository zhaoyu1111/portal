package com.zy.portal.common;

import java.io.File;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @ClassName: CommonUtil
 * @Description: TODO 通用工具类
 */
public class CommonUtil {

    /**
     * random
     */
    private static final Random RANDOM = new Random();

    public static boolean isEmpty(String str) {
        if (str == null || "".equals(str)) {
            return true;
        }
        return false;
    }

    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }

    public static boolean isEmpty(Integer integer) {
        if (integer == null || integer == 0) {
            return true;
        }
        return false;
    }

    /**
     * @Title: isNotEmpty @Description: TODO is integer Not Empty @param @param
     *         integer @param @return @return boolean @throws
     */
    public static boolean isNotEmpty(Integer integer) {
        return !isEmpty(integer);
    }

    public static <T> boolean isEmpty(T[] t) {
        return t == null || t.length == 0;
    }

    public static <T> boolean isNotEmpty(T[] t) {
        return !isEmpty(t);
    }

    public static boolean isEmpty(Collection<?> col) {
        return col == null || col.isEmpty();
    }

    public static boolean isNotEmpty(Collection<?> col) {
        return !isEmpty(col);
    }

    public static boolean isEmpty(Map<?, ?> map) {
        return map == null || map.isEmpty();
    }

    public static boolean isNotEmpty(Map<?, ?> map) {
        return !isEmpty(map);
    }

    public static String lowerCaseFirstChar(String str) {
        if (isNotEmpty(str)) {
            char firstChar = str.charAt(0);
            if (Character.isUpperCase(firstChar)) {
                StringBuilder sb = new StringBuilder(str);
                sb.setCharAt(0, Character.toLowerCase(firstChar));
                str = sb.toString();
            }
        }
        return str;
    }

    public static boolean isNull(Object obj) {
        return null == obj;
    }

    public static String getUUID() {
        return UUID.randomUUID().toString();
    }

    public static String getRandomNumber(int size) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            sb.append((char) ('0' + RANDOM.nextInt(10)));
        }
        return sb.toString();
    }

    public static String messageFormat(String message, Object... params) {
        return isNotEmpty(params) ? MessageFormat.format(message, params) : message;
    }

    public static String getRandomChar(int size) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < size; i++) {
            switch (RANDOM.nextInt(10) % 3) {
                case 0:
                    sb.append((char) ('0' + RANDOM.nextInt(10)));
                    break;
                case 1:
                    sb.append((char) ('a' + RANDOM.nextInt(26)));
                    break;
                case 2:
                    sb.append((char) ('A' + RANDOM.nextInt(26)));
                    break;
                default:
                    ;
            }
        }
        return sb.toString();
    }

    public static String arr2String(Object[] objs) {
        StringBuffer sb = new StringBuffer();
        if ((objs != null) && (objs.length != 0)) {
            for (int i = 0; i < objs.length; i++) {
                if (objs[i] instanceof String[]) {
                    String[] strArray = (String[]) objs[i];
                    for (String str : strArray) {
                        sb.append(str);
                    }
                } else {
                    sb.append(objs[i]);
                }
            }
        }
        return sb.toString();
    }

    public static List<Integer> splitIds(String ids) {
        List<Integer> idList = null;
        // 判断ids 不为空
        if (CommonUtil.isNotEmpty(ids)) {
            // new List
            idList = new ArrayList<Integer>();
            // 解析 ids
            for (String id : ids.split("-")) {
                idList.add(Integer.parseInt(id));
            }
        }
        return idList;
    }

    /**
     * TODO 根据当前日期，在绝对路径下创建 年/月/日 文件夹
     * @param parentDirAbsPath
     * @return 返回年月日文件夹
     */
    public static String createDateDir(String parentDirAbsPath) {
        // 获取格式化的日期
        Calendar date = Calendar.getInstance();
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy");
        SimpleDateFormat format2 = new SimpleDateFormat("MM");
        SimpleDateFormat format3 = new SimpleDateFormat("dd");
        String name1 = format1.format(date.getTime());
        String name2 = format2.format(date.getTime());
        String name3 = format3.format(date.getTime());
        // 设置文件夹路径
        String dirDatePath = "/" + name1 + "/" + name2 + "/" + name3;
        File file = new File(parentDirAbsPath + dirDatePath);
        file.mkdirs();

        return dirDatePath;
    }

    /**
     * TODO 截取字符串
     * @param str
     * @param begin
     * @param end
     * @return
     */
    public static String subString(String str, int begin, int end) {
        // 参数校验
        if (CommonUtil.isNotEmpty(str) && begin > 0 && end > begin && str.length() > begin) {
            //
            if (end < str.length()) {
                return str.substring(begin, end);
            } else {
                return str;
            }
        }
        return "";
    }
}
