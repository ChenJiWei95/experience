public class Test{
	public static void main(String[] args){

	}
}

interface Sourceable{
	public void method() ;
}

class Source implements Sourceable{
	public Source(){}
	public void method(){System.out.println("ԭ����") ;}
}

class Proxy implements Sourceable{
	private Sourceable source ;
	public Proxy(){
		super() ;
		source = new Sourceable() ; 
	}
	public void method(){
		source.method() ;
		System.out.println("�����������") ;}
}