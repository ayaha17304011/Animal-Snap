package commands;

import main.RequestContext;
import main.ResponseContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;


public class LogoutCommand extends AbstractCommand{
  public ResponseContext execute(ResponseContext resc){
    RequestContext reqc=getRequestContext();
  	HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
  	HttpSession session = req.getSession();
  	session.invalidate();
    resc.setTarget("login");
    return resc;
  }
}
