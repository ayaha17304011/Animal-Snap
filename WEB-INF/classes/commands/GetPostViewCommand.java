package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.GetPostViewDao;
import dao.OraConnectionManager;

import beans.PostBean;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        //test version
        PostBean pb = new PostBean();
        pb.setPostId("1");
        GetPostViewDao dao = new GetPostViewDao();
        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getPost(pb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}