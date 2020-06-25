

public class Test{
	public static void main(String[] args){
		Original o = new Original("ԭ��") ;
		Storage storage = new Storage() ;
		storage.setMemento(o.createMemento()) ;
		System.out.println("ԭ����"+o.getValue()) ;
		o.setValue("�ı�") ;
		System.out.println("�ı䣺"+o.getValue()) ;
		o.restoreMemento(storage.getMemento()) ;
		System.out.println("�ָ���"+o.getValue()) ;
		
	}
}

//
//���ܣ�
	��value�Ĳ���
	��������¼
	�ָ�

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

//������

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

//�洢������


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