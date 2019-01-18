package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import beans.FollowBean;
import dao.AnimalDao;

public class GetFollowerListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        AnimalDao dao = new AnimalDao();
        String[] uid = reqc.getParameter("uid");

        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getFollowerlist(uid[0]);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}