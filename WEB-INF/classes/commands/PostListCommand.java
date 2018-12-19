package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.PostDB;

import java.util.ArrayList;

public class PostListCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		ArrayList db = PostDB.getPostDB();
		resc.setResult(db);
		resc.setTarget("showtest");
		return resc;
	}
}