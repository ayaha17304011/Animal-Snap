package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import beans.UserBean;
import dao.AnimalDao;

public class AddReplyCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
        AnimalDao dao = new AnimalDao();
		UserBean ub = new UserBean();

  		HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
  		HttpSession session = req.getSession();
        ub = session.getAttribute("loginUser");
		System.out.println(ub.getUserName());
		// String[] userIdArr = reqc.getParameter("userId");
		// String[] postIdArr = reqc.getParameter("postId");
		// String[] replyArr = reqc.getParameter("reply");
		// String userId = userIdArr[0];
		// String postId = postIdArr[0];
		// String reply = replyArr[0];

		// INSERT INTO as_post VALUES(as_seq_postId.nextval,1,N'ƒLƒƒƒvƒVƒ‡ƒ“','sample_image\‚Ë‚¸‚Ý\mouse.jpg',default,default);
		// String sql = "insert into as_reply(userId, postId, reply, timestamp) values("+userId+","+postId+","+reply+",default)";
		// dao.SQLUpdate(sql);
		resc.setTarget("timeline"); // <= “¯‚¶URL‚É–ß‚·
		return resc;
	}
}