package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import beans.FollowBean;
import ex.*;

public class FollowCheckCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc) throws ApplicationException{
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
        OraConnectionManager.getInstance().beginTransaction();
		following = dao.followCheck(fb);
        OraConnectionManager.getInstance().closeConnection();
        System.out.println("following: "+following);
        resc.setResult(following);
        resc.setTarget("followcheck");
        return resc;
    }
}