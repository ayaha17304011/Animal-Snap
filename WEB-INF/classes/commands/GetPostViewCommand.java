package commands;

import java.util.Map;
import java.util.ArrayList;

import main.RequestContext;
import main.ResponseContext;
import dao.OraConnectionManager;
import dao.AnimalDao;
import beans.UserBean;
import beans.PostBean;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
        String[] pidArr = (String[])reqc.getParameter("postId");
        String pid = pidArr[0];

        AnimalDao dao = new AnimalDao();
        PostBean pb = null;

        pb.setPostId(pid);

        OraConnectionManager.getInstance().beginTransaction();
        pb = dao.getPost(pb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(pb);
        resc.setTarget("postview");
        return resc;
    }
}