package commands;

import dao.PostDB;
import main.RequestContext;
import main.ResponseContext;
import util.Upload;
import beans.PostBean;

import java.util.ArrayList;

public class testCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
		Upload u = new Upload();
		System.out.println("1");
		PostBean pb = u.uploadFlie(reqc);
		System.out.println("2");
		PostDB.addPost(pb);
		ArrayList db = PostDB.getPostDB();
		resc.setResult(db);
		resc.setTarget("showtest");
		return resc;
	}
}