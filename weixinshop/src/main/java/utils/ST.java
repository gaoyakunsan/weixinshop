package utils;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

/**
 * String tool
 *
 * ST
 *
 * Creator: eddie Mender: eddie 2011-6-22 上午09:54:03
 *
 * @version 1.0.0
 *
 */
public final class ST {
    private final static String NULL_STRING = "\\s+";
    private final static Pattern pn = Pattern.compile(NULL_STRING);

    private ST() {
    }


    /**
     * 检查对象是否为空
     *
     * @param txt
     * @return boolean
     */
    public static boolean isNull(String txt) {
        return (txt == null || txt.length() == 0) || pn.matcher(txt).matches();
    }

    /**
     * 检查对象是否为空
     *
     * @param obj
     * @return boolean
     */
    public static boolean isNull(Object obj) {
        if (obj == null) {
            return true;
        } else if (String.class.isInstance(obj)) {
            return isNull((String) obj);
        } else {
            return false;
        }
    }

    /**
     * 安全方法,如果对象为空或空字符串，将其转化为指定的值
     *
     * @param str：要转换的对象
     * @param value：转换的值
     * @return String
     */
    public static String getDefault(String str, String value) {
        return isNull(str) ? value : str;
    }

    /**
     * 三元运算符计算，当str1等于str2时，方法返回str3,否则返回str4 getDefault
     *
     * @param str1
     * @param str2
     * @param str3
     * @param str4
     * @return String
     * @exception @since
     *                1.0.0
     */
    public static String getDefault(String str1, String str2, String str3,
            String str4) {
        return equals(str1, str2) ? str3 : str4;
    }

