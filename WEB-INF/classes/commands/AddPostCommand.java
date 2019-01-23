package commands;

import main.RequestContext;
import main.ResponseContext;
import dao.OraConnectionManager;
import dao.AnimalDao;
import util.Upload;
import beans.PostBean;

public class AddPostCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
		PostBean pb = Upload.uploadFile(reqc);
		System.out.println(pb.getUserId());
		String userId = pb.getUserId();
		String caption = pb.getCaption();
		String imageURL = pb.getImageURL();

		String sql = "INSERT INTO as_post(postId, userId, caption, imageURL, timestam, state)" +
		"VALUES(as_seq_postId.nextval,"+userId+",'"+caption+"','"+imageURL+"',sysdate,1)";
		AnimalDao dao = new AnimalDao();
		OraConnectionManager.getInstance().beginTransaction();
		dao.SQLUpdate(sql);
		OraConnectionManager.getInstance().closeConnection();
		
		resc.setTarget("timeline");
		return resc;
	}
}