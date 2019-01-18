package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import dao.AnimalDao;
import beans.UserBean;

public class GetUserInfoCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        UserBean ub = null;
        AnimalDao dao = new AnimalDao();
        
        String[] uid = reqc.getParameter("uid");
        OraConnectionManager.getInstance().beginTransaction();
        ub = dao.getUserInfo(uid[0]);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(ub);
        resc.setTarget("");
        return resc;
    }
}