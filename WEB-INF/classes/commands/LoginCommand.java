package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import main.RequestContext;
import main.ResponseContext;
import util.Upload;
import dao.UserDB;
import beans.UserBean;

public class LoginCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
    RequestContext reqc = getRequestContext();
    HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
    
    boolean loginflag= false;
    UserBean userbean = new UserBean();
    
    String[] loginIdArray=(String[])reqc.getParameter("loginid");
    String loginId = loginIdArray[0];
    userbean.setLoginId(loginId);
    
    String[] passArray = (String[])reqc.getParameter("pass");
    String pass = passArray[0];
    userbean.setPassword(pass);

    // AbstractDaoFactory factory = AbstractDaoFactory.getFactory();
    // KretaDao dao = factory.getKretaDao();

    //ログイン情報がデータベースに登録されているか確認する
    // userbean = dao.LoginProcessing(userbean);

    //フォームから入力されたパスワードがあっているか確認する
    if(userbean.getLoginId().equals(loginId) && userbean.getPassword().equals(pass)){
        loginflag = true;
    }else{
        System.out.println("パスワードもしくはIDが違います");
        resc.setResult("パスワードもしくはIDが違います");
        // throw new exp.SystemException("パスワードもしくはIDが違います", new RuntimeException());
    }

    if(loginflag){
        HttpSession session = req.getSession();
        session.setAttribute("loginUser", userbean);
    }

    resc.setTarget("login");
    return resc;
    }
}
