package com.wtkj.rms.functional.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;

public class User {
	private String name;
	private int age;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public static void main(String[] args) throws ParseException {
//		User u = new User();
//		u.setAge(2);
//		u.setName("ss");
//		String className = u.getClass().getName();
//		String pName = u.getClass().getPackage().getName();
//		
//		System.out.println(className);
//		System.out.println(pName);
//		className = className.substring(className.lastIndexOf(".")+1);
//		System.out.println(className);
		
		Date date = DateUtils.parseDate("2014/1/2 15:29:23", "yyyy/mm/dd HH:mm:ss");
		SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd   HH:mm:ss "); 
		
		formatter.format(date);
		System.out.println(date.toString());
		
	}

}
