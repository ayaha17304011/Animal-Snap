package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;

public class RegisterCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){

        AnimalDao dao = new AnimalDao();

        RequestContext reqc = getRequestContext();
        String[] loginid = reqc.getParameter("loginid");
        String[] password = reqc.getParameter("pass");

        String sql = "INSERT into as_user(userid,loginid,password,username,iconpath,state) "+
        "values (as_seq_userId.nextval,'"+ loginid[0] +"','" + password[0] + "','"+ loginid[0] +"','sample_image/default_icon.png',1) ";    	
        

        OraConnectionManager.getInstance().beginTransaction();
        dao.SQLUpdate(sql);
        OraConnectionManager.getInstance().closeConnection();

        resc.setTarget("timeline");
        return resc;
    }
}