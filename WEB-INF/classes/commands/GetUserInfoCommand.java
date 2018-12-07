package commands;

import java.util.Map;
import java.util.ArrayList;

import main.ResponseContext;
import dao.GetUserInfoDao;
import dao.OraConnectionManager;
import beans.UserBean;

public class GetUserInfoCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        GetUserInfoDao dao = new GetUserInfoDao();
        UserBean ub = new UserBean();

        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getUserInfo(ub);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        return resc;
    }
}