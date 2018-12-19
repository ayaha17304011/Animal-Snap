package commands;

import java.util.List;
import main.ResponseContext;
import dao.PostDB;


public class PostViewCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		
		ArrayList post=PostDB.getPost(postID);
		resc.setResult(post);
		resc.setTarget("showtest");
		return resc;
	}
}