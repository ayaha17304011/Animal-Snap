package main;

import java.io.IOException;

public interface ApplicationController { 
	RequestContext getRequest(Object request);
	ResponseContext handleRequest(RequestContext reqc) throws IOException;
	void handleResponse(RequestContext req, ResponseContext res);
}