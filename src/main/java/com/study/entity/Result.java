package com.study.entity;

import org.springframework.stereotype.Component;

@Component
public class Result {
	/*
	 * layui默认接收的字段    可以更改
	 *   code: 0,
	  msg: "",
	  count: 1000,
	  data: []
	  */
	private int code;
	private String msg;
	private int count;
	private Object data;
	private Object data1;
	@Override
	public String toString() {
		return "Result [code=" + code + ", msg=" + msg + ", count=" + count + ", data=" + data + ", data1=" + data1
				+ ", data2=" + data2 + ", data3=" + data3 + "]";
	}
	private Object data2;
	private Object data3;
	
	
	public Object getData1() {
		return data1;
	}
	public void setData1(Object data1) {
		this.data1 = data1;
	}
	public Object getData2() {
		return data2;
	}
	public void setData2(Object data2) {
		this.data2 = data2;
	}
	public Object getData3() {
		return data3;
	}
	public void setData3(Object data3) {
		this.data3 = data3;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
	
}
