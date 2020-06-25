
public class Test{
	public static void main(String[] args){
		Collection collection = new MyCollection() ;
		Iterator it = collection.iterator() ;
		while(it.hasNext()){
			 System.out.println(it.next()) ;
		}
		System.out.println(it.first()) ;
	}
}

interface Iterator{
	//前移
	public Object previous() ;
	//后移
	public Object next() ;
	public boolean hasNext() ;
	//取得第一个元素
	public Object first() ;
}

interface Collection{
	public Iterator iterator() ;
	public Object get(int index) ;
	public int size() ;
}

class MyIterator implements Iterator{
	private Collection collection ;
	private int pos = -1 ;
	public MyIterator(Collection collection){
		this.collection = collection ;
	}
	
	//前移
	public Object previous() {
		if(pos > 0) 
			pos -- ;
		return collection.get(pos) ;
	}
	//后移
	public Object next() {
		if(pos<collection.size()-1)
			pos++ ;
		return collection.get(pos) ;
	}
	public boolean hasNext() {
		return pos < collection.size() -1 ;
	}
	//取得第一个元素
	public Object first() {
		return collection.get(0) ;
	}
} 

class MyCollection implements Collection{
	private String[] array = {"15","23","34","54"} ;
	public Iterator iterator() {
		return new MyIterator(this) ;
	}
	public Object get(int index) {
		return array[index] ;
	}
	public int size() {
		return array.length ;
	}
}