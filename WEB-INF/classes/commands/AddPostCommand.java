<<<<<<< HEAD
package commands;

import main.RequestContext;
import main.ResponseContext;
import util.Upload;
import beans.PostBean;

import java.util.ArrayList;

public class AddPostCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
		Upload u = new Upload();
		PostBean pb = u.uploadFlie(reqc);
		
		resc.setTarget("showtest");
		return resc;
	}
=======
package commands;

import dao.PostDB;
import main.RequestContext;
import main.ResponseContext;
import util.Upload;
import beans.PostBean;

import java.util.ArrayList;

public class AddPostCommand extends AbstractCommand{
	public ResponseContext execute(ResponseContext resc){
		RequestContext reqc = getRequestContext();
		Upload u = new Upload();
		PostBean pb = u.uploadFlie(reqc);
		PostDB.addPost(pb);
		resc.setTarget("timeline");
		return resc;
	}
>>>>>>> c5c69c075e9dd4f0e299b7bdcb9668f1a1355ced
}