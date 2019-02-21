package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import beans.UserBean;

public class RegisterCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
        AnimalDao dao = new AnimalDao();

        String[] loginid = reqc.getParameter("loginid");
        String[] username = reqc.getParameter("username");
        String[] password = reqc.getParameter("pass");
        UserBean ub = new UserBean();
        ub.setLoginId(loginid[0]);
        ub.setUserName(username[0]);
        ub.setPassword(password[0]);
        
        String sql = "INSERT into as_user(userid,loginid,password,username,iconpath,state) "+
        "values (as_seq_userId.nextval,'"+ ub.getLoginId() +"','" + ub.getPassword() + "','"+ ub.getUserName() +"','https://ucarecdn.com/94ec68b7-e60f-48c3-bac0-e15f2cbe2ed5/default_icon.png',1) ";

        OraConnectionManager.getInstance().beginTransaction();
        if(!dao.isExist(ub.getLoginId())){
            dao.SQLUpdate(sql);
            String result = dao.Login(ub);
            HttpSession session = req.getSession();
            session.setAttribute("userId", result);
            resc.setTarget("timeline");//オススメページ
        }else{
            resc.setTarget("login");
            resc.setResult("Login ID already used");
        }
        OraConnectionManager.getInstance().closeConnection();
        return resc;
    }
}