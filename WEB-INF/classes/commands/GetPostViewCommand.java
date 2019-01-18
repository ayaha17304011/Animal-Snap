package commands;

import main.ResponseContext;
import main.RequestContext;
import dao.AnimalDao;
import dao.OraConnectionManager;

public class GetPostViewCommand extends AbstractCommand{
    public ResponseContext execute(ResponseContext resc){
        RequestContext reqc = getRequestContext();
        AnimalDao dao = new AnimalDao();
        String[] pid = reqc.getParameter("postId"); 
        OraConnectionManager.getInstance().beginTransaction();
        Object result = dao.getPost(pid[0]);
        OraConnectionManager.getInstance().closeConnection();

        resc.setResult(result);
        resc.setTarget("postview");
        return resc;
    }
}