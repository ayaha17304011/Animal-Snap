package commands;

import main.RequestContext;
import main.ResponseContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import ex.*;

public class LogoutCommand extends AbstractCommand{
  public ResponseContext execute(ResponseContext resc) throws ApplicationException{
    RequestContext reqc=getRequestContext();
  	HttpServletRequest req =(HttpServletRequest)reqc.getRequest();
  	HttpSession session = req.getSession();
  	session.removeAttribute("userId");
    resc.setTarget("login");
    return resc;
  }
}
