package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
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

        ArrayList followers = dao.getFollowerlist(userId);

        System.out.println("followers userid "+followers);

        for(int i=0; i<followers.size(); i++){
            String uid = (String)followers.get(i);
            ub = dao.getUserInfo(uid);
            result.add(ub);
        }

        resc.setResult(result);
        resc.setTarget("followerlist");
        return resc;
    }
}