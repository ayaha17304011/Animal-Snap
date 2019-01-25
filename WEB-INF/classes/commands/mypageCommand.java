package commands;

import main.ResponseContext;

public class mypageCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		resc.setTarget("mypage");
		return resc;
	}
}