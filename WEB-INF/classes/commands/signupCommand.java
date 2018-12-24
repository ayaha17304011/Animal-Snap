package commands;

import main.ResponseContext;

public class signupCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		resc.setTarget("regist");
		return resc;
	}
}