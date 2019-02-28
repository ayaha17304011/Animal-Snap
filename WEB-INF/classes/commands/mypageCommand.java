package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.OraConnectionManager;
import dao.AnimalDao;
import javax.servlet.http.HttpServletRequest;
import beans.UserBean;
import ex.*;

public class mypageCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc) throws ApplicationException{
		boolean flag = false;
		AnimalDao dao = new AnimalDao();
		UserBean ub = new UserBean();
		RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		String userId = req.getParameter("userId");
		OraConnectionManager.getInstance().beginTransaction();
		flag = dao.ExistUser(userId);
		if(flag==true){
			ub = dao.getUserInfo(userId);
		}else{
			System.out.println("çÌèúÇ≥ÇÍÇΩÉÜÅ[ÉUÅ[Ç≈Ç∑");
		}
		OraConnectionManager.getInstance().closeConnection();
		System.out.println("Exist User : "+flag);
		resc.setResult(ub);
		resc.setTarget("mypage");
		return resc;
	}
}