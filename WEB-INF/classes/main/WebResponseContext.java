package main;

import javax.servlet.http.HttpServletResponse;

class WebResponseContext implements ResponseContext{
	private Object result;
	private String target;
	private HttpServletResponse response;

	public WebResponseContext(){}

	public void setResult(Object obj){
		result = obj;
	}
	public Object getResult(){
		return result;
	}
	public void setTarget(String transferInfo){
		target = "/WEB-INF/jsp/" + transferInfo + ".jsp";
	}
	public String getTarget(){
		return target;
	}
	public void setResponse(Object obj){
		response = (HttpServletResponse)obj;
	}
	public Object getResponse(){
		return response;
	}
}