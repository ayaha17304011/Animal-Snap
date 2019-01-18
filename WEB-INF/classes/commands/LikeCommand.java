package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import beans.LikeBean;

public class LikeCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        LikeBean lb = new LikeBean();
        String[] uid = reqc.getParameter("userId");
        String[] pid = reqc.getParameter("postId");
       
        String userId = uid[0];
        String postId = pid[0];
        lb.setPostId(postId);
        lb.setUserId(userId);
		AnimalDao dao = new AnimalDao();
		dao.like(lb);

        resc.setTarget("timeline");
        return resc;
    }
}