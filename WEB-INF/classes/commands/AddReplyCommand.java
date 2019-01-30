package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import dao.AnimalDao;

public class AddReplyCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
        AnimalDao dao = new AnimalDao();

		String[] userIdArr = reqc.getParameter("userId");
		String[] postIdArr = reqc.getParameter("postId");
		String[] replyArr = reqc.getParameter("reply");
		String userId = userIdArr[0];
		String postId = postIdArr[0];
		String reply = replyArr[0];
		int count = dao.getNextReplyCount(postId);
		String sql = "insert into as_reply(replyId, userId, postId, reply, timestamp) values("+count+","+userId+","+postId+","+reply+",default)";
        OraConnectionManager.getInstance().beginTransaction();
		dao.SQLUpdate(sql);
        OraConnectionManager.getInstance().closeConnection();
		
		resc.setTarget("timeline");
		return resc;
	}
}