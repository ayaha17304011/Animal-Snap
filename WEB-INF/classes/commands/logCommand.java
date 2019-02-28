package commands;

import main.ResponseContext;
import ex.*;

public class logCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) throws ApplicationException{
		resc.setTarget("login");
		return resc;
	}
}