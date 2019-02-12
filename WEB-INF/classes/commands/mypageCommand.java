package commands;

import main.ResponseContext;
import main.RequestContext;
import java.util.List;
import dao.OraConnectionManager;
import dao.AnimalDao;
import javax.servlet.http.HttpServletRequest;
import beans.UserBean;

public class mypageCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		AnimalDao dao = new AnimalDao();
		RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		String userId = req.getParameter("userId");
		OraConnectionManager.getInstance().beginTransaction();
		UserBean ub = dao.getUserInfo(userId);
		// boolean flag = dao.ExistUser(userId);
		// System.out.println(flag);
		OraConnectionManager.getInstance().closeConnection();
		resc.setResult(ub);
		resc.setTarget("mypage");
		return resc;
	}
}