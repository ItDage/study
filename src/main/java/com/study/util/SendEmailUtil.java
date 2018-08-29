package com.study.util;

import java.util.Properties;
import java.util.Random;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Component;

/**
 * 发送邮件的类
 * @author Administrator
 *
 */
@Component
public class SendEmailUtil {

	// QQ服务器
	private final static String SERVICE_HOEST = "smtp.qq.com";
	// smtp的端口号
	private final static int PORT = 465;
	// 协议名称
	private final static String PROTOCOL = "smtp";
	// 发送邮件的QQ号
	private final static String ACCOUNT = "1418332683@qq.com";
	// QQ授权码
	private final static String AUTH_CODE = "cgwuzqggvugybahd";

	private static final JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();

	// 发送QQ邮件的初始化配置
	static {
		senderImpl.setHost(SERVICE_HOEST);
		senderImpl.setPort(PORT);
		senderImpl.setProtocol(PROTOCOL);
		senderImpl.setUsername(ACCOUNT);
		senderImpl.setPassword(AUTH_CODE);
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");// 将这个参数设置成true,让服务器进行认证,认证用户名和密码是否正确
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");// 使用ssl协议来保证连接安全
		properties.put("mail.smtp.timeout", "25000");// 传输超时时间
		senderImpl.setJavaMailProperties(properties);
	}

	/**
	 * @param accounts
	 *            账户
	 * @param info
	 *            信息
	 * @param title
	 *            主题
	 */
	public static void sendSimpleMail(String accounts, String info, String title) {
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		simpleMailMessage.setTo(accounts);// 设置邮件接受者账号数组
		simpleMailMessage.setFrom(ACCOUNT);// 设置邮件的发送者
		simpleMailMessage.setSubject(title);// 设置邮件的主题
		simpleMailMessage.setText(info);// 设置邮件的内容
		// 发送邮件

		senderImpl.send(simpleMailMessage);

	}

	public static void main(String[] args) {
		// String[] accounts = {"1418332683@qq.com"};
		// String[] accounts = {"1369774000@qq.com"};
		// for (int i = 0; i < 10; i++) {
		// String title = "验证登录 " + i;
		// String info = "测试邮件" + i;
		// sendSimpleMail(accounts, info, title);
		// }
		Random random = new Random();
		int nextInt = random.nextInt(2);
		System.out.println(nextInt);
	}
}
