package commands;

import main.ResponseContext;
import main.RequestContext;
import javax.servlet.http.HttpServletRequest;
import dao.OraConnectionManager;
import dao.AnimalDao;
import beans.PostBean;
import java.util.List;

public class GetUserPostsCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        AnimalDao dao = new AnimalDao();
		RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		String userId = req.getParameter("userId");
		System.out.println(userId);
		OraConnectionManager.getInstance().beginTransaction();
		List list = dao.getUserPosts(userId);
		OraConnectionManager.getInstance().closeConnection();
		System.out.println(list);
		resc.setResult(list);
		resc.setTarget("userposts");
		return resc;
	}
}