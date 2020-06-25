package com.chen.proxy;
/**
 * 
 * <b>目标对象<b>
 * @author 威 
 * <br>2017年9月4日 下午4:34:29 
 *
 */
public class Singer implements ISinger {
	public Singer(){}
	public void sing(){
		System.out.println("唱歌") ;
	}
}
