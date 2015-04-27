package com.wtkj.rms.customer.model.po;

import java.text.ParseException;

import org.springframework.beans.BeanUtils;

import com.wtkj.common.utils.DateUtil;

public class Test {
	
	public static void main(String[] args) throws ParseException {
		Quotation q1 =new Quotation();
		q1.setUserId(12);
		q1.setAddDt(DateUtil.convertStringToDate("2014-10-19"));
		q1.setUserName("ss");
		
		
		Quotation q2 =new Quotation();
		q2.setUserId(12);
		
//		BeanUtils.copyProperties(q2, q1);
		System.out.println(q1.getUserId());
		System.out.println(q1.getUserName());
		System.out.println(q1.getAddDt());
		
	}

}
