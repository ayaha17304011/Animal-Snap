package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;

public class RemoveUserCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){

        AnimalDao dao = new AnimalDao();

        RequestContext reqc=getRequestContext();

        String[] userid = reqc.getParameter("userid");

        String sql  = "UPDATE as_user SET state = 0 WHERE userId = " + userid[0];

        
        OraConnectionManager.getInstance().beginTransaction();
        dao.SQLUpdate(sql);
    	
        OraConnectionManager.getInstance().closeConnection();

      resc.setTarget("timeline");
      return resc;
    }
  }