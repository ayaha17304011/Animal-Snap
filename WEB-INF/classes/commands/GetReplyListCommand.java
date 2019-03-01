package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import beans.PostBean;
import java.util.List;
import ex.*;

public class GetReplyListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc) throws ApplicationException{
        AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();
        PostBean pb = new PostBean();
        String[] pid = reqc.getParameter("postId");
        pb.setPostId(pid[0]);
        OraConnectionManager.getInstance().beginTransaction();
        List result = dao.getReplyList(pb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("replylist");
        return resc;
    }
}