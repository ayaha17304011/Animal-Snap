package commands;

import main.ResponseContext;
import main.RequestContext;
import beans.ReplyBean;


public class AddReplyCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
		ReplyBean rb = new ReplyBean();
		String[] reply = reqc.getParameter("reply");
		String[] pid = reqc.getParameter("postId");
		String uid = 
		rb.setReply(reply[0]);
		rb.setPostId(pid[0]);
		String sql = "insert into as_reply(replyId, userId, postId, reply) values(as_seq_replyId.next_val, , ,)";
		dao.SQLUpdate(sql);
		resc.setTarget("showtest");
		return resc;
	}
}