package commands;

import main.ResponseContext;
import ex.*;

public class signupCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) throws ApplicationException{
		resc.setTarget("regist");
		return resc;
	}
}