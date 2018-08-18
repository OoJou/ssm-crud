package com.OoJou.pojo;

import java.util.HashMap;
import java.util.Map;



/**
 * 自定义状态码+提示信息 打包返回结果
 * 
 * @author www34
 *
 */
public class Msg {

	// 状态，100-成功，200-失败
	private int code;
	// 提示信息
	private String msg;

	// 要返回到浏览器的数据，这里进行打包
	private Map<String, Object> extend = new HashMap<String, Object>();

	// 成功状态-100返回值
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("处理成功");
		return result;
	}
	
	//用于链式操作Msg.success().add("pageInfo", page);
	public Msg add(String key,Object value){
		this.getExtend().put(key, value);
		return this;
	}

	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("处理失败！");
		return result;
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

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

}
