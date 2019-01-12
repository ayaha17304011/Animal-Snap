package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.LikeDao;
import dao.OraConnectionManager;
import beans.PostBean;

public class LikeCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        PostBean pb = new PostBean();
        LikeDao dao = new LikeDao();
        RequestContext reqc = getRequestContext();
        String[] uid = reqc.getParameter("uid");
        pb.setUserId(uid[0]);
        String[] pid = reqc.getParameter("pid");
        pb.setPostId(pid[0]);
        OraConnectionManager.getInstance().beginTransaction();
        dao.like(pb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setTarget("postview");
        return resc;
    }
}