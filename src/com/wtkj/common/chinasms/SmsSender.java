package com.wtkj.common.chinasms;

import java.io.*;
import java.net.*;

/**
 * 名商通短信平台
 * 
 * @author sunsi
 * 
 */
public class SmsSender {
	/**
	 * 企业用户登陆名
	 */
	private String companyAccount;

	/**
	 * 企业用户登陆密码
	 */
	private String comPwd;

	/**
	 * 名商通短信平台第三方服务地址
	 */
	private String serverUrl;

	public SmsSender() {
		this("default", "default");
	}

	public SmsSender(String companyAccount, String pwd) {
		this.companyAccount = companyAccount;
		this.comPwd = pwd;
		this.serverUrl = "http://www.china-sms.com";
	}

	public SmsSender(String name, String pwd, int serverNum) {
		companyAccount = name;
		comPwd = pwd;
		if (serverNum == 2)
			serverUrl = "http://www6.china-sms.com";
		else
			serverUrl = "http://www.china-sms.com";
	}

	/**
	 * 
	 * @param dst手机号
	 *            用英文逗号分割 ,最后一个手机号后不加逗号, 必填, 小灵通号码发送请和手机号码分离单独作为一组发送。请少于100个号码。
	 * 
	 * @param msg短信内容
	 *            为不超过60个汉字、字符、数字的字符串，小灵通号码不超过40个字。超过的字符自动截掉。如果是超长短信，不能超过240个字符
	 * 
	 * 
	 * @param time定时时间
	 *            (可不填)，例如“200505241713”表示此条短信定时在2005年5月24日17点13分发出。 格式:
	 *            YYYYMMDDHHMM；12位时间表示，不符合规则的将立即进行发送。
	 * 
	 * @param sender 短信类型
	 *            (可不填)，txt=ccdx表示启用超长短信功能。账号需要开通此功能，且通道和手机支持才能使用ss。
	 * 
	 * @return
	 */
	public String massSend(String dst, String msg, String time, String sender,String txt) {
		String sUrl = null;
		try {
			sUrl = serverUrl + "/send/gsend.asp?name=" + companyAccount + "&pwd="
					+ comPwd + "&dst=" + dst + "&msg="
					+ URLEncoder.encode(msg, "GB2312") + "&time=" + time
					+ "&sender=" + sender;
		} catch (UnsupportedEncodingException uee) {
			System.out.println(uee.toString());
		}
		return getUrl(sUrl);
	}

	public String readSms() {
		String sUrl = null;
		sUrl = serverUrl + "/send/readsms.asp?name=" + companyAccount + "&pwd="
				+ comPwd;
		try {
			URLEncoder.encode(sUrl, "GB2312");
		} catch (UnsupportedEncodingException uee) {
			System.out.println(uee.toString());
		}
		return getUrl(sUrl);
	}

	public String getFee() {
		String sUrl = null;
		sUrl = serverUrl + "/send/getfee.asp?name=" + companyAccount + "&pwd="
				+ comPwd;
		return getUrl(sUrl);
	}

	public String changePwd(String newPwd) {
		String sUrl = null;
		sUrl = serverUrl + "/send/cpwd.asp?name=" + companyAccount + "&pwd="
				+ comPwd + "&newpwd=" + newPwd;
		try {
			URLEncoder.encode(sUrl, "GB2312");
		} catch (UnsupportedEncodingException uee) {
			System.out.println(uee.toString());
		}
		return getUrl(sUrl);
	}

	public String checkContent(String content) {
		String sUrl = null;
		sUrl = serverUrl + "/send/checkcontent.asp?name=" + companyAccount
				+ "&pwd=" + comPwd + "&content=" + content;
		try {
			URLEncoder.encode(sUrl, "GB2312");
		} catch (UnsupportedEncodingException uee) {
			System.out.println(uee.toString());
		}
		return getUrl(sUrl);
	}

	public String getUrl(String urlString) {
		StringBuffer sb = new StringBuffer();
		try {
			URL url = new URL(urlString);
			URLConnection conn = url.openConnection();
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					conn.getInputStream()));
			for (String line = null; (line = reader.readLine()) != null;)
				sb.append(line + "\n");

			reader.close();
		} catch (IOException e) {
			System.out.println(e.toString());
		}
		return sb.toString();
	}

}
