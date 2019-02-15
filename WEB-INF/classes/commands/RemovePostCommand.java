package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import dao.AnimalDao;

public class RemovePostCommand extends AbstractCommand{
  public ResponseContext execute(ResponseContext resc){
    RequestContext reqc = getRequestContext();
    AnimalDao dao = new AnimalDao();

		HttpServletRequest req = (HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
		String uid = (String)session.getAttribute("userId");
    String[] pid = reqc.getParameter("postId");

    String sql = "UPDATE as_post SET state = 0 WHERE postId = " + pid[0];
    OraConnectionManager.getInstance().beginTransaction();
    dao.SQLUpdate(sql);
    OraConnectionManager.getInstance().closeConnection();
    resc.setTarget("timeline");
    return resc;
  }
}