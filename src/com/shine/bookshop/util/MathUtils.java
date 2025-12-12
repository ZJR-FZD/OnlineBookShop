package com.shine.bookshop.util;

import java.text.DecimalFormat;

/** 
* @version 创建时间：2017年10月26日 下午8:22:56 
*/
public class MathUtils {
	
	public static Double getTwoDouble(Double d) {
		String str = new DecimalFormat("#.00").format(d);
		return Double.parseDouble(str);
		
	}
	
	
}
