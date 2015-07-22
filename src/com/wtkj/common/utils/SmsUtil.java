package com.wtkj.common.utils;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.druid.util.StringUtils;

public class SmsUtil {
	private static String name;
	private static String pwd;
	protected static final Logger LOGGER = LoggerFactory
			.getLogger(SmsUtil.class);
	static {
		// 读取短信配置信息
		Map<String, String> smsMap = getSmsConfig();
		name = StringUtils.isEmpty(smsMap.get("username")) ? "hckj2015"
				: smsMap.get("username");

		pwd = StringUtils.isEmpty(smsMap.get("password")) ? "hckj2015" : smsMap
				.get("password");
	}

	/**
	 * 
	 * @param msg
	 * @param phone
	 *            ,多个号码用逗号隔开
	 * @throws IOException
	 * @throws HttpException
	 */
	public synchronized static void sendMsg(final String msg, final String phone)
			throws Exception {
		new Thread(new Runnable() {
			@Override
			public void run() {
				HttpClient client = new HttpClient();
				PostMethod post = new PostMethod(
						"http://www.139000.com/send/gsend.asp");
				post.addRequestHeader("Content-Type",
						"application/x-www-form-urlencoded;charset=GB2312");// 在头文件中设置转码

				NameValuePair[] data = { new NameValuePair("name", name),//
						new NameValuePair("pwd", pwd),// 注册成功后，登录网站后得到的密钥
						new NameValuePair("dst", phone),// 手机号码
						new NameValuePair("sender", ""),// 手机号码
						new NameValuePair("time", ""),// 手机号码
						new NameValuePair("txt", "ccdx"),// 手机号码
						new NameValuePair("msg", msg),// 短信内容
				};
				post.setRequestBody(data);
				LOGGER.info("短信发送开始->发送内容为:" + msg + "发送号码:" + phone);

				try {
					client.executeMethod(post);
				} catch (HttpException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				Header[] headers = post.getResponseHeaders();
				StringBuilder sb = new StringBuilder();
				for (Header h : headers) {
					sb.append(h.toString());
				}
				String result = "";
				try {
					result = new String(post.getResponseBodyAsString()
							.getBytes("gb2312"));
					LOGGER.info("短信发送结束,返回状态码为" + post.getStatusCode() + "结果:"
							+ result);
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}).start();
	}

	private static Map<String, String> getSmsConfig() {
		Map<String, String> smsMap = new HashMap<String, String>();
		InputStream inputStream = SmsUtil.class.getClassLoader()
				.getResourceAsStream("config.properties");
		Properties properties = new Properties();
		try {
			properties.load(inputStream);
			smsMap.put("username", properties.getProperty("sms.username"));
			smsMap.put("password", properties.getProperty("sms.password"));
		} catch (IOException ioE) {
			ioE.printStackTrace();
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return smsMap;
	}

	public static void main(String[] args) {
		try {
			sendMsg("员工武晓辉向您发起一笔保证金缴纳业务，金额1000000.00元，转款人姓名张大伟，请查证。",
					"18326145167");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
