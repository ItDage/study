package com.study.aop;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.study.entity.LogRecord;
import com.study.entity.User;
import com.study.service.LogService;

@Aspect
@Component
public class LogAop {
	
	@Autowired
	private LogService logService;

	@Pointcut("within(com.study.controller.*)")
	public void point(){
		
	}
	
	@Around("point()")
	public Object addLog(ProceedingJoinPoint poin){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		try {
			LogRecord logRecord = new LogRecord();
			String url = request.getRequestURI();
			User user = (User)request.getSession().getAttribute("user");
			if(user != null){
				logRecord.setMail(user.getMail());
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH24:mm:ss");
				String scan_time = simpleDateFormat.format(new Date());
				logRecord.setUrl(url);
				logRecord.setScan_time(scan_time);
				logService.add(logRecord);
			}
			Object proceed = poin.proceed();
			return proceed;
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return null;
	}
}
