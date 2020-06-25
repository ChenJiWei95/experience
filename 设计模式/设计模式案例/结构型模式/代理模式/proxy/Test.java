package com.chen.proxy;
/**
 * 
 * <b>此类是测试代理实验 -- 相关类ISinger.java, Singer.java, SingerProxy.java<b>
 * @author 威 
 * <br>2017年9月4日 下午4:46:22 
 * @see 通过接口ISinger获取代理权取调用执行sing
 *
 */
public class Test {
	public static void main(String[] args){
		//目标对象
		ISinger singer = new Singer() ;
		System.out.println("常规歌手") ;
		singer.sing() ;
		System.out.println("加了动作的歌手") ; 
		//代理对象
		ISinger singerProxy = new SingerProxy((Singer) singer) ;
		singerProxy.sing() ;
	}
}
