package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import beans.FollowBean;
import dao.FollowDao;


public class FollowCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        FollowBean fb = new FollowBean();
        FollowDao dao = new FollowDao();
        RequestContext reqc = getRequestContext();
        String[] uid = reqc.getParameter("u");
        pb.setUserId(uid[0]);
        String[] pid = reqc.getParameter("me");
        pb.setObserverId(oid[0]);
        OraConnectionManager.getInstance().beginTransaction();
        dao.follow(fb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setTarget("postview");
        return resc;
    }
}