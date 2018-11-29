package commands;

import main.ResponseContext;

public class logCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		resc.setTarget("login");
		return resc;
	}
}