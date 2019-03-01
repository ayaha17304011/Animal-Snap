package commands;

import main.RequestContext;
import main.ResponseContext;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import ex.ApplicationException;

public abstract class AbstractCommand {
	private RequestContext request;
	
	public void init(RequestContext reqc) {
		request=reqc;
	}
	public RequestContext getRequestContext(){
		return request;
	}
	public abstract ResponseContext execute(ResponseContext resc) throws ApplicationException;
}