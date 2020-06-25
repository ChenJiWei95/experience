public class Test{
	public static void main(String[] args){
		State state1 = new State() ;
		State state2 = new State() ;
		state1.setValue("state1") ;
		state2.setValue("state2") ;
		Context conttext = new Context(state1) ;
		conttext.method() ;
		conttext.setState(state2) ;
		conttext.method() ;
	}
}

//状态类
//并持有不同状态的方法

class State{
	private String value ; 
	public void setValue(String value) {
		this.value = value ;
	}
	public String getValue() {
		return value ;
	}
	public void method1(){
		System.out.println("1 state") ;
	}	
	public void method2(){
		System.out.println("2 state") ;
	}

}

//对整体的设置
//

class Context{
	private State state ;
	public Context(State state){
		this.state = state ;
	}
	public void setState(State state) {
		this.state = state ;
	}
	public State getState() {
		return this.state ;
	}
	public void method(){
		if(state.getValue().equals("state1"))
			state.method1() ;
		else
			state.method2() ;
	}
}