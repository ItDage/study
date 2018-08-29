package com.study.util;

import java.io.UnsupportedEncodingException;

import org.springframework.stereotype.Component;

@Component
public class IsoToUtf8 {

	public static String change(String str){
		
		if(str != null){
			try {
				str = new String(str.getBytes("iso-8859-1"),"utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return str;
	}
}
