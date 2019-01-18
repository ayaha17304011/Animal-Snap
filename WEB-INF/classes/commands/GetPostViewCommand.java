package commands;

import main.ResponseContext;
import dao.AnimalDao;
import dao.OraConnectionManager;

import beans.PostBean;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        AnimalDao dao = new AnimalDao();
        String pid = reqc.getParameter("postId"); 
        pb.setPostId(pid[0]);
        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getPost(pb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}