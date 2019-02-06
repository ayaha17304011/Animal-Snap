package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import beans.PostBean;
import dao.AnimalDao;
import java.util.ArrayList;

public class GetMyLikeCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        ArrayList<PostBean> result = new ArrayList<PostBean>();
        AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();
        
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");

        ArrayList postid = dao.getMyLike(userId);
        System.out.println("liked postid "+postid);

        for(int i=0; i<postid.size(); i++){
            String pid = (String)postid.get(i);
            PostBean pb = new PostBean();
            pb.setPostId(pid);
            pb = dao.getPost(pb);
            result.add(pb);
        }

        resc.setResult(result);
        resc.setTarget("mylikelist");
        return resc;
    }
}