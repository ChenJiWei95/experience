public class Test{
	public static void main(String[] args){
		System.out.println("hellow") ;
	}
}

interface Subject{
	public void accept() ;
	public Subject getSubject() ;
}

interface Visitor{
	public void visit() ;
}


