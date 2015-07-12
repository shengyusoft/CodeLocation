package com.wtkj.common.utils;

import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;

public class SmsUtil {
	/**
	 * 例 http://www.139000.com/send/gsend.asp?name=company&pwd=1234&dst=1393710*
	 * **4,1393710***5 &sender=&time=&txt=ccdx&msg=你好吗 例
	 * http://www.139000.com/send/gsend.asp?
	 * name=company&pwd=1234&dst=1393710***4,1393710***5
	 * &sender=&time=&txt=ccdx&msg=你好吗
	 * 
	 * @param args
	 * @throws IOException
	 * @throws HttpException
	 */
	public static void main(String[] args) throws HttpException, IOException {
		HttpClient client = new HttpClient();
		PostMethod post = new PostMethod("http://www.139000.com/send/gsend.asp");
		post.addRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=GB2312");// 在头文件中设置转码
		
		NameValuePair[] data = { new NameValuePair("name", "hckj2015"),// 注册的用户名
				new NameValuePair("pwd", "hckj2015"),// 注册成功后，登录网站后得到的密钥
				new NameValuePair("dst", "18326145167"),// 手机号码
				new   NameValuePair("sender", ""),// 手机号码
				new NameValuePair("time", ""),// 手机号码
				new NameValuePair("txt", "ccdx"),// 手机号码
				new NameValuePair("msg", "测试"),// 短信内容
		};
		post.setRequestBody(data);
		client.executeMethod(post);
		Header[] headers = post.getResponseHeaders();
		int statusCode = post.getStatusCode();
		System.out.println("statusCode:" + statusCode);
		for (Header h : headers) {
			System.out.println("---" + h.toString());
		}
		String result = new String(post.getResponseBodyAsString().getBytes(
				"gb2312"));
		
		String result1 = new String(post.getResponseBodyAsString().getBytes(
				"gbk"));
		
		String result2 = new String(post.getResponseBodyAsString().getBytes(
				"utf-8"));
		
		System.out.println(post.getResponseBodyAsString());
		System.out.println("result1--->"+result);
		System.out.println("result2--->"+result1);
		System.out.println("result3--->"+result2);

	}

}
