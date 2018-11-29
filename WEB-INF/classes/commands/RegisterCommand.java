package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import beans.UserBean;
import dao.UserDB;

public class RegisterCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
		HttpServletRequest req = (HttpServletRequest)reqc.getRequest();
		UserBean ub = new UserBean();
		String[] loginid = reqc.getParameter("loginid");
		String[] pass = reqc.getParameter("pass");
		ub.setLoginId(loginid[0]);
		ub.setPassword(pass[0]);
		UserDB.addUser(ub);
		
		HttpSession session = req.getSession();
    session.setAttribute("loginUser", ub);
		
		resc.setTarget("showtest");
		return resc;
	}
}