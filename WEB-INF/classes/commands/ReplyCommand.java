package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.ReplyDao;
import dao.OraConnectionManager;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        ReplyDao dao = new ReplyDao();

        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.reply();
        OraConnectionManager.getInstance().closeConnection();

        resc.setTarget("postview");
        return resc;
    }
}