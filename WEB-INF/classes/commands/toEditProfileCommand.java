package commands;

import main.ResponseContext;

public class toEditProfileCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		resc.setTarget("editprofile");
		return resc;
	}
}