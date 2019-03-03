package commands;

import main.RequestContext;
import main.ResponseContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import beans.PostBean;
import dao.OraConnectionManager;
import dao.AnimalDao;
import ex.*;

public class GetNextPostCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc) throws ApplicationException{
		RequestContext reqc = getRequestContext();
        HttpServletRequest req = (HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
        String uid = (String)session.getAttribute("userId");
        String pid = (String)reqc.getParameter("postId")[0];
        PostBean pb = new PostBean();
        pb.setUserId(uid);
        pb.setPostId(pid);
        AnimalDao dao = new AnimalDao();
        ArrayList result = new ArrayList();
        OraConnectionManager.getInstance().beginTransaction();
        result = dao.getNextPost(pb);
        OraConnectionManager.getInstance().closeConnection();
        resc.setResult(result);
        resc.setTarget("nextpost");
        return resc;
    }
}