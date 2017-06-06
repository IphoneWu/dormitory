package hstc.edu.cn.util;

import java.util.ArrayList;
import java.util.List;

/**
 * author: 吴毅峰
 * time:2017-5-30
 * 用于格式化字符串
 */

public class StringUtil {


	public static boolean isEmpty(String str) {
		if(str == null || "".equals(str.trim())) {
			return true;
		} else {
			return false;
		}
	}
	

	public static boolean isNotEmpty(String str) {
		if((str != null) && !"".equals(str.trim())) {
			return true;
		} else {
			return false;
		}
	}
	

	public static String formatLike(String str) {
		if(isNotEmpty(str)) {
			return "%" + str + "%";
		} else {
			return null;
		}
	}
	
	/**
	 * @Description ���˵�������Ŀո�
	 * @param list
	 * @return
	 */
	public static List<String> filterWhite(List<String> list) {
		List<String> resultList = new ArrayList<String>();
		for(String l : list) {
			if(isNotEmpty(l)) {
				resultList.add(l);
			}
		}
		return resultList;
	}

}
