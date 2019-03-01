package commands;

import main.ResponseContext;
import main.RequestContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;
import dao.OraConnectionManager;
import dao.AnimalDao;
import ex.*;

public class GetPostListCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) throws ApplicationException{
		AnimalDao dao = new AnimalDao();
		RequestContext reqc = getRequestContext();
		HttpServletRequest req = (HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
		String uid = (String)session.getAttribute("userId");
		OraConnectionManager.getInstance().beginTransaction();
		List result = dao.getPostList(uid);
		OraConnectionManager.getInstance().closeConnection();
		System.out.println("getpostlist result: "+result);

		resc.setResult(result);
		resc.setTarget("timeline");
		return resc;
	}
}