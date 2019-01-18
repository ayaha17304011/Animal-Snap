package commands;

import main.ResponseContext;
import main.RequestContext;

import java.util.List;
import dao.OraConnectionManager;
import dao.AnimalDao;

public class GetPostListCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		AnimalDao dao = new AnimalDao();
		RequestContext reqc = getRequestContext();
		String[] uid = reqc.getParameter(userId);
		OraConnectionManager.getInstance().beginTransaction();
		List result = dao.getPostList(uid[0]);
		OraConnectionManager.getInstance().closeConnection();
		resc.setResult(result);
		resc.setTarget("timeline");
		return resc;
	}
}