package com.wtkj.common.utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.i18n.LocaleContextHolder;

/**
 * Date Utility Class used to convert Strings to Dates and Timestamps
 * 
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a> Modified by
 *         <a href="mailto:dan@getrolling.com">Dan Kibler </a> to correct time
 *         pattern. Minutes should be mm not MM (MM is month).
 */
public abstract class DateUtil {
	private static Log log = LogFactory.getLog(DateUtil.class);
	private static final String TIME_PATTERN = "HH:mm";
	public static final String YYYY_MM_DD = "yyyy-MM-dd";
	public static final String YYYYMMDD = "yyyyMMdd";
	public static final String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

	/**
	 * Return default datePattern (MM/dd/yyyy)
	 * 
	 * @return a string representing the date pattern on the UI
	 */
	public static String getDatePattern() {
		Locale locale = LocaleContextHolder.getLocale();
		String defaultDatePattern;
		defaultDatePattern = "yyyy-MM-dd";

		return defaultDatePattern;
	}

	public static String getDateTimePattern() {
		return DateUtil.getDatePattern() + " HH:mm:ss";
	}

	public static String getDate() {
		return getDate(new Date());
	}

	/**
	 * @param aDate
	 *            date from database as a string
	 * @return formatted string for the ui
	 */
	public static String getDate(Date aDate) {
		SimpleDateFormat df;
		String returnValue = "";

		if (aDate != null) {
			df = new SimpleDateFormat(getDatePattern());
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}

	public static String getDate(Date aDate, String pattern) {
		SimpleDateFormat df;
		String returnValue = "";

		if (aDate != null) {
			df = new SimpleDateFormat(pattern);
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}

	/**
	 * This method generates a string representation of a date/time in the
	 * format you specify on input
	 * 
	 * @param aMask
	 *            the date pattern the string is in
	 * @param strDate
	 *            a string representation of a date
	 * @return a converted Date object
	 * @see java.text.SimpleDateFormat
	 * @throws ParseException
	 *             when String doesn't match the expected format
	 */
	public static Date convertStringToDate(String aMask, String strDate)
			throws ParseException {
		return new SimpleDateFormat(aMask).parse(strDate);
	}

	/**
	 * This method returns the current date time in the format: MM/dd/yyyy HH:MM
	 * a
	 * 
	 * @param theTime
	 *            the current time
	 * @return the current date/time
	 */
	public static String getTimeNow(Date theTime) {
		return getDateTime(TIME_PATTERN, theTime);
	}

	/**
	 * This method returns the current date in the format: MM/dd/yyyy
	 * 
	 * @return the current date
	 * @throws ParseException
	 *             when String doesn't match the expected format
	 */
	public static Calendar getToday() throws ParseException {
		Date today = new Date();
		SimpleDateFormat df = new SimpleDateFormat(getDatePattern());
		String todayAsString = df.format(today);
		Calendar cal = new GregorianCalendar();
		cal.setTime(convertStringToDate(todayAsString));

		return cal;
	}

	/**
	 * This method generates a string representation of a date's date/time in
	 * the format you specify on input
	 * 
	 * @param aMask
	 *            the date pattern the string is in
	 * @param aDate
	 *            a date object
	 * @return a formatted string representation of the date
	 * 
	 * @see java.text.SimpleDateFormat
	 */
	public static String getDateTime(String aMask, Date aDate) {
		SimpleDateFormat df = null;
		String returnValue = "";

		if (aDate == null) {
			log.error("aDate is null!");
		} else {
			df = new SimpleDateFormat(aMask);
			returnValue = df.format(aDate);
		}

		return (returnValue);
	}

	/**
	 * This method generates a string representation of a date based on the
	 * System Property 'dateFormat' in the format you specify on input
	 * 
	 * @param aDate
	 *            A date to convert
	 * @return a string representation of the date
	 */
	public static String convertDateToString(Date aDate) {
		return getDateTime(getDatePattern(), aDate);
	}

	public static String convertDateToString(Date aDate, String aMask) {
		return getDateTime(aMask, aDate);
	}

	/**
	 * This method converts a String to a date using the datePattern
	 * 
	 * @param strDate
	 *            the date to convert (in format MM/dd/yyyy)
	 * @return a date object
	 * @throws ParseException
	 *             when String doesn't match the expected format
	 */
	public static Date convertStringToDate(String strDate)
			throws ParseException {
		String mask = getDatePattern();
		if (strDate.length() > 10) {
			mask = getDateTimePattern();
		}
		return convertStringToDate(mask, strDate);
	}

	public static Date getEdate(Date edate) {
		if (edate == null)
			return null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(edate);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 999);
		return cal.getTime();
	}

	/**
	 * 获取日期年月日去除时分秒
	 * 
	 * @param sdate
	 * @return
	 */
	public static Date getSdate(Date sdate) {
		if (sdate == null)
			return null;
		Calendar cal = Calendar.getInstance();
		cal.setTime(sdate);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		cal.set(Calendar.MILLISECOND, 0);
		return cal.getTime();
	}

	/**
	 * 日期加减运算
	 * 
	 * @param date
	 * @param unit
	 *            单位 :年月日
	 * @param size
	 *            量
	 * @return
	 */
	public static Date dateAdd(Date date, int unit, int size) {
		GregorianCalendar gc = new GregorianCalendar();
		gc.setTime(date);
		gc.add(unit, size);
		return gc.getTime();

	}

	/*----------------------开始----------------------*/
	/**
	 * 获取某月的开始时间
	 * 
	 * @param time
	 * @return
	 */
	public static Date getMonthStartTime(Date time) {
		Calendar c = Calendar.getInstance();
		c.setTime(isNullTimestamp(time));
		c.set(Calendar.DATE, 1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return StringToDate(
				DateToString(new Date(c.getTime().getTime()), YYYY_MM_DD_HH_MM_SS), YYYY_MM_DD_HH_MM_SS);
	}

	/**
	 * 获取某月的结束时间
	 * 
	 * @param time
	 * @return
	 */
	public static Date getMonthEndTime(Date time) {
		Calendar c = Calendar.getInstance();
		c.setTime(isNullTimestamp(time));
		c.set(Calendar.DATE, 1);
		c.add(Calendar.MONTH, 1);
		c.add(Calendar.DAY_OF_MONTH, -1);
		c.set(Calendar.HOUR_OF_DAY, 23);
		c.set(Calendar.MINUTE, 59);
		c.set(Calendar.SECOND, 59);
		return StringToDate(
				DateToString(new Date(c.getTime().getTime()),
						YYYY_MM_DD_HH_MM_SS), YYYY_MM_DD_HH_MM_SS);
	}
	
	private static Date isNullTimestamp(Date time) {
		if (time == null) {
			return getCurrentTime();
		}
		return time;
	}
	/**
	 * 获取当前时间
	 * 
	 * @return
	 */
	public static Date getCurrentTime() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return StringToDate(
				DateToString(new Date(c.getTime().getTime()),
						YYYY_MM_DD_HH_MM_SS), YYYY_MM_DD_HH_MM_SS);
	}
	public static SimpleDateFormat getDateFormat(String parttern)
			throws RuntimeException {
		return new SimpleDateFormat(parttern);
	}
	/**
	 * 时间转指定格式字符串
	 * 
	 * @param date
	 * @param parttern
	 * @return
	 */
	public static String DateToString(Date date, String parttern) {
		String formatDate = null;
		if (date != null) {
			try {
				formatDate = getDateFormat(parttern).format(date);
			} catch (Exception e) {
				formatDate = new String();
			}
		}
		return formatDate;
	}
	/**
	 * 字符串转指定格式时间
	 * 
	 * @param date
	 * @param parttern
	 * @return
	 */
	public static Date StringToDate(String date, String parttern) {
		Date formatDate = null;
		if (date != null) {
			try {
				formatDate = getDateFormat(parttern).parse(date);
			} catch (Exception e) {
				formatDate = new Date();
			}
		}
		return new Timestamp(formatDate.getTime());
	}
	/*----------------------结束----------------------*/
	
}
