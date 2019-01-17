package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import beans.FollowBean;
import dao.AnimalDao;


public class FollowCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        FollowBean fb = new FollowBean();
        AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();
        String[] uid = reqc.getParameter("userId");
        fb.setUserId(uid[0]);
        String[] oid = reqc.getParameter("observerId");
        fb.setObserverId(oid[0]);
        OraConnectionManager.getInstance().beginTransaction();
        dao.follow(fb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setTarget("timeline");
        return resc;
    }
}