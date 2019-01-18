package commands;

import main.RequestContext;
import main.ResponseContext;
import util.Upload;
import beans.PostBean;
import dao.AnimalDao;

import java.util.ArrayList;

public class AddPostCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();

		String[] uid = (String[])reqc.getParameter("userId");
		String[] cap = (String[])reqc.getParameter("caption");
		String[] url = (String[])reqc.getParameter("imageURL");
		String userId = uid[0];
		String caption = cap[0];
		String imageURL = url[0];

		String sql = "INSERT INTO as_post VALUES(as_seq_postId.nextval"+","+userId+"'"+caption+"','"+imageURL+"',sysdate,1)";
		AnimalDao dao = new AnimalDao();
		dao.SQLUpdate(sql);
		
		resc.setTarget("postview");
		return resc;
	}
}
