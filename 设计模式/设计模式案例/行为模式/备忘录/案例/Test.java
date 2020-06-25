

public class Test{
	public static void main(String[] args){
		Original o = new Original("原来") ;
		Storage storage = new Storage() ;
		storage.setMemento(o.createMemento()) ;
		System.out.println("原来："+o.getValue()) ;
		o.setValue("改变") ;
		System.out.println("改变："+o.getValue()) ;
		o.restoreMemento(storage.getMemento()) ;
		System.out.println("恢复："+o.getValue()) ;
		
	}
}

//
//功能：
	对value的操作
	创建备忘录
	恢复

class Original{
	private String value ;
	public Original(String value) {
		this.value = value ;
	}
	public void setValue(String value){
		this.value = value ;
	}

	public String getValue(){
		return this.value ;
	}
	
	public Memento createMemento(){
		return new Memento(value) ;
	}

	public void restoreMemento(Memento memento){
		this.value = memento.getValue() ;
	}
}

//备忘类

class Memento{
	private String value ;
	public Memento(String value){
		this.value = value ;
	}
	public void setValue(String value){
		this.value = value ;
	}

	public String getValue(){
		return this.value ;
	}
}

//存储备忘类


class Storage{
	private Memento memento ;
	public Storage(){}
	public void setMemento(Memento memento){
		this.memento = memento ;
	}

	public Memento getMemento(){
		return this.memento ;
	}
	
}