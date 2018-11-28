package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.ReplyDB;

import java.util.ArrayList;

public class ReplyListCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		ArrayList db = ReplyDB.getReplyDB();
		resc.setResult(db);
		return resc;
	}
}