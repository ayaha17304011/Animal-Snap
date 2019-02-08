package commands;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;
import java.util.ArrayList;

public class EditProfileCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){                                                                                                                                                             
        ArrayList<String> result = new ArrayList<String>();
        AnimalDao dao = new AnimalDao();
        RequestContext reqc = getRequestContext();
        
        String[] loginidArr = (String[])reqc.getParameter("loginid");
        String[] usernameArr = (String[])reqc.getParameter("username");
        String[] pass1Arr = (String[])reqc.getParameter("pass1");
        String[] pass2Arr = (String[])reqc.getParameter("pass2");
        String[] profileArr = (String[])reqc.getParameter("profile");
		String loginid = loginidArr[0];
		String username = usernameArr[0];
		String pass1 = pass1Arr[0];
		String pass2 = pass2Arr[0];
		String profile = profileArr[0];

		boolean loginid_empty = loginid.isEmpty();
		boolean username_empty = username.isEmpty();
		boolean pass1_empty = pass1.isEmpty();
		boolean profile_empty = profile.isEmpty();
		
		if(loginid_empty==false || username_empty==false || pass1_empty==false || profile_empty==false){
			String sql = "update as_user set";

			if(loginid_empty==false){//selectしてかぶってないかチェック
				String s = " loginid = '"+loginid+"'";
				sql += s;
			}
			if(username_empty==false){
				if(loginid_empty==false){
					sql+=",";
				}
				String s = " username = '"+username+"'";
				sql += s;
			}
			if(pass1_empty==false && pass1.equals(pass2)){
				if(loginid_empty==false || username_empty==false){
					sql+=",";
				}
				String s = " password = '"+pass1+"'";
				sql += s;
			}
			if(profile_empty==false){
				if(loginid_empty==false || username_empty==false || pass1_empty==false){
					sql+=",";
				}
				String s = " profile = '"+profile+"'";
				sql += s;
			}

	        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
			HttpSession session = req.getSession();
			String userId = (String)session.getAttribute("userId");
			String s = " where userid = " + userId;
			sql += s;

			System.out.println(sql);

			OraConnectionManager.getInstance().beginTransaction();
			dao.SQLUpdate(sql);
			OraConnectionManager.getInstance().closeConnection();
		}
		
		resc.setTarget("timeline");
		return resc;
	}
}