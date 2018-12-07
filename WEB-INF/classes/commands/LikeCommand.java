package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.ReplyDao;
import dao.OraConnectionManager;
import beans.PostBean;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        PostBean pb = new PostBean();
        HttpServletRequest req = resc.getRequest();
        int userid = req.getParameter("userid");

        OraConnectionManager.getInstance().beginTransaction();
        dao.like(pb, userid);
        OraConnectionManager.getInstance().closeConnection();

        resc.setTarget("postview");
        return resc;
    }
}