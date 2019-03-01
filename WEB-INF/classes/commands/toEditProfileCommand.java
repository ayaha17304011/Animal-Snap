package commands;

import main.ResponseContext;
import ex.*;

public class toEditProfileCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) throws ApplicationException{
		resc.setTarget("editprofile");
		return resc;
	}
}