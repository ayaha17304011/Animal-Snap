package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.GetPostViewDao;
import dao.OracleConnectionManager;

import beans.PostBean;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        //test version
        PostBean pb = new PostBean();
        pb.setPostId("1");
        GetPostViewDao dao = new GetPostViewDao();
        OracleConnectionManager.getInstance().beginTransaction();
        Object result = dao.getPost(pb);
        OracleConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}