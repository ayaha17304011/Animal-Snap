package commands;

import main.ResponseContext;
import ex.*;

public class uploadCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) throws ApplicationException{
		resc.setTarget("uploadwidget");
		return resc;
	}
}