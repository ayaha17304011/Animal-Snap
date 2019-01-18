package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import dao.AnimalDao;

public class RemoveReplyCommand extends AbstractCommand{
  public ResponseContext execute(ResponseContext resc){
    RequestContext reqc = getRequestContext();
    AnimalDao dao = new AnimalDao();
    String[] rid = reqc.getParameter("replyId");
    String sql = "DELETE FROM as_reply WHERE replyId = " + rid[0];
    OraConnectionManager.getInstance().beginTransaction();
    dao.SQLUpdate(sql);
    OraConnectionManager.getInstance().closeConnection();
    resc.setTarget("timeline");
    return resc;
  }
}