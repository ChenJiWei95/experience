package com.chen.proxy;
/**
 * 
 * <b>歌手代理类 -- 增加与观众互动以及说谢谢<b>
 * @author 威 
 * <br>2017年9月4日 下午4:38:42 
 *
 */
public class SingerProxy implements ISinger {
	/**
	 * 代理对象
	 */
	Singer singerProxy = null ;
	public SingerProxy(Singer singerProxy){
		this.singerProxy = singerProxy ; 
	}
	public void sing(){
		System.out.println("谢谢大家!!") ;
		singerProxy.sing() ;
		System.out.println("互动img...") ;
		
	}
}
