package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import beans.UserBean;
import dao.AnimalDao;
import java.util.ArrayList;

public class GetFollowingListCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        ArrayList<UserBean> result = new ArrayList<UserBean>();
        UserBean ub = new UserBean();
        AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();
        
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("userId");

        ArrayList following = dao.getFollowinglist(userId);
        System.out.println("following userid "+following);

        for(int i=0; i<following.size(); i++){
            String uid = (String)following.get(i);
            ub = dao.getUserInfo(uid);
            result.add(ub);
        }

        resc.setResult(result);
        resc.setTarget("followinglist");
        return resc;
    }
}