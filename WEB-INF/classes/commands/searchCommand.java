package commands;

import main.ResponseContext;
import main.RequestContext;
import java.util.List;
import java.util.ArrayList;
import dao.OraConnectionManager;
import dao.AnimalDao;
import javax.servlet.http.HttpServletRequest;
import beans.UserBean;
import beans.PostBean;

public class searchCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		AnimalDao dao = new AnimalDao();
		ArrayList<UserBean> user_result = new ArrayList<UserBean>();
		ArrayList<PostBean> post_result = new ArrayList<PostBean>();
		ArrayList<ArrayList> result = new ArrayList<ArrayList>();
		RequestContext reqc = getRequestContext();
        HttpServletRequest req =(HttpServletRequest)reqc.getRequest();

		String query = req.getParameter("query");
        System.out.println(query); //“ú–{Œê•¶Žš‰»‚¯
		OraConnectionManager.getInstance().beginTransaction();
		ArrayList<ArrayList<String>> list = dao.search(query);
		OraConnectionManager.getInstance().closeConnection();

		ArrayList<String> user_list = list.get(0);
		for(int i=0; i<user_list.size(); i++){
			String userId = user_list.get(i);
			System.out.println(userId);
			UserBean ub = dao.getUserInfo(userId);
			user_result.add(ub);
		}

		ArrayList<String> post_list = list.get(1);
		for(int i=0; i<post_list.size(); i++){
			String postId = post_list.get(i);
			System.out.println(postId);
			PostBean pb = new PostBean();
			pb.setPostId(postId);
			pb = dao.getPost(pb);
			post_result.add(pb);
		}

		result.add(user_result);
		result.add(post_result);
		System.out.println(result);
		resc.setResult(result);
		resc.setTarget("search");
		return resc;
	}
}