    /**
     * 安全方法,将一个字符串转换为一个数字 converStringToInt
     *
     * @param str,要转换的字符串
     * @param defNum,默认返回值
     * @return int
     * @exception @since
     *                1.0.0
     */
    public static int getDefaultToInt(String str, int defNum) {
        if (isNull(str))
            return defNum;
        int result = defNum;
        try {
            result = Integer.valueOf(str).intValue();
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return result;
    }

    
    /**
     * 比较两个对象是否相等,首先判断是否为同一类型；其次判断是否为字符串型，如果为字符串型则判断两个字符串的值是否相等(大小写敏感),
     * 不为字符串型则调用Object.equals()方法比较两个对象
     *
     * @param obj1
     * @param obj2
     * @return
     */
    public static boolean equals(Object obj1, Object obj2) {
        if (obj1 == null || obj2 == null) {
            return false;
        }
        if (obj1.getClass() != obj2.getClass())
            return false;
        else if (String.class.isInstance(obj1)) {
            return equals((String) obj1, (String) obj2);
        } else
            return obj1.equals(obj2);
    }

    /**
     * 检查两个字符串是否相等
     *
     * @param txt1
     * @param txt2
     * @param flag:
     *            1.true(忽略大小写) 2.false(大小写敏感)
     * @return boolean
     */
    public static boolean equals(String txt1, String txt2,
            boolean isIgnoreCase) {
        if (txt1 == null || txt2 == null) {
            return false;
        }
        if (txt1.equals(txt2))
            return true;
        if (isIgnoreCase) {
            txt1 = txt1.toLowerCase(Locale.getDefault());
            txt2 = txt2.toLowerCase(Locale.getDefault());
        }
        return txt1.intern() == txt2.intern();
    }

    /**
     * 检查两个字符串是否相等
     *
     * @param txt1
     * @param txt2
     * @return boolean
     */
    public static boolean equals(String txt1, String txt2) {
        return equals(txt1, txt2, false);
    }

    /**
     * 从一个文件路径中获取文件名称 getFileName
     *
     * @param filePath
     * @return String
     * @exception @since
     *                1.0.0
     */
    public static String getFileName(String filePath) {
        int position1 = filePath.lastIndexOf("\\");
        int position2 = filePath.lastIndexOf("/");
        if (position1 != -1 && position1 > position2) {
            return filePath.substring(position1 + 1);
        } else if (position2 != -1 && position2 > position1) {
            return filePath.substring(position2 + 1);
        } else {
            return filePath;
        }
    }

    /**
     * 为文件路径拼接一个文件分隔符 concatSeparator
     *
     * @param filePath
     * @return String
     * @exception @since
     *                1.0.0
     */
    public static String concatSeparator(String filePath) {
        if (!isNull(filePath)) {
            filePath += (filePath
                    .lastIndexOf(File.separator) == filePath.length() - 1) ? ""
                            : File.separator;
        }
        return filePath;
    }

    /**
     * 获取文件扩展名 getExtensionName
     *
     * @param file
     * @return String
     * @exception @since
     *                1.0.0
     */
    public static String getExtensionName(File file) {
        String fileName = file.getName();
        if (fileName.indexOf(".") != -1) {
            int beginIndex = fileName.lastIndexOf(".");
            return fileName.substring(
                    beginIndex == fileName.length() ? 0 : beginIndex + 1,
                    fileName.length());
        } else {
            return fileName;
        }
    }

    /**
     * 将一个字符串转型为该字符串字面量类型 castStr
     *
     * @param clazz
     * @param obj
     * @return Object
     * @exception @since
     *                1.0.0
     */
    public static Object castStr(Class<?> clazz, String obj) {
        if (clazz.toString().equals("int") || clazz.equals(Integer.class)) {
            return Integer.valueOf(obj);
        } else if (clazz.toString().equals("long")
                || clazz.equals(Long.class)) {
            return Long.valueOf(obj);
        } else if (clazz.toString().equals("float")
                || clazz.equals(Float.class)) {
            return Float.valueOf(obj);
        } else if (clazz.toString().equals("double")
                || clazz.equals(Double.class)) {
            return Double.valueOf(obj);
        } else if (clazz.equals(Class.class)) {
            return clazz.toString();
        } else {
            return obj;
        }
    }

    /**
     * 将一个字符串数组转换为一个字符串 getRangeStr
     *
     * @param arr
     * @return String
     * @exception @since
     *                1.0.0
     */
    public static String getRangeStr(String[] arr) {
        return getRangeStr(arr, "(", ")");
    }

    /**
     * 将一个字符串数组转换为一个字符串 getRangeStr
     *
     * @param idList
     * @param str1
     * @param str2
     * @return String
     * @exception @since
     *                1.0.0
     */
    public static String getRangeStr(String[] arr, String str1, String str2) {
        return Arrays.toString(arr).replaceAll("\\[", getDefault(str1, ""))
                .replaceAll("\\]", getDefault(str2, "")).replaceAll("\\s", "");
    }

    /**
     * 去除字符串前后的逗号
     *
     * @param str
     * @return
     */
    public static String cutStringComma(String str) {
        if (str == null)
            return str;

        boolean hasCut = false;
        if (str.startsWith(",")) {
            str = str.substring(1);
            hasCut = true;
        }

        if (str.endsWith(",")) {
            str = str.substring(0, str.length() - 1);
            hasCut = true;
        }

        return hasCut ? cutStringComma(str) : str;
    }

    /**
     * 获取时间差，以秒为单位
     *
     * @param sd
     * @param se
     * @return
     */
    public static String getBetweenSecond(Date sd, Date se) {
        String minute = String.valueOf(((se.getTime()) - sd.getTime()) / 1000);
        return minute;
    }

    /**
     * 获取时间差，以小时为单位
     *
     * @param sd
     * @param se
     * @return
     */
    public static String getBetweenHour(Date sd, Date se) {
        String minute = String
                .valueOf(((se.getTime()) - sd.getTime()) / 1000 / 60 / 60);
        return minute;
    }
    /**
     * 
     * @param ids
     *            :String类型 "1,2,3"
     * @return
     */
    public static List<Integer> StringToList(String ids) {
        List<Integer> list = new ArrayList<Integer>();
        if (ids == null || ids.length() == 0) {
            return list;
        }
        String strIds = "";
        if (ids.endsWith(",")) {
            strIds = ids.substring(0, ids.length() - 1);
        } else {
            strIds = ids;
        }
        String[] idArr = strIds.split(",");
        for (String id : idArr) {
            list.add(Integer.valueOf(id));
        }

        return list;
    }
    
    public static void main(String[] args) {
    	String time = "1481082823000";
    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    	Date d = new Date(time);
    	/*try {
    		date = dateFormat.parse(time);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
    	System.out.println(d);
	}
}
