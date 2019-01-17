package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

import main.RequestContext;
import main.ResponseContext;
import util.Upload;
import dao.AnimalDao;
import beans.UserBean;

public class LoginCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();

        boolean loginflag= false;
        String result = "";
        UserBean ub = new UserBean();
        AnimalDao dao = new AnimalDao();

        String[] loginIdArray = (String[])reqc.getParameter("loginid");
        String loginId = loginIdArray[0];
        ub.setLoginId(loginId);

        String[] passArray = (String[])reqc.getParameter("pass");
        String pass = passArray[0];
        ub.setPassword(pass);

        // ログイン情報がデータベースに登録されているか確認する
        // ub = dao.LoginProcessing(ub);

        result = dao.Login(ub);

        if(result != null){
            loginflag = true;
        }else{
            System.out.println("パスワードもしくはIDが違います");
        }

        if(loginflag){
            HttpSession session = req.getSession();
            session.setAttribute("loginUser", ub);
            resc.setTarget("timeline");
        }else{
            resc.setTarget("login");
            // resc.setResult("パスワードもしくはIDが違います");
            // throw new exp.SystemException("パスワードもしくはIDが違います", new RuntimeException());
        }
        return resc;
    }
}
