//接口适配
public class AdapterText{
	public static  void main(String[] args){

	}
}

interface Sourceable {
	public void method1() ;
	public void method2() ;
}

abstract class Wrapper2 implements Sourceable{
	public void method1(){}
	public void method2(){}
}

//SourceSub1，SourceSub2  分别通过Wrapper2抽象类 调用各自所需的方法
class SourceSub1 extends Wrapper2{
	public void method1(){
		System.out.println("the sourceable interface first Sub1") ;
	}
}


class SourceSub2 extends Wrapper2{
	public void method2(){
		System.out.println("the sourceable interface first Sub2") ;
	}
}