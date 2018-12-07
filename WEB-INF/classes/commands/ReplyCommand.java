package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import main.RequestContext;
import dao.ReplyDao;
import dao.OraConnectionManager;
import beans.PostBean;

public class ReplyCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        ReplyDao dao = new ReplyDao();
        PostBean pb = new PostBean();
        RequestContext reqc = getRequestContext();
        String[] reply = reqc.getParameter("reply");
        String[] pid = reqc.getParameter("pid");
        String[] uid = reqc.getParameter("uid");
        pb.setUserId(uid[0]);
        pb.setPostId(pid[0]);
        OraConnectionManager.getInstance().beginTransaction();
        dao.reply(pb, reply[0]);
        OraConnectionManager.getInstance().commit();
        OraConnectionManager.getInstance().closeConnection();

        resc.setTarget("postview");
        return resc;
    }
}