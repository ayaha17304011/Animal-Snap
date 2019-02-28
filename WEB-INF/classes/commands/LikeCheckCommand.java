package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import beans.LikeBean;
import ex.*;

public class LikeCheckCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc) throws ApplicationException{
        LikeBean lb = new LikeBean();
		AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();
        boolean liked = false;
        final String[] heart = {"outline", "filled"};

        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");
        String[] pidArr = (String[])reqc.getParameter("postId");
    	String postId = pidArr[0];
       
        lb.setPostId(postId);
        lb.setUserId(userId);
        OraConnectionManager.getInstance().beginTransaction();
		liked = dao.likeCheck(lb);
        OraConnectionManager.getInstance().closeConnection();
        resc.setResult(liked);
        System.out.println("liked: "+liked);
        resc.setTarget("likecheck");
        return resc;
    }
}