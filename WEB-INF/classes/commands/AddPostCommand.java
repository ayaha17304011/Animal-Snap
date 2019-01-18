package commands;

import main.RequestContext;
import main.ResponseContext;
import dao.OraConnectionManager;
import dao.AnimalDao;

public class AddPostCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();

		String[] uid = (String[])reqc.getParameter("userId");
		String[] cap = (String[])reqc.getParameter("caption");
		String[] url = (String[])reqc.getParameter("imageURL");
		String userId = uid[0];
		String caption = cap[0];
		String imageURL = url[0];

		AnimalDao dao = new AnimalDao();
		String sql = "INSERT INTO as_post VALUES(as_seq_postId.nextval"+","+userId+"'"+caption+"','"+imageURL+"',sysdate,1)";
        OraConnectionManager.getInstance().beginTransaction();
		dao.SQLUpdate(sql);
        OraConnectionManager.getInstance().closeConnection();
		
		resc.setTarget("postview");
		return resc;
	}
}