package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import dao.AnimalDao;
import ex.*;

public class RemoveReplyCommand extends AbstractCommand{
  public ResponseContext execute(ResponseContext resc) throws ApplicationException{
    RequestContext reqc = getRequestContext();
    AnimalDao dao = new AnimalDao();
    String[] rid = reqc.getParameter("replyId");
    String[] pid =reqc.getParameter("postId");
    String sql = "DELETE FROM as_reply WHERE replyId = " + rid[0] + " AND postId = " + pid[0] + ")";
    OraConnectionManager.getInstance().beginTransaction();
    dao.SQLUpdate(sql);
    OraConnectionManager.getInstance().closeConnection();
    resc.setTarget("timeline");
    return resc;
  }
}