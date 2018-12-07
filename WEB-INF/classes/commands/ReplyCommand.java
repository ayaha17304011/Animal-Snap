package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.ReplyDao;
import dao.OraConnectionManager;
import beans.PostBean;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        ReplyDao dao = new ReplyDao();
        PostBean pb = new PostBean();
        HttpServletRequest req = resc.getRequest();
        String reply = req.getParameter("reply");

        OraConnectionManager.getInstance().beginTransaction();
        dao.reply(pb, reply);
        OraConnectionManager.getInstance().closeConnection();

        resc.setTarget("postview");
        return resc;
    }
}