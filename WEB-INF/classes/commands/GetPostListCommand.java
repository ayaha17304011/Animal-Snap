package commands;

import main.ResponseContext;
import main.RequestContext;

import java.util.List;
import dao.OraConnectionManager;
import dao.AnimalDao;

public class GetPostListCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		AnimalDao dao = new AnimalDao(); 
		OraConnectionManager.getInstance().beginTransaction();
		List result = dao.getPostList();
		OraConnectionManager.getInstance().closeConnection();
		resc.setResult(result);
		resc.setTarget("timeline");
		return resc;
	}
}