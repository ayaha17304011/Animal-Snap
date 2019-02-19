package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import dao.AnimalDao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AddReplyCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
        AnimalDao dao = new AnimalDao();
		RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");
        String[] pidArr = (String[])reqc.getParameter("postId");
    	String[] replyArr = (String[])reqc.getParameter("replytext");
    	String postId = pidArr[0];
		String reply = replyArr[0];
		String sql = "insert into as_reply(userId, postId, reply, timestamp) values("+userId+","+postId+",'"+reply+"',default)";
		OraConnectionManager.getInstance().beginTransaction();
		dao.SQLUpdate(sql);
        OraConnectionManager.getInstance().closeConnection();
		
		resc.setTarget("timeline");
		return resc;
	}
}