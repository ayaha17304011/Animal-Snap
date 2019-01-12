package commands;

import main.RequestContext;
import main.ResponseContext;
import util.Upload;
import beans.PostBean;
import dao.PostDao;

import java.util.ArrayList;

public class PostCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
		Upload u = new Upload();
		PostBean pb = u.uploadFlie(reqc);
		String sql = "insert"
		PostDao dao = new PostDao();
		String[] uid = reqc.getParameter("UserId");
		pb.setUserId(uid[0]);
		dao.SQLUpdate(sql);
		
		resc.setTarget("showtest");
		return resc;
	}
}