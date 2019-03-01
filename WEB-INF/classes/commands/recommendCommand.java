package commands;

import main.ResponseContext;
import java.util.List;
import java.util.ArrayList;
import dao.OraConnectionManager;
import dao.AnimalDao;
import beans.UserBean;
import beans.PostBean;

public class recommendCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		AnimalDao dao = new AnimalDao();
		ArrayList<UserBean> user_result = new ArrayList<UserBean>();
		ArrayList<PostBean> post_result = new ArrayList<PostBean>();
		ArrayList<ArrayList> result = new ArrayList<ArrayList>();

		OraConnectionManager.getInstance().beginTransaction();
		ArrayList<ArrayList<String>> list = dao.recommend();
		OraConnectionManager.getInstance().closeConnection();

		ArrayList<String> user_list = list.get(0);
		for(int i=0; i<user_list.size(); i++){
			String userId = user_list.get(i);
			UserBean ub = dao.getUserInfo(userId);
			user_result.add(ub);
		}

		ArrayList<String> post_list = list.get(1);
		for(int i=0; i<post_list.size(); i++){
			String postId = post_list.get(i);
			PostBean pb = new PostBean();
			pb.setPostId(postId);
			pb = dao.getPost(pb);
			post_result.add(pb);
		}

		result.add(user_result);
		result.add(post_result);
		resc.setResult(result);
		resc.setTarget("search");
		return resc;
	}
}