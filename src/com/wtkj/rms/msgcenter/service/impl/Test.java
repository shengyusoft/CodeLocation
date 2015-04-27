package com.wtkj.rms.msgcenter.service.impl;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;

public class Test {

	public static void main(String[] args) throws UnknownHostException {
		String s1 = "create_column";
		System.out.println(s1.replace("_column", ""));
		
		Date date = new Date();
		
		System.out.println(date.getDate());
		System.out.println(date.getDay());
		
		InetAddress addr = InetAddress.getLocalHost();
		String ip=addr.getHostAddress().toString();//获得本机IP
		String address=addr.getHostName().toString();//获得本机名称
		
		System.out.println(ip);
		System.out.println(address);
	}
}
