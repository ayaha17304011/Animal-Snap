package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import main.RequestContext;
import dao.GetLikeListDao;
import dao.OraConnectionManager;
import beans.LikeBean;

public class GetLikeListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        GetLikeListDao dao = new GetLikeListDao();
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