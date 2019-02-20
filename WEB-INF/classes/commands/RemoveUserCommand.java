package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class RemoveUserCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        AnimalDao dao = new AnimalDao();
        RequestContext reqc=getRequestContext();
        ArrayList<String> sqlList = new ArrayList<String>();

	      HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
			  HttpSession session = req.getSession();
  			String userId = (String)session.getAttribute("userId");
        sqlList.add("UPDATE as_user SET state = 0 WHERE userId = " + userId); //user
        sqlList.add("UPDATE as_post SET state = 0 WHERE userId = " + userId); //post
        sqlList.add("delete as_like where userId = " + userId);               //like
        sqlList.add("delete as_reply where userId = " + userId);              //like
        sqlList.add("delete as_follower where userId = " + userId);           //follower
        sqlList.add("delete as_follower where observerId = " + userId);       //following

        for(int i=0; i<sqlList.size(); i++){
          OraConnectionManager.getInstance().beginTransaction();
          dao.SQLUpdate(sqlList.get(i));
          OraConnectionManager.getInstance().closeConnection();
        }

      resc.setTarget("login");
      return resc;
    }
}