package commands;

import main.ResponseContext;
import main.RequestContext;
import javax.servlet.http.HttpServletRequest;
import dao.OraConnectionManager;
import dao.AnimalDao;
import beans.PostBean;
import java.util.List;
import ex.*;

public class GetUserPostsCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc) throws ApplicationException{
        AnimalDao dao = new AnimalDao();
		RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		String userId = req.getParameter("userId");

		OraConnectionManager.getInstance().beginTransaction();
		List list = dao.getUserPosts(userId);
		OraConnectionManager.getInstance().closeConnection();
		
		resc.setResult(list);
		resc.setTarget("userposts");
		return resc;
	}
}