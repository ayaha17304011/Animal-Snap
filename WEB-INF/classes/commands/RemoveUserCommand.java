package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class RemoveUserCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        AnimalDao dao = new AnimalDao();
        RequestContext reqc=getRequestContext();

	      HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
			  HttpSession session = req.getSession();
  			String userId = (String)session.getAttribute("userId");
        String sql  = "UPDATE as_user SET state = 0 WHERE userId = " + userId;
        System.out.println(sql);

        OraConnectionManager.getInstance().beginTransaction();
        dao.SQLUpdate(sql);
        OraConnectionManager.getInstance().closeConnection();

      resc.setTarget("timeline");
      return resc;
    }
}