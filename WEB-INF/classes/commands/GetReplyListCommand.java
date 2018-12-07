package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.GetReplyListDao;
import dao.OraConnectionManager;
import beans.PostBean;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        GetReplyListDao dao = new GetReplyListDao();
        PostBean pb = new PostBean();

        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getReplyList(pb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}