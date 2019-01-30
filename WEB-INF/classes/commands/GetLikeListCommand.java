package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import beans.LikeBean;
import dao.AnimalDao;

public class GetLikeListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        AnimalDao dao = new AnimalDao();
        LikeBean lb = new LikeBean();
        String[] pid = reqc.getParameter("pid");
        lb.setPostId(pid[0]);
        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getLikeList(lb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}