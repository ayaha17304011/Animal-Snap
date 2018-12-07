package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.GetLikeListDao;
import dao.OraConnectionManager;
import beans.LikeBean;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        GetLikeListDao dao = new GetLikeListDao();
        LikeBean lb = new LikeBean();

        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getLikeList(lb);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}