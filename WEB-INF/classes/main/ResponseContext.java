package main;

public interface ResponseContext{
	public Object getResult();
	public String getTarget();
	public void setResult(Object obj);
	public void setTarget(String transferInfo);
	public void setResponse(Object obj);
	public Object getResponse();
}