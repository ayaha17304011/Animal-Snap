package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.GetPostViewDao;
import dao.OraConnectionManager;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        GetPostViewDao dao = new GetPostViewDao();

        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getPost();
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}