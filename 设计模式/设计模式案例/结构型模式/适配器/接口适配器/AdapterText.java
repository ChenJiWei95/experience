//�ӿ�����
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

//SourceSub1��SourceSub2  �ֱ�ͨ��Wrapper2������ ���ø�������ķ���
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