package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import beans.FollowBean;

public class FollowCheckCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        FollowBean fb = new FollowBean();
		AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();
        boolean following = false;

        String[] uid = reqc.getParameter("userId");
        String userId = uid[0];
        fb.setUserId(userId);

	    HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
  		String oid = (String)session.getAttribute("userId");
        fb.setObserverId(oid);

		following = dao.followCheck(fb);
        System.out.println("following: "+following);

        resc.setTarget("timeline");
        return resc;
    }
}