package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import beans.PostBean;

import java.util.ArrayList;

public class LikeCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        String[] uid = reqc.getParameter("userId");
        String[] pid = reqc.getParameter("postId");    pb.setPostId(postId[0]);
        String userId = uid[0];
        String postId = pid[0];
        
        String sql = "INSERT INTO as_like VALUES("+userId+"'"+userId+"','"+postId+"',sysdate);"
		AnimalDao dao = new AnimalDao();
		dao.SQLUpdate(sql);
	

        resc.setTarget("postview");
        return resc;
    }
}