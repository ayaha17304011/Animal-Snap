package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import beans.FollowBean;
import dao.AnimalDao;
import beans.UserBean;
import java.util.ArrayList;

public class GetFollowerListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        ArrayList<UserBean> result = new ArrayList<UserBean>();
        UserBean ub = new UserBean();
        AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();

        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");

        OraConnectionManager.getInstance().beginTransaction();
        ArrayList followers = dao.getFollowerlist(userId);
        OraConnectionManager.getInstance().closeConnection();

        System.out.println("followers userid "+followers);

        OraConnectionManager.getInstance().beginTransaction();
        for(int i=0; i<followers.size(); i++){
            String uid = (String)followers.get(i);
            ub = dao.getUserInfo(uid);
            result.add(ub);
        }
        OraConnectionManager.getInstance().beginTransaction();

        resc.setResult(result);
        resc.setTarget("followerlist");
		// resc.setTarget("mypage");mypage?userId=${sessionScope.userId}
        return resc;
    }
}