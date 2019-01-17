package commands;

import main.ResponseContext;
import main.RequestContext;
import beans.ReplyBean;
import dao.AnimalDao;

public class AddReplyCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
        AnimalDao dao = new AnimalDao();
		// ReplyBean rb = new ReplyBean();

		String[] userIdArr = reqc.getParameter("userId");
		String[] postIdArr = reqc.getParameter("postId");
		String[] replyArr = reqc.getParameter("reply");
		String userId = userIdArr[0];
		String postId = postIdArr[0];
		String reply = replyArr[0];
		// rb.setReply(reply);
		// rb.setPostId(postid);

		String sql = "insert into as_reply(userId, postId, reply, timestamp) values("+userId+","+postId+","+reply+",default)";
		dao.SQLUpdate(sql);
		resc.setTarget("timeline"); // <= “¯‚¶URL‚É–ß‚·
		return resc;
	}
}