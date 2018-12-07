package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.PostDB;

import java.util.List;
import dao.OraConnectionManager;
import dao.GetPostListDao;

public class GetPostListCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		GetPostListDao dao = new GetPostListDao();
		OraConnectionManager.getInstance().beginTransaction();
		List result = dao.getPostList();
		OraConnectionManager.getInstance().closeConnection();
		resc.setResult(result);
		resc.setTarget("timeline");
		return resc;
	}
}