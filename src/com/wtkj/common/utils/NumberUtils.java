package com.wtkj.common.utils;

import java.text.DecimalFormat;

import org.springframework.util.StringUtils;

/**
 * 数字型常用方法
 * 
 * @author sun si
 */
public class NumberUtils {

	/**
	 * 保留小数位#.00=2位,#.000=3位
	 * 
	 * @param format
	 *            ,
	 * @param digit
	 * @return
	 */
	public static String parseNum2String(String format, Object digit)
			throws Exception {
		if (digit == null) {
			return "";
		}
		if (StringUtils.isEmpty(format)) {
			format = "#.00";
		}
		DecimalFormat df = new DecimalFormat(format);

		return df.format(digit);
	}

	/**
	 * 
	 * @param digit
	 * @return
	 * @throws Exception
	 */
	public static String parseNum2String(Object digit) throws Exception {
		return parseNum2String(null, digit);
	}

	public static void main(String[] args) {
		double totalBidCost = 12345.34567d;
		try {
			String s = parseNum2String(null, totalBidCost);
			System.out.println(s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
