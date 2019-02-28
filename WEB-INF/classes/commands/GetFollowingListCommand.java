package commands;

import javax.servlet.http.HttpServletRequest;
import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import beans.UserBean;
import dao.AnimalDao;
import java.util.ArrayList;
import ex.*;

public class GetFollowingListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc) throws ApplicationException{
        ArrayList<UserBean> result = new ArrayList<UserBean>();
        UserBean ub = new UserBean();
        AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();
        
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
        String[] userIdArr = (String[])reqc.getParameter("userId");
        String userId = userIdArr[0];

		OraConnectionManager.getInstance().beginTransaction();
        ArrayList following = dao.getFollowinglist(userId);
		OraConnectionManager.getInstance().closeConnection();

		OraConnectionManager.getInstance().beginTransaction();
        for(int i=0; i<following.size(); i++){
            String uid = (String)following.get(i);
            ub = dao.getUserInfo(uid);
            result.add(ub);
        }
		OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("followinglist");
        return resc;
    }
}