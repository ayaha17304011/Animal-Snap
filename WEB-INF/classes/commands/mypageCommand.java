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
		UserBean ub = new UserBean();
		RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
		String userId = req.getParameter("userId");
		OraConnectionManager.getInstance().beginTransaction();
		boolean flag = dao.ExistUser(userId);
		if(flag==true){
			ub = dao.getUserInfo(userId);
		}else{
			System.out.println("çÌèúÇ≥ÇÍÇΩÉÜÅ[ÉUÅ[Ç≈Ç∑");
		}
		OraConnectionManager.getInstance().closeConnection();
		System.out.println("Exsict User : "+flag);
		resc.setResult(ub);
		resc.setTarget("mypage");
		return resc;
	}
}