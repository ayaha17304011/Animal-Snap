package commands;

import main.RequestContext;
import main.ResponseContext;
import dao.OraConnectionManager;
import dao.AnimalDao;
import beans.UserBean;
import beans.PostBean;
import java.util.List;
import java.util.ArrayList;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        ArrayList result = new ArrayList();
		RequestContext reqc = getRequestContext();

        String[] pidArr = (String[])reqc.getParameter("postId");
        String pid = pidArr[0];

        AnimalDao dao = new AnimalDao();
        PostBean pb = new PostBean();
        pb.setPostId(pid);
        OraConnectionManager.getInstance().beginTransaction();
        List replyList = dao.getReplyList(pb);
        pb = dao.getPost(pb);
        OraConnectionManager.getInstance().closeConnection();

        result.add(pb);
        result.add(replyList);

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}