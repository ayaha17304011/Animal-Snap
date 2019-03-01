package main;

import commands.CommandFactory;
import commands.AbstractCommand;

import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import ex.ApplicationException;

public class WebApplicationController implements ApplicationController{
	public RequestContext getRequest(Object request){
		RequestContext reqc = new WebRequestContext();
		reqc.setRequest(request);
		return reqc;
	}
	public ResponseContext handleRequest(RequestContext req) throws IOException{
		AbstractCommand command = CommandFactory.getCommand(req);
		command.init(req);
		try{
			ResponseContext resc = command.execute(new WebResponseContext());
			return resc;
		}catch(ApplicationException e){
			throw new IOException(e.getMessage(),e);
		}
	}
	public void handleResponse(RequestContext reqc, ResponseContext resc){
		HttpServletRequest req = (HttpServletRequest)reqc.getRequest();
		HttpServletResponse res = (HttpServletResponse)resc.getResponse();
		req.setAttribute("data", resc.getResult());

		RequestDispatcher dispatcher = req.getRequestDispatcher(resc.getTarget());
		
		try{
			dispatcher.forward(req, res);
		}catch (ServletException e){
			e.printStackTrace();
		}catch (IOException e){
			e.printStackTrace();
		}
	}
}