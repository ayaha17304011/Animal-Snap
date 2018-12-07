package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.PostDB;

import java.util.List;
import dao.OracleConnectionManager;
import dao.GetPostListDao;

public class GetPostListCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		GetPostListDao dao = new GetPostListDao();
		OracleConnectionManager.getInstance().beginTransaction();
		List result = dao.getPostList();
		OracleConnectionManager.getInstance().closeConnection();
		resc.setResult(result);
		resc.setTarget("timeline");
		return resc;
	}
}