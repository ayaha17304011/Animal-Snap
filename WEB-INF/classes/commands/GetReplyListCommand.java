package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import main.RequestContext;
import dao.GetReplyListDao;
import dao.OraConnectionManager;
import beans.PostBean;

public class GetReplyListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        GetReplyListDao dao = new GetReplyListDao();
        RequestContext reqc = getRequestContext();
        PostBean pb = new PostBean();
        String[] pid = reqc.getParameter("pid");
        pb.setPostId(pid[0]);
        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getReplyList(pb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}