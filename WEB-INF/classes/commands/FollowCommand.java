package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import beans.FollowBean;
import dao.AnimalDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import ex.*;

public class FollowCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc) throws ApplicationException{
        FollowBean fb = new FollowBean();
        AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();

        String[] uid = reqc.getParameter("userId");
        String userId = uid[0];
        fb.setUserId(userId);

	    HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
  		String oid = (String)session.getAttribute("userId");
        fb.setObserverId(oid);

        if(userId.equals(oid)){
            System.out.println("自分はフォローできないよ"); //自分のページではフォローするボタンをjsで非表示にする
        }
        else{
            OraConnectionManager.getInstance().beginTransaction();
            dao.follow(fb);
            OraConnectionManager.getInstance().closeConnection();
        }

        resc.setTarget("followcheck");
        return resc;
    }
}