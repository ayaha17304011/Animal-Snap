package main;

public interface ApplicationController { 
	RequestContext getRequest(Object request);
	ResponseContext handleRequest(RequestContext reqc);
	void handleResponse(RequestContext req, ResponseContext res);
